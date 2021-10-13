public class ContactAndLeadSearch 
{
    public ContactAndLeadSearch(){}
    
    public static List<List< SObject>> searchContactsAndLeads(string par1)
    {
       List<List<sObject>> searchList = [FIND :par1 IN NAME FIELDS RETURNING Contact(Name),Lead(FirstName)];
       System.debug(searchList); 
       return searchList;  
    }
}