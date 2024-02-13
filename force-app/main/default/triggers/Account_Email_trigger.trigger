trigger Account_Email_trigger on Account (after insert) 
{
    if(Trigger.isAfter && Trigger.isinsert)
    {
        Account_Email.emailalerts(Trigger.New);
    }
}