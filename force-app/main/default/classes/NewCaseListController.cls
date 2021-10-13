public class NewCaseListController 
{
public List<Case> getNewCases() 
    	{
    	List<Case> results = [Select Id,CaseNumber from Case where status='New' LIMIT 10];
    	return results;
		}
}