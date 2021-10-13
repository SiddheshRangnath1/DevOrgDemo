public class Testing {
    
    public void FindContact(String Name, String email, String IssueType, String IssueSubType, String Areyou , String TrackingNo)  
{
    List<Contact> company = [Select ID, Name, Email from Contact where Name =:Name];   
    system.debug(company);
    Case c = new Case();
    c.ContactId = company[0].Id;
    c.Subject = IssueType + ' for '+Name;
    c.Status = 'Open';
    c.Product__c = 'UPS Express Freight';
    c.Origin ='Virtual Assistant';
    c.Issue_Type__c = IssueType;
    c.Issue_Sub_Type__c = IssueSubType;
    c.Are_you_Shipper_or_Receiver__c = Areyou;
    c.Tracking_Number__c = TrackingNo;
    insert c;
    system.debug(c);
    
    Case c1 = [SELECT Id,  CaseNumber FROM Case Where Id =:c.Id];
    system.debug(c1.CaseNumber);
    
}
    
    Public void chkContact(String Name,String EmailId)
    {
 
        List<Contact> company = [Select ID, Name, Email from Contact where Name =:Name and Email =:EmailId]; 
        if(company.isEmpty())
        {
          String[] leftPartSplitted = Name.split(' ');
          system.debug('FirstName: ' +leftPartSplitted[0]); 
          system.debug('LastName: ' +leftPartSplitted[1]);  
          Contact NewContact = new Contact (
                                            FirstName = leftPartSplitted[0],
                                            LastName = leftPartSplitted[1],
                                            Email = EmailId
                                            );
         insert NewContact;
         company = [Select ID, Name, Email from Contact where Name =:Name and Email =:EmailId]; 
         system.debug('Insert Contact :'+company); 
        }
        system.debug(company);     
    }

}