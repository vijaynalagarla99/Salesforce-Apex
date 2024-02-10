public class Hiring_to_Position 
{
	public static void creatingpostion(list<Hiring_manager__c> hr)
    {
        list<Position__c> poss = new list<Position__c>();
        for(Hiring_manager__c hrr : hr)
        {
            Position__c pos = new Position__c();
            pos.Name = 'SFDC Developer';
            pos.HR_Contact_Number__c = hrr.Contact_Number__c;
            pos.HR_Email_Address__c = hrr.Emaid_address__c;
            pos.Open_Date__c = system.today();
            pos.Milestone_Date__c = date.newinstance(2024,02,25);
            pos.Hiring_manager__c = hrr.id;
            pos.Disignation__c = 'SR Software engineer';
            pos.Location_Name__c = 'Hyderabad';
            pos.Maximum_Budget__c = 600000;
            pos.Number_Of_Vecancies__c = 10;
            poss.add(pos);
        }
        if(!poss.isempty())
        {
            insert poss;
        }
    }
}