trigger ClosedOpportunityTrigger on Opportunity (after insert, after update)
{
 List<Task> taskListToInsert = new List<Task>();
     for(Opportunity o : Trigger.New) 
     {
        // Get child records for each account
        if (o.StageName == 'Closed Won') 
        {
           Task t = new Task();
		   //t.OwnerId = userId;
		   t.Subject = 'Follow Up Test Task';
		   t.Status = 'Open';
		   t.Priority = 'Normal';
		   t.WhatId = o.Id;
           taskListToInsert.add(t); 
        }
    }
    
    if(taskListToInsert.size() > 0)
    {
        insert taskListToInsert ;
    }
}