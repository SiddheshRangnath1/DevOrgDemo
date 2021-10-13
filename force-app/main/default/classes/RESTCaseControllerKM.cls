@RestResource(urlMapping='/CreateCaseKM/*')
global with sharing class RESTCaseControllerKM {

@HttpPost   
  global static responseClass createNewCase(String companyName, String caseType) {
     System.debug('COMPANY: '+companyName);
     System.debug('CASE TYPE: '+caseType);
     
     responseClass rc=new responseClass();
     List<Account> company = [Select ID, Name, Account_Email_Address__c, BillingState from Account where Name =:companyName];
     
     Case c = new Case();
     c.AccountId = company[0].Id;
     c.Subject = caseType + ' for '+companyName;
     c.Status = 'Open';
     insert c;
     
     string AricleNo;
     if(caseType == 'Solutions to Knowledge Articles')
     {
     AricleNo='kA028000000JZWtCAO';
     }
     else if (caseType == 'Salesforce knowledge setup')
     {
     AricleNo = 'kA028000000JZWyCAO';
     }
     else 
     {
     AricleNo = '';
     }
     
     if(AricleNo != '') 
     {
     list<Knowledge__kav> art = [SELECT Id, KnowledgeArticleId, Title, Summary,ArticleURL__c, ArticleBody__c, ArticleType, ArticleNumber 
        FROM Knowledge__kav Where Language = 'en_US' and PublishStatus = 'Online' and KnowledgeArticleId =:AricleNo];
     rc.artno = art[0].KnowledgeArticleId;
     rc.artbody = art[0].ArticleBody__c;
     rc.arturl = art[0].ArticleURL__c;
     }
     else
     {
     rc.artno = 'Article not found';
     rc.artbody = 'Article not found';
     rc.arturl = 'Article not found';
     }
     
     Case c1 = [SELECT Id,  CaseNumber FROM Case Where Id =:c.Id];
     rc.caseno = c.Id;
     rc.casenum = c1.CaseNumber;
     rc.success = 'Success';
     return rc;    
  }
  
 global class responseClass{
       string caseno;
       string success;
       string artno;
       string artbody;
       string arturl;
       string casenum;   
   } 
  
}