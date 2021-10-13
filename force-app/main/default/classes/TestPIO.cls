public class TestPIO {
    
    
    public void GetArticle(string Query)
		{
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setHeader('ContentType', 'application/json');        
            
            //Request JSON preparation     
            JSONGenerator gen = JSON.createGenerator(true);
            gen.writeStartObject();
            gen.writeStringField('text', Query);     
            gen.writeEndObject();
          
            String JSONBody = gen.getAsString();
            System.debug('JSONBody: ' + JSONBody);
        
            req.setBody(JSONBody);
            req.setMethod('POST');
            req.setEndpoint('http://13.65.193.191:8000/queries.json');
            system.debug('Request to PIO: '+req);
            try{
            	HttpResponse res = h.send(req);
            	System.debug('ResStatus: '+ res.getStatus());
            	System.debug('ResBody: '+ res.getBody());
                Map<String, Object> i = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());      
        		System.debug(i.get('category')); 
            }
            catch (CalloutException e)
            {
            System.debug('An exception: '+ e);
          	}
}
       
}