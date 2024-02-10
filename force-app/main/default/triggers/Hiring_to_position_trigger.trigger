trigger Hiring_to_position_trigger on Hiring_manager__c (after insert) 
{
	if(Trigger.isafter && Trigger.isinsert)
    {
        Hiring_to_Position.creatingpostion(Trigger.new);
    }
}