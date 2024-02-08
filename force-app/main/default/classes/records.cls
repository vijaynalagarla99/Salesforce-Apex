Public class records
{
    Public void newaccount()
    {
        Account acc = new Account();
        acc.Name = 'MI';
        acc.Active__c = 'True';
        acc.AccountSource = '';
        acc.AnnualRevenue = 5000000;
        acc.CustomerPriority__c = 'High';
        acc.Phone = '987456321';
        acc.Fax = '456978';
        
        Insert acc;
        
        If (acc.Id != Null)
            system.debug('Account is created..:'+acc.Id);
    }
    public  void newrecord()
    {
        Lead me = new Lead();
        me.FirstName='subba Rao';
        me.LastName='K';
        me.Status='Open-notcontacted';
        me.Phone='9848022335';
        me.Email='subbu@gmail.com';
        me.city='Hyderabad';
        me.AnnualRevenue=569874135;
        me.Industry='Manufacturing';
        me.Company='Hetro';
        

        Insert me;

        If(me.Id != Null)
        {
            system.debug('New Lead is created sucessfully :'+me.Id);


            Task tsk = new Task();

            tsk.Status='In Progress';
            tsk.Subject='Ticket has been raised for the got a new Lead.';
            tsk.Description='Dear Hr Person, Manaki kotha Lead dhorikadu, Vaadu service thisukune dhaka savamingu.';
            tsk.Priority='Medium';
            tsk.ActivityDate=system.today();
            tsk.whoId=me.Id;

            Insert tsk;
            If(tsk.Id != null)
            system.debug('New Task is created sucessfully :'+tsk.Id);


        }

    }
}























