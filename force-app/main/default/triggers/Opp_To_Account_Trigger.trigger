trigger Opp_To_Account_Trigger on Account (After insert) 
{
    if(Trigger.isAfter && Trigger.isinsert)
    {
        Account_To_Trigger.Testing(Trigger.New);
    }
}