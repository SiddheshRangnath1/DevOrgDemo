@RestResource(urlMapping='/CloseCase/*')
global with sharing class RESTCloseCaseController {

@HttpPost   
  global static responseClass createNewCase(String CaseId, String ArticleId) {
     System.debug('COMPANY: '+CaseId);
     System.debug('CASE TYPE: '+CaseId);
     
     responseClass rc=new responseClass();
     
     Case c = [SELECT Id, CaseNumber,  Status FROM Case Where Id =:CaseId];
     
     CaseArticle ca = new CaseArticle();
     ca.CaseId = c.Id;
     ca.KnowledgeArticleId = ArticleId;
     insert ca;
     
     c.Status = 'Closed';
     update c;
     
     list<Knowledge__kav> art = [SELECT Id,  KnowledgeArticleId, Title, Summary,ArticleURL__c, ArticleBody__c, ArticleType, ArticleNumber 
        FROM Knowledge__kav Where Language = 'en_US' and PublishStatus = 'Online' and KnowledgeArticleId =:ArticleId];
     
     rc.success='Sucess';
     rc.caseno=c.CaseNumber;
     rc.artno=art[0].Title;
     return rc;    
  }
  
 global class responseClass{
       string caseno;
       string success;
       string artno;    
   } 
  
}