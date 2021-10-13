public class OpportunityHandlerController 
{
    public static void onAfterUpdate(List<Opportunity> OptyList, Map<Id, Opportunity> mapOptyOld) 
    {
      /*Scenario: Create an asset when for every. OpportunityLineItem with associated Account when Opportunity is marked Closed Won*/
		
		//Collect All the Opportunity Id
		Set<String> allOptyIdSet = new Set<String>();
		
		//Key-OpportunityId, Value-AcountId
		Map<String,String> optyMap = new Map<String,String>();	
			
		for (Opportunity opty : OptyList)
		{
            
		if(opty.StageName == 'Closed Won')
			{
			allOptyIdSet.add(opty.Id);
			optyMap.put(opty.Id,opty.AccountId);
			}
		}
		
		//Query for all OpportunityLineItem record associated with Opty Id in new Trigger
		List<OpportunityLineItem> OptyLineItemList = [Select ID, Name, Product2Id, Quantity	from OpportunityLineItem where OpportunityId in :allOptyIdSet];
		
		List<Asset> NewAssetList = new list<Asset>();
		
		For(OpportunityLineItem OptyLI: OptyLineItemList)
            
		{	
			Asset NewAsset = new Asset();
			NewAsset.Name = OptyLI.Name;
			NewAsset.Product2Id = OptyLI.Product2Id;
			NewAsset.Quantity = OptyLI.Quantity;
			NewAsset.AccountId = optyMap.get(OptyLI.OpportunityId);//fetch AccountId from OpportunityId of OpportunityLineItem
			NewAssetList.add(NewAsset);
		}
	insert NewAssetList;	
	}


}