trigger Emailto_Lead on Lead (after insert)
{
    if(Trigger.isinsert && Trigger.isafter)
    {
        EmailAlert_Lead.emailalert(Trigger.New);
    }
}