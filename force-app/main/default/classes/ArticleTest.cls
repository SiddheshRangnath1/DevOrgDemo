public class ArticleTest 
{
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
        system.debug(kaIds);
    }
    
}