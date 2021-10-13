public class Test1 
{    
    public void FindScore(String KnowledgeArticleId)  
    {
     List<KnowledgeArticleViewStat > c = [Select ID, NormalizedScore  from KnowledgeArticleViewStat];  
     system.debug(c); 
      KnowledgeArticleVersion[] Articles = [SELECT UrlName, Title, Summary, ArticleType, ArticleNumber, KnowledgeArticleId
        FROM KnowledgeArticleVersion 
        WHERE PublishStatus= 'Online' 
        AND Language = 'en_US'];
        system.debug(Articles); 
    }
    
    
    
public void sendEmail(ID recipient, ID candidate)
{
  //New instance of a single email message
    Messaging.SingleEmailMessage mail = 
            new Messaging.SingleEmailMessage();
 
    // Who you are sending the email to
   mail.setTargetObjectId(recipient);

   // The email template ID used for the email
   mail.setTemplateId('00X28000001G9zo');
          
   mail.setWhatId(candidate);    
   mail.setBccSender(false);
   mail.setUseSignature(false);
   mail.setReplyTo('siddhesh.rangnath1@gmail.com');
   mail.setSenderDisplayName('HR Recruiting');
   mail.setSaveAsActivity(false);  
 
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

}  
    
}