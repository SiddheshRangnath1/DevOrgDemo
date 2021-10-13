@isTest
public class TestRestrictContactByName 
{
 @isTest static void TestInsertContact() 
    {
        // Test data setup
        // Create empty list for contacts
        List<Contact> contacts = new List<Contact>{};
		
         Contact ct1 = new Contact(LastName='INVALIDNAME');
         contacts.add(ct1);
            
        //Iterate over each contact
        for(Integer i=0; i<200; i++)
        {
            Contact ct = new Contact(LastName='INVALIDNAME' + i);
            contacts.add(ct);
        }
 
         // Perform test
       Test.startTest();
       Database.SaveResult[] result = Database.insert(contacts, false);
        Test.stopTest();
        // Verify 
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result[0].isSuccess());
        System.assert(result[0].getErrors().size() > 0);
        System.assertEquals('The Last Name "'+contacts[0].LastName+'" is not allowed for DML',result[0].getErrors()[0].getMessage());
    }
    
}