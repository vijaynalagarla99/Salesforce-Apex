trigger contactParentdeletion on Contact (before delete) 
{
    if(Trigger.isbefore && Trigger.isdelete)
    {
        set<Id> contactwithOpportunity = new set<id>();

        for(Opportunity opp : [select ContactId from Opportunity where ContactId IN : Trigger.Old And StageName != 'Closed'])
        {
            contactwithOpportunity.add(opp.ContactId);
        }

        for(Contact con : Trigger.Old)
        {
            if(contactwithOpportunity.contains(con.id))
            {
                con.adderror('cannot delete contact with Active Opportunities');
            }
        }
    }
}