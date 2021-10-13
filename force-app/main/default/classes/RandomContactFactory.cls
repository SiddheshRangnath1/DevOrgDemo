public class RandomContactFactory 
{
	public static List<Contact> generateRandomContacts(Integer numCon, String ConName)
    {
     List<Contact> con = new List<Contact>(); 
     for(Integer i=0;i<numCon;i++) 
        {
     	Contact NewContact = new Contact (FirstName = 'TestFirst' + i,LastName = ConName);
        con.add(NewContact);
        }
     return con;
    }
}