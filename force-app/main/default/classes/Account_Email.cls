public with sharing class Account_Email {
    public Account_Email() {}
    public static void emailalerts(list<Account> acs)
    {
        list<Messaging.singleEmailmessage> lstmail = new list<Messaging.singleEmailMessage>();
        for(Account acc :acs)
        {
           if(acc.Email__c != Null && acc.Email__c != '')
           {
            Messaging.singleemailMessage mail = new Messaging.singleemailmessage();
            
            list<string> toaddress = new list<string>{acc.Email__c, 'vijay.nalagarla2000@gmail.com'};
            mail.settoaddresses(toaddress);

            list<string> ccaddress = new list<string>{'vijay.nalagarla99@gmail.com'};
            mail.setccaddresses(ccaddress);

            list<string> bccaddress = new list<string>{'vijay.nalagarla66@gmail.com'};
            mail.setBccaddresses(bccaddress);

            string mailSubject = 'Dear' + acc.Name + 'Your Account is created';
            mail.setsubject(mailsubject);

            string mailcontent = 'Dear'+acc.Name + '<br/><br/>'+
            'Thanks for showing interest in our Product<br/><br/>'+
            'Your Application is created sucessfully<br/><br/>'+
            '<br/> Account Holder Id..:'+acc.Id+
            '<br/> Account Holder Name...:'+acc.Name +
            '<br/> Contact Number...:'+acc.Phone +
            '<br/> Email address....:'+acc.Email__c +
            '<br/> Account Number...:'+acc.AccountNumber +
            '<br/> Industry Name...:'+acc.Industry +
            '<br/> Type..:'+acc.Type +
            '<br/> Ownership..:'+acc.Ownership +
            '<br/> Customer Rating....:'+acc.Rating +
            '<br/> <br/> will contact you soon'+
            '<i> **** This is Testing Mail ****</i>';
            mail.setHTMLBody(mailcontent);

            Messaging.EmailfileAttachment attach = new Messaging.EmailfileAttachment();

            attach.setfileName(acc.Name +'.Pdf');
            attach.setcontentType('Application/Pdf');
            attach.body = Blob.toPdf(mailcontent);

            list<Messaging.EmailfileAttachment> lstattachments = new list<Messaging.EmailfileAttachment>();
                            lstattachments.add(attach);
                            mail.setfileattachments(lstattachments);

            lstmail.add(mail);
           } 
        }
        if(!lstmail.isempty())
        {
            Messaging.sendEmailResult[] result = Messaging.sendEmail(lstmail);
        }
    }
}