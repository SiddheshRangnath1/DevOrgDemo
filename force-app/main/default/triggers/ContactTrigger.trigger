trigger ContactTrigger on Contact (before update, after insert) 
{
    if(Trigger.isUpdate)
    {
      if(Trigger.isBefore)  
      {
         ContactTriggerHandler.UpdateContact(Trigger.New);
      }
    }
    
    if(Trigger.isAfter)  
    {
      if(Trigger.isInsert)  
      {
         ContactTriggerHandler.InsertOrDeleteContact(Trigger.New);
      }
     }
    
}