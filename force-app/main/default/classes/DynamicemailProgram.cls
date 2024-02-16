public with sharing class DynamicemailProgram {
    public DynamicemailProgram() {}
    public static void emailprogramming(list<Lead> leds, string mailid, string displyname, string ccmailid)
    {
        list<Messaging.singleemailMessage>lstemail = new list<Messaging.singleemailMessage>();
        for(Lead led : leds)
        {
            if(led.AnnualRevenue == 5500000)
            {
                Messaging.singleemailMessage semail = new Messaging.singleemailMessage();

                list<string> toaddress = new list<string>{led.Email, mailid};
                semail.setToaddresses(toaddress);

                list<string> ccaddress = new list<string>{ccmailid};
                semail.setccaddresses(ccaddress);

                semail.setReplyTo(led.Email);

                semail.setSenderDisplayName(displyname);

                string emailsubject = 'This email for Practing';
                semail.setsubject(emailsubject);

                string emailcontent = 'Edo Practice cheyali ani e Program rasa'+
                                        '<br/> lead Name :'+led.FirstName + ' ' + led.LastName +
                                        '<br/> lead Id :'+led.Id +
                                        '<br/> lead Annual Revenue:'+ led.AnnualRevenue +
                                        '<br/> *** This is Practice Email reply iste Ku***Pagiliddhi *** <br/> <br/>'+
                                        'Thanks Nameste';
                semail.setHTMLBody(emailcontent);

                Messaging.EmailfileAttachment attachments = new Messaging.Emailfileattachment();

                attachments.setfileName('Secret file Pdf');
                attachments.setcontenttype('Application/Pdf');
                attachments.body=Blob.toPdf(emailcontent);
                list<Messaging.emailfileattachment> lstemailattachment = new list<Messaging.emailfileattachment> ();

                lstemailattachment.add(attachments);

                semail.setfileattachments(lstemailattachment);

                lstemail.add(semail);
            }
        }
        if(!lstemail.isempty())
        {
            Messaging.sendemailresult[] result = Messaging.sendemail(lstemail);
        }
    }
}