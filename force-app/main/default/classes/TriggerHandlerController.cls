public class TriggerHandlerController 
{
    public static void InsertOrUpdateOptyPrd(List<OpportunityLineItem> ListofOLI)
    {
      //Collect All the Opportunity Id
      Set<String> allOptyIdSet = new Set<String>();
      for (OpportunityLineItem OLI : ListofOLI)
      {
        allOptyIdSet.add(OLI.OpportunityId);  
      }
      
      //Get List of all opportunity record 
      List<Opportunity> ListOfOpty = [Select ID, Name, AccountId, Amount from Opportunity where Id in :allOptyIdSet];
      
     //Set to collect all AccountId   
      Set<String> allAccountIdSet = new Set<String>();
        
      //Map to hold AccountId with Total Amount  
      Map<Id, Decimal> AccountOptyAmount = new Map<Id, Decimal>();
        
      for (Opportunity opty : ListOfOpty)
      {
          if(AccountOptyAmount.containsKey(opty.AccountId))
			{   
			AccountOptyAmount.put(opty.AccountId, AccountOptyAmount.get(opty.AccountId) + opty.Amount);
			}
         else 
           {
            AccountOptyAmount.put(opty.AccountId,opty.Amount); 
            allAccountIdSet.add(opty.AccountId); 
           }
		}
        
        //Update all Accounts 
       
        List<Account> accList = [Select Id, Name,Opportunity_Amount__c FROM Account WHERE ID IN : allAccountIdSet];
        List<Account> accListupdated = new List<Account>();
        
        for(Account acc : accList)
		{
		 acc.Opportunity_Amount__c = AccountOptyAmount.get(acc.Id);
         accListupdated.add(acc);
		}
        
        update accListupdated; //Update all accounts
    }
}