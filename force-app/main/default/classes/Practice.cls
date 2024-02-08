public with sharing class Practice
 {
    public static void test() 
    {
       list<Account> acc = [select Id, Name, Rating, Industry, AnnualRevenue, Active__c, Phone, Fax
                                        from Account
                                        order by AnnualRevenue desc
                                        limit 10
                                        All Rows];
        system.debug('the no of account is..:'+acc.size());
        if(! acc.isempty())
        {
            for(Account ac : acc)
            {
                system.debug('the account records are...:'+ac);
            }
        }
    }
    public static void did()
    {
        list<Position__c> pos = [select Id, Name, Location_Name__c, Disignation__c, Hiring_manager__c
                                               from Position__c];
        if(! pos.isempty())
        {
            for(Position__c po : pos)
            {
                system.debug('the position records is...:'+po);
            }
        }
    }
    //Write an Apex program, to fetch all the Lead Records from the Object, and represent on the Debug Log File.
    public static void leads()
    {
        list<Lead> led = [select Id, FirstName, LastName, Company, LeadSource
                                         from Lead];
            if(! led.isempty())
            {
                for(lead le : led)
                {
                    system.debug('the lead records are...:'+le);
                }
            }
    }
    //second way
    public static void Contact()
    {
        for(Contact con : [select Id, FirstName, LastName, Phone, Email
                                      from Contact])
        {
            system.debug('the contact Id is....:'+con.Id);
            system.debug('the Name is...:'+con.FirstName+''+con.LastName);
            system.debug('the contact no is...:'+con.Phone);
            system.debug('the email id is...:'+con.Email);
        }
        system.debug('the no of querys are used..:'+system.Limits.getqueries());
        system.debug('the no of records are returns...:'+system.Limits.getqueryrows());
    }
    //Write an Apex Program, to fetch all the Hiring Manager Records from the Object, and store them to the "Map Collection".
    //And represent the records on the Debug Log File.
    public static void gethr()
    {
        Map<Id, Hiring_manager__c> hr = new Map<Id, Hiring_manager__c>([select Id, Name, Designation__c, Location_Name__c
                                                                            from Hiring_manager__c
                                                                                 Limit 5]);
                if(! hr.isempty())
                {
                    for (Hiring_manager__c hrr : hr.values())
                        system.debug('the Hiring Manager records is...:'+hrr);
                    }
                }
    }
    //Write an Apex Program, to Fetch the Lead Records from the object, based on the specified Limit and Offset values at runtime.
    public static void vijay(integer Limitss,  integer offsets)
    {
        list<Lead> led = [select Id, FirstName, LastName, Company, Rating, AnnualRevenu
                                      from Lead
                                      Order By LastName
                                      Limit : Limitss
                                      Offset : Offsets];
        system.debug('the size of Lead is...:'+led.size());

        if(! led.isEmpty())
        {
            for(Lead le : led)
            {
                system.debug('the records is..:'+le);
            }  
        }
    }

    //second
    public static void second(integer limits, integer offsets)
    {
        list<Position__c> pose = [select Id, Name, Disignation__c, Location_Name__c, Minimum_Pay__c, Createddate, Position_Status__c
                                                            from Position__c
                                                            order by Disignation__c
                                                            limit : limits
                                                            offset : offsets];
                system.debug('the size of the list is..:'+pose.size());
                if(! pose.isempty())
                {
                    for(Position__c po : pose)
                    {
                        system.debug('the positiion records is...:'+po);
                    }
                }
    }
}