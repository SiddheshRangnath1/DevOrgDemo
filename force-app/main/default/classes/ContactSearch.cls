public class ContactSearch 
{
public ContactSearch (){}
    
    public static List<Contact> searchForContacts(String LastName,String PostalCode)
    {
       List<Contact> c = [SELECT ID, Name FROM Contact WHERE LastName = :LastName AND MailingPostalCode= :PostalCode];
       return c;
    }
    
}