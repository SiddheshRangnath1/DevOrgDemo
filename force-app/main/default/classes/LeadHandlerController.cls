public class LeadHandlerController 
{
    public static void onBeforeInsert(List<Lead> ListOfLead) 
    {
        /*call before insert actions*/
    }
    
    public static void onBeforeUpdate(List<Lead> ListOfLead, Map<Id, Lead> mapLeadOld) 
    {
        /*call before update actions*/
       
        for (Lead ld : ListOfLead)
        {
            if (ld.Profession__c == 'Doctor')
            {
                ld.Full_Name__c = 'Dr. '+ ld.Name;  
            }
            else if(ld.Profession__c == 'Engineer')
            {
             ld.Full_Name__c = 'Eng. '+ ld.Name;
            }
            else 
            {
             ld.Full_Name__c = ld.Name;
            }
        }
    }
    
    public static void onAfterInsert(List<Lead> ListOfLead) 
    {
        /*call after insert actions*/
    }
    
    public static void onAfterUpdate(List<Lead> ListOfLead, Map<Id, Lead> mapLeadOld) 
    {
        /*call after update actions*/
    }
    
    public static void onAfterDelete(List<Lead> ListOfLead, Map<Id, Lead> mapLeadOld) 
    {
        /*call after delete actions*/
    }
    
    public static void onBeforeDelete(List<Lead> ListOfLead, Map<Id, Lead> mapLeadOld) 
    {
        /*call before delete actions*/
    }

}