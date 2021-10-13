public class UpdateContactBatch implements Database.Batchable<sObject>, Database.Stateful 
{
    public Integer recordCount = 0;

    // Collect the contact records to be passed to execute
	public Database.QueryLocator start(Database.BatchableContext dbc)
    {
		System.debug('Filling the bucket');
		return Database.getQueryLocator([SELECT Id, Name FROM Contact]);
	}
    
	// Process each batch of records
	public void execute(Database.BatchableContext dbc, List<Contact> ContactList)
    {
        //System.debug('Job Id ' + dbc.getJobId()); // Returns the batch job ID
        //System.debug('Child Job Id ' + dbc.getChildJobId()); // Returns the ID of the current batch job chunk that is being processed	
		for (Contact con : ContactList) 
        {
			Con.Description = 'Contact is updated:' + System.now();
		}
		update ContactList;
        recordCount = recordCount + ContactList.size();
		System.debug('Records processed so far ' + recordCount);
	}

	// Execute any post-processing operations
	public void finish(Database.BatchableContext dbc){
        System.debug('Total records processed ' + recordCount);
	}    
}