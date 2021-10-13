public class ContactTriggerHandler 
{
	public static void UpdateContact(List<Contact> ContactList)
    {
        String UserName = UserInfo.getName();
        for(Contact c : ContactList)
         {
           c.Description = 'This Contact was updated by: ' + UserName;
         }
    }
    
    public static void InsertOrDeleteContact(List<Contact> ListofContacts)
    {
        //Get all Account Id (distinct) in set where new contact is inserted of existing contact is deleted.
        Set<String> allAccountIdSet = new Set<String>();
		for (Contact con : ListofContacts)
		{
		allAccountIdSet.add(con.AccountId);
		}
		
        //Get list of all contacts associated with Account for which count needs to be updated
        List<Contact> ListOfAllContacts = [Select Id, AccountId, Name from Contact where AccountId IN : allAccountIdSet];
        
        //Map to hold 
        Map<Id, Integer> AccountContactCount = new Map<Id, Integer>();
		
        for (Contact con : ListOfAllContacts)
		{
		if(AccountContactCount.containsKey(con.AccountId))
			{
                
			AccountContactCount.put(con.AccountId, AccountContactCount.get(con.AccountId) + 1);
			}
         else 
           {
             AccountContactCount.put(con.AccountId, 1);  
           }
		}
	List<Account> accList = [Select Id, Name FROM Account WHERE ID IN : allAccountIdSet];
    List<Account> accListupdated = new List<Account>();
        for(Account acc : accList)
		{
		 acc.No_Of_Contact__c = AccountContactCount.get(acc.Id);
         accListupdated.add(acc);
		}
update accListupdated; //Update all accounts
    }
}