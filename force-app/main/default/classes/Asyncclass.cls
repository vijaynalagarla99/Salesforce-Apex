Global class Asyncclass implements Database.Batchable<SObject>
{
    Global Database.querylocator Start(Database.Batchablecontext Startbcontext)  
    {
        string accountquery = 'select Id, Name, Industry, Rating, AnnualRevene, Phone, type, Fax, CustomerPriority__c, Active__c, SLA__c, Ownershio form Account';
        return Database.getquerylocator(accountquery);
    }
    Global void execute(Database.Batchablecontext bcontext, list<SObject> lstobject)
    {
        if(!lstobject.isempty())
        {
            list<Account> accrecords = new list<Account>();
            for(SObject obj : lstobject)
            {
                Account acc = (Account) obj;
                acc.AnnualRevenue = 6500000;
                acc.CustomerPriority__c = 'Medium';
                acc.Type = 'Installation Partner';
                acc.Ownership = 'Public';
                acc.SLA__c = 'silver';
                
                accrecords.add(acc);
            }
            if(!accrecords.isempty())
            {
                Update accrecords;
            }
        }
    }
    Global void finish(Database.Batchablecontext bcontext)
    {
        system.debug('Batch Job Id...:'+bcontext.getjobid());

        AsyncApexjob jobinfo = [select Id, Status, totaljobitems, numberoferrors, CreatedBy.Email from AsyncApexjob
                                                where Id =: bcontext.getjobid()];
        
        Messaging.singleemailmessage semail = new Messaging.singleemailmessage();

        list<string> toaddress = new list<string> {jobinfo.CreatedBy.Email, 'vijay.nalagarla99@gmail.com'};
        semail.setToaddresses(toaddress);

        list<string> ccaddress = new list<string> {'vijay.nalagarla66@gmail.com'};
        semail.setccaddresses(ccaddress);

        string emailsubject = 'IcIcI bank weekly customer Details Update Batch Status Notifocation: Asyncclass ('+bcontext.getJobId() +')';
        semail.setsubject(emailsubject);

        string emailcontent = 'Dear Customer Support, <br/><br/>'+
        'We are pleased to inform you, that we have Processed the ICICI Bank Customers Weekly Details Update Batch Job Successfully. <br/><br/>'+
        'Hear is the batch job details..:'+
        '<br/> batch job name...:Asyncclass'+
        '<br/> batch job Id..:'+jobinfo.Id +
        '<br/> batch job email Id...:'+jobinfo.CreatedBy.Email +
        '<br/> Batch Job Status...:'+jobinfo.Status +
        '<br/> no of jobs...:'+jobinfo.totaljobitems +
        '<br/> no of Batches failed...:'+jobinfo.numberoferrors +
        '<br/> <br/> Please contact the below if any Queries <br/> <br/>'+
        '***This is the Testing email***<br/><br/>'+
        'Thanks & Regards'+'<br/> ICICI customer support' + '<br/> ICICI Bank PVT';

        semail.setHTMLbody(emailcontent);

        semail.setReplyto(jobinfo.createdby.email);

        semail.setsenderDisplayName('ICICI Bank Customer Support Name');

        Messaging.sendEmailResult[] result = Messaging.sendEmail(new Messaging.singleemailMessage[] {semail});
    }  
}