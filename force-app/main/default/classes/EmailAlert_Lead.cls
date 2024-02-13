public with sharing class EmailAlert_Lead {
    public EmailAlert_Lead() {}
    public static void emailalert(list<Lead> ldrecord)
    {
        if(!ldrecord.isempty())
        {
            list<Messaging.singleEmailMessage> lstemail = new list<Messaging.singleEmailMessage>();
            for (Lead lds : ldrecord)
            {   
                if(lds.Email != Null && lds.Email != '')
                {
                    Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
                    list<string> toaddress = new list<string>{lds.Email, 'vijay.nalagarla99@gmail.com'};
                    semail.SetToAddresses(toaddress);

                    list<string> ccaddress = new list<string>{'vijay.nalagarla66@gmail.com'};
                    semail.setccaddresses(ccaddress);

                    list<string> bccaddress = new list<string>{'vijay.naalgarla830@gmail.com'};
                    semail.setBccaddresses(bccaddress);

                    semail.setReplyto('vijay.nalagarla2000@gmail.com');

                    semail.SetSenderDisplayName('Union Bank Of India');

                    string emailsubject = 'Congratulations'+lds.FirstName + ' '+ lds.LastName + 'Your Lone Application is submited sucessfully';
                    semail.setsubject(emailsubject);

                    string emailcontent = 'Dear'+ lds.FirstName + ' ' + lds.LastName +',<br/><br/>'+'Thanks for showing interest in our Personal lone service <br/><br/>'+
                                            'We are Place to inform you, that your Personal lone application has been submited sucessfully. <br/><br/>'+
                                            'Hear are your lone application details <br/><br/>'+
                                            'Lone application Number....:'+lds.Id+
                                            '<br/> Lone applicant Name....:'+lds.FirstName +' '+lds.LastName +
                                            '<br/> Lone Applicant Designation....:'+lds.Title +
                                            '<br/> Current Employeer...:'+lds.Company+
                                            '<br/> Contact Number...:'+lds.Phone +
                                            '<br/> Applicant Email Address...:'+lds.Email +
                                            '<br/> Industry Name....:'+lds.Industry +
                                            '<br/> Annual Revenue....:'+lds.AnnualRevenue +
                                            '<br/> Applicant Rating...:'+lds.Rating +
                                            '<br/> Applicant Address...:'+lds.Street +','+lds.City +','+lds.State +','+lds.Country +',Pin:'+lds.postalcode +
                                            '<br/> Lone Application Status..:'+lds.Status +
                                            '<br/>Please Click on bellow Link to view  the Record : <a target=_blank href='+System.URL.getOrgDomainURL().toExternalForm()+'/'+lds.Id + '> <b>Click Here</b> </a>'+
                                            '<br/><br/> Your Lone Application is submitted sucessfully One of my Relationship Manager will contact You shortly. <br/><br/>'+
                                            'Please contact the below address if any queries. <br/> <br/>'+
                                            '<i> **** This system genarated email Please do not Reply **** </i> <br/> <br/>'+
                                            'Thanks & Regards, <br/> Personal Lone Department, <br/> Union Bank of India';
                    semail.SetHTMLBody(emailcontent);

            //creating Attachment File
                    Messaging.EmailFileAttachment emailfile = new Messaging.EmailFileAttachment(); 

                    emailfile.setfileName(lds.FirstName +''+lds.LastName+'.Pdf');
                    emailfile.setcontentType('Application/Pdf');
                    emailfile.body = Blob.toPdf(emailcontent);
            //Preparing the list colllection for Attachment files and add the emailfiles
                    list<Messaging.EmailfileAttachment> lstattachments = new list<Messaging.EmailfileAttachment>();
                            lstattachments.add(emailfile);
            //Add the file to email
                    semail.setfileattachments(lstattachments);
            //Adding Email to Main Collection
                    lstemail.add(semail);
                }
            }
            if(!lstemail.isempty())
            {
                Messaging.sendemailResult[] result = Messaging.sendemail(lstemail);
            }
        }
    }
}