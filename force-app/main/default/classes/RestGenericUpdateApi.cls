@RestResource(urlMapping='/GenericUpdateApi/*')
global with sharing class RestGenericUpdateApi{

      
  @HttpPost
    global static responseClass genericUpdate(string entityName, string filterAttributeName, string filterAttributeValue, string updatefieldName, string updatefieldValue, string userid, string bmcticketid) {
        responseClass rc=new responseClass();
        try{
            
                entityName=entityName.trim();
                filterAttributeName=filterAttributeName.trim();
                filterAttributeValue=filterAttributeValue.trim();
                updatefieldName=updatefieldName.trim();
                updatefieldValue=updatefieldValue.trim();
                
                string querystring='select '+updatefieldName+' from '+entityName+' where '+filterAttributeName+' =: filterAttributeValue limit 1';
                system.debug('-----querystring----::'+querystring);
                List<sObject> sobjList = Database.query(querystring);
                schema.sobjecttype targettype=schema.getglobaldescribe().get(entityName);
                //provide validation codes if such object does not exist
                if(sobjlist.size()>0){
                    sobject so=sobjlist.get(0);
                    sobject tobj= targettype.newSobject();
                    tobj=so;
                    tobj.put(targettype.getdescribe().fields.getmap().get(updatefieldName),updatefieldValue);
                    update tobj;
                    rc.success='true';
                    rc.userid=userid;
                    rc.responseMessage='Update done successfully';
                    if(string.Isnotblank(bmcticketid))
                        rc.bmcticketid=bmcticketid;
                }else {
                    rc.success='false';
                    rc.userid=userid;
                    rc.responseMessage='Specified record not found in SFDC';
                    if(string.Isnotblank(bmcticketid))
                        rc.bmcticketid=bmcticketid;
                    
                }
                
                
         }catch(exception e){
                rc.success='false';
                rc.userid=userid;
                rc.bmcticketid='bmcticketid';
                rc.responseMessage=e.getMessage();
                system.debug('--Exception--'+e.getMessage()+'::Trace::'+e.getStackTraceString());
        }
        return rc;
   }
   global class responseClass{
       string success;
       string userid;
       string bmcticketid;
       string responseMessage;
       
   }
}