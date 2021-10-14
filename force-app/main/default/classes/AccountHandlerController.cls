public class AccountHandlerController 
{
    //Updated Comment//
 	public static void onBeforeInsert(List<Account> AccountList) 
    {
        /*call before insert actions*/
        /* Scenario: When we update the Account record, the Account owners will be automatically added to the sales rep field */
        
        for(Account Acc : AccountList) 
        {
			//Owner should not  be blank ans Owner is updated 
			if(Acc.OwnerId != null)	
            {	
				Acc.Sales_Rep__c = Acc.OwnerId;
			}			
		}	
    }
    
    public static void onBeforeUpdate(Map<Id, Account> mapAccountNew, Map<Id, Account> mapAccountOld) 
    {
        /*call before update actions*/
        
        /* Scenario: When we update the Account record, the Account owners will be automatically added to the sales rep field */
        
        for(Account Acc : mapAccountNew.values()) 
        {
			//Owner should not  be blank ans Owner is updated 
			if(mapAccountNew.get(Acc.Id).OwnerId != null)	
            {	
				Acc.Sales_Rep__c = Acc.OwnerId;
			}			
		}	
    }
    
    public static void onAfterInsert(List<Account> AccountList) 
    {
        /*call after insert actions*/        
    }
    
    public static void onAfterUpdate(List<Account> AccountList, Map<Id, Account> mapAccountOld) 
    {
        /*call after update actions*/
        
        /*Scenario: Write a trigger on Account when Account is update check all opportunity inside the account.Update all Opportunities Stage to close lost if an opportunity created date is greater than 30 days from today and stage not equal to close won*/
		
        //Collect all the Account Id in set 
		Set<String> allAccountIdSet = new Set<String>();
	
		for (Account Acc : AccountList)
		{
			allAccountIdSet.add(Acc.Id);
		}
        
        system.debug('allAccountIdSet--' + allAccountIdSet);
	
		//Get list of all oppotyunities associated with account present in AccountList 
		List<Opportunity> OptyList = [Select ID, StageName, CreatedDate from Opportunity where AccountId in :allAccountIdSet];
		
        system.debug('OptyList--' + OptyList);
        
        For (Opportunity Opty : OptyList)
		{   
            If(opty.CreatedDate < Date.today().addDays(-30) && opty.StageName != 'Close Won')
            {
			opty.StageName ='Close Lost';
        	}
		}
        system.debug('UpdatedOptyList--' + OptyList);
		update OptyList;
    }
    
    
    public static void onAfterUpdate1(Map<Id, Account> mapAccountNew, Map<Id, Account> mapAccountOld) 
    {
        /*call after update actions*/
        
        /* Scenario:When an account BillingCity is update , update all contacts MailingCity with account BillingCity*/
        
        //Collect All the Account Id
		Set<String> allAccountIdSet = new Set<String>();
	
		 for(Account Acc : mapAccountNew.values()) 
			{
				allAccountIdSet.add(Acc.Id);
			}
        
		//Query for Contact in the DB associated with Account
		List<Contact> ContactList = [Select ID, Name, MailingCity from Contact where AccountId in :allAccountIdSet];
	
		For(Contact con: ContactList)
			{
			if ( mapAccountNew.get(con.AccountId).BillingCity != mapAccountOld.get(con.AccountId).BillingCity)		
				{
				con.MailingCity = mapAccountNew.get(con.AccountId).BillingCity;	
				}
		}
    }
    
    
    public static void onAfterDelete(List<Account> AccountList, Map<Id, Account> mapAccountOld) 
    {
        /*call after delete actions*/
    }
    
    public static void onBeforeDelete(List<Account> AccountList, Map<Id, Account> mapAccountOld) 
    {
        /*call before delete actions*/
    }
}