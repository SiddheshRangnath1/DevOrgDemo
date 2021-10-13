trigger LeadTrigger on Lead (before update)
{
    if ( trigger.isBefore ) 
    {
      /*  if ( trigger.isInsert ) 
        {
            LeadHandlerController.onBeforeInsert(trigger.new);
        } 
        else*/ if ( trigger.isUpdate ) 
        {
            LeadHandlerController.onBeforeUpdate(trigger.new, trigger.oldMap);
        } 
        /*else if ( trigger.isDelete ) 
        {
            LeadHandlerController.onBeforeDelete(trigger.old, trigger.oldMap);
        }*/
    } 
  /*  else if ( trigger.isAfter ) 
    {
        if ( trigger.isInsert ) 
        {
            LeadHandlerController.onAfterInsert(trigger.new);
        } 
        else if ( trigger.isUpdate ) 
        {
            LeadHandlerController.onAfterUpdate(trigger.new, trigger.oldMap);
        }
        else if ( trigger.isDelete ) 
        {
            LeadHandlerController.onAfterDelete(trigger.old, trigger.oldMap);
        }
    }*/
}