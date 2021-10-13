@RestResource(urlMapping='/FieldCase/*')
global with sharing class RESTCaseControllerBackup {

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
     
     CaseArticle ca = new CaseArticle();
     ca.CaseId = c.Id;
     ca.KnowledgeArticleId = 'kA028000000JZVtCAO';
     insert ca;
     
     CaseArticle[] caseArticles = [SELECT KnowledgeArticleId FROM CaseArticle WHERE CaseId = '5002800000gzaCQ'];
     list<Id> kaIds = new List<Id>();
     for (CaseArticle art: caseArticles) 
        {
        kaIds.add(art.KnowledgeArticleId);
        }
     KnowledgeArticleVersion[] Articles1 = [SELECT UrlName, Title, Summary, ArticleType 
        FROM KnowledgeArticleVersion 
        WHERE PublishStatus= 'Online' 
        AND Language = 'en_US'
        AND KnowledgeArticleId IN :kaIds];
        rc.caseno = c.Id;
        rc.success = 'Success';
        rc.responseMessage = Articles1;
        return rc;    
  }
  
 global class responseClass{
       string caseno;
       string success;
       KnowledgeArticleVersion[] responseMessage;     
   } 
  
}