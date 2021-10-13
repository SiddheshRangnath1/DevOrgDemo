trigger OpportunityTrigger on Opportunity (after update)
{
if ( trigger.isAfter ) 
    {
       if ( trigger.isUpdate ) 
        {
           // OpportunityHandlerController.onAfterUpdate(trigger.new,trigger.oldMap);
        } 
	}
}