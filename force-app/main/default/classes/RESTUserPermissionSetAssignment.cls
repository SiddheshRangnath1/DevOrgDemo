@RestResource(urlMapping='/UserPermissionSetAssignment/*')
global with sharing class RESTUserPermissionSetAssignment
{
@HttpPost 
    global static responseClass AssignPer(String usrName,String perName)
    {
    System.debug('UserName: '+usrName);
    System.debug('PermissionSet: '+perName);
    responseClass rc=new responseClass();
    PermissionSetAssignment pa = new PermissionSetAssignment();
        
    User[] u = [SELECT Id FROM User WHERE Name=:usrName];
    PermissionSet[] p = [SELECT Id FROM PermissionSet WHERE Label=:perName];
    if(u.isEmpty() && p.isEmpty())
    {
     System.debug('ErrorMessage: User and permission set does not exist in Salesforce Org'); 
     rc.ErrorCode='3';  
     rc.RespMessage='Failed:User and permission set does not exist in Salesforce Org';
    }
        
    else if(u.isEmpty())
    {
     System.debug('ErrorMessage: User does not exist in Salesforce Org');  
     rc.ErrorCode='1'; 
     rc.RespMessage='Failed:User does not exist in Salesforce Org';
    }
    else if(p.isEmpty())
     {
     System.debug('ErrorMessage: Permission Set does not exist in Salesforce Org');
     rc.ErrorCode='2';
     rc.RespMessage='Failed:Permission Set does not exist in Salesforce Org';
     }
    else
     {
     rc.UserId = u[0].Id;
     rc.PermissionSetId = p[0].Id;
     pa.AssigneeId = u[0].Id;
     pa.PermissionSetId = p[0].Id;
     system.debug('Record Inserted in PermissionSetAssignment:'+pa);
     insert pa; 
     rc.ErrorCode='0';
     rc.RespMessage='Sucessful: Assigned permission set to user';
     }
    return rc;
    }
   
     global class responseClass
     {
       string UserId;
       string PermissionSetId;
       string ErrorCode;
       string RespMessage;    
    } 
}