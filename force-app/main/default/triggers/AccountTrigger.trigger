trigger AccountTrigger on Account (before insert, before update, after update) 
{  
if ( trigger.isBefore ) 
    {
       if ( trigger.isInsert ) 
        {
          //  AccountHandlerController.onBeforeInsert(trigger.new);
        } 
        else if ( trigger.isUpdate ) 
        {
           // AccountHandlerController.onBeforeUpdate(trigger.newMap, trigger.oldMap);
        } 
    }
    
if ( trigger.isAfter ) 
    {   
        if ( trigger.isUpdate ) 
        {
           // AccountHandlerController.onAfterUpdate(trigger.new, trigger.oldMap);
           // AccountHandlerController.onAfterUpdate1(trigger.newMap, trigger.oldMap);
        }
    }
}