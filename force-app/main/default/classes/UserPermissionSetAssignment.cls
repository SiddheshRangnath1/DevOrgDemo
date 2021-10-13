public class UserPermissionSetAssignment 
{
	public void AssignPer(String usrName,String perName)
	{
    System.debug('UserName: '+usrName);
    System.debug('PermissionSet: '+perName);
   
    PermissionSetAssignment pa = new PermissionSetAssignment();
        
    User[] u = [SELECT Id FROM User WHERE Name=:usrName];
    PermissionSet[] p = [SELECT Id FROM PermissionSet WHERE Label=:perName];
     if(u.isEmpty() && p.isEmpty())
    {
     System.debug('ErrorMessage: User and permission set does not exist in Salesforce Org');   
    }
    else if(u.isEmpty())
    {
     System.debug('ErrorMessage: User does not exist in Salesforce Org');   
    }
    else if(p.isEmpty())
     {
     System.debug('ErrorMessage: Permission Set does not exist in Salesforce Org');     
     }
    else
     {
     pa.AssigneeId = u[0].Id;
     pa.PermissionSetId = p[0].Id;
     system.debug('Record Inserted in PermissionSetAssignment:'+pa);
     //insert pa;   
     }
    }
    
}