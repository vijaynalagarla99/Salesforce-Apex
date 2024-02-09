trigger Accountsharing on Account (After insert)
 {
    if(Trigger.isafter && Trigger.isInsert)
    {
        list<AccountShare> Acshare = new list<AccountShare>();

        for(Account acc : Trigger.New)
        {
            if(acc.share_to__c != Null)
            {
                AccountShare accc = new AccountShare();
                accc.AccountId = acc.id;
                accc.UserorGroupId = acc.Share_to__c;
                
                if(acc.AnnualRevenue >= 6000000)
                {
                    accc.AccountAccessLevel = 'Edit';
                    accc.opportunityAccessLevel = 'Read';
                    accc.CaseAccessLevel = 'Read';
                }
                else 
                {
                    accc.AccountAccessLevel = 'Read';
                    accc.opportunityAccessLevel = 'Read';
                    accc.CaseAccessLevel = 'Read';    
                }
                accc.RowCause = 'Manual';
                Acshare.add(accc);
            }
            
        }
        if(!Achshare.isemapty())
            {
                insert Acshare;
            }
    }

}