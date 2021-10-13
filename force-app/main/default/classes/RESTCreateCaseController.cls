@RestResource(urlMapping='/CreateNewCase/*')
global with sharing class RESTCreateCaseController {

@HttpPost   
  global static responseClass createNewCase(String Name, String email, String IssueType, String IssueSubType, String Areyou , String TrackingNo) {
     
     System.debug('Name: '+Name);
     System.debug('email: '+email);
     System.debug('IssueType: '+IssueType);
     System.debug('IssueSubType: '+IssueSubType);
     System.debug('Areyou : '+Areyou );
     System.debug('TrackingNo: '+TrackingNo);
     
     responseClass rc=new responseClass();
     
     List<Contact> company = [Select ID, Name, Email from Contact where Name =:Name and Email =:email];   
     system.debug(company );
    
     if(company.isEmpty())
        {
          String[] leftPartSplitted = Name.split(' ');
          system.debug('FirstName: ' +leftPartSplitted[0]); 
          system.debug('LastName: ' +leftPartSplitted[1]);  
          Contact NewContact = new Contact (
                                            FirstName = leftPartSplitted[0],
                                            LastName = leftPartSplitted[1],
                                            Email = email
                                            );
         insert NewContact;
         company = [Select ID, Name, Email from Contact where Name =:Name and Email =:email]; 
         system.debug('Insert Contact :'+company); 
        }
    
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
     rc.CaseNumber= c1.CaseNumber;
     system.debug(rc);
     return rc;    
  }
  
 global class responseClass{
       string CaseNumber;
   } 
  
}