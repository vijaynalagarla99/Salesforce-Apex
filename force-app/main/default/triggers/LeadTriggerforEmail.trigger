trigger LeadTriggerforEmail on Lead (after insert) 
{
    if(Trigger.isinsert && Trigger.isafter)
    {
        DynamicemailProgram.emailprogramming(Trigger.New, 'vijay.nalagarla99@gmail.com','Jigiri Jinganiya', 'vijay.nalagarla66@gmail.com');
    }
}