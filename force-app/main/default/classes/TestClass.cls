global class TestClass 
{
    responseClass rc=new responseClass();
    public TestClass ()
    {
    
    }
    
    public void createCase(String caseType, String companyName)
    {
     Case c = new Case();
     c.AccountId = '0012800001EFafy';
     c.Subject = caseType + ' for '+companyName;
     c.Status = 'Open';
     insert c;
     system.debug(c.Id);   
    }
   
    public void attachArticle()
    {
        CaseArticle ca = new CaseArticle();
		ca.CaseId = '5002800000gzXzP';
		ca.KnowledgeArticleId = 'kA028000000JZWyCAO';
		insert ca;
        system.debug(ca); 
    }
    
    public void getArticles() 
    {
    String ArtDetail;
    CaseArticle[] caseArticles = [SELECT KnowledgeArticleId FROM CaseArticle WHERE CaseId = '5002800000idUP5'];
    list<Id> kaIds = new List<Id>();
    for (CaseArticle art: caseArticles) 
    	{
        ArtDetail = '';
        kaIds.add(art.KnowledgeArticleId);
    	}
    KnowledgeArticleVersion[] Articles = [SELECT UrlName, Title, Summary, ArticleType, ArticleNumber, KnowledgeArticleId
        FROM KnowledgeArticleVersion 
        WHERE PublishStatus= 'Online' 
        AND Language = 'en_US'
        AND KnowledgeArticleId IN :kaIds];
        
        list <Knowledge__kav> art = [SELECT Id,  KnowledgeArticleId, Title, Summary,ArticleURL__c, ArticleBody__c, ArticleType, ArticleNumber 
		FROM Knowledge__kav WHERE Id IN :kaIds];
            
        rc.artno = art[0].ArticleNumber;
        rc.artbody = art[0].ArticleBody__c;
        rc.arturl = art[0].ArticleURL__c;
		rc.success = 'Sucess';
    system.debug(rc);   
}
 
    
public void FindArticle()
    {   
        string ArtNo ='kA028000000JZWyCAO';
        list<Knowledge__kav> art = [SELECT Id,  KnowledgeArticleId, Title, Summary,ArticleURL__c, ArticleBody__c, ArticleType, ArticleNumber 
		FROM Knowledge__kav Where Language = 'en_US' and PublishStatus = 'Online' and KnowledgeArticleId =:ArtNo];
        rc.artno = art[0].Title;
        rc.artbody = art[0].KnowledgeArticleId;
        rc.arturl = art[0].ArticleURL__c;
        rc.caseno = art[0].Id;
		rc.success = 'Sucess';
        system.debug(art[0]);
    } 
  public void CloseSase() 
    {
     Case c = [SELECT Id,  Status FROM Case Where Id ='5002800000gzXzP'];
     c.Status = 'Closed';
     update c;
     system.debug(c);
    }
    
public void FindContact(String Name) 
{
    List<Contact> company = [Select ID, Name, Email from Contact where Name =:Name];
    system.debug(company);
}
    
    
global class responseClass{
       string caseno;
       string success;
       string artno;
       string artbody;
       string arturl;
   }
    
  

    
}