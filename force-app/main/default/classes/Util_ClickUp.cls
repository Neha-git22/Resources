public class Util_ClickUp {
    
    public static final String Atoken='90608847_50dd50c36cdb9701191b5cba82afa7b1c87456ecba96be7b32fb660f5ac1bcae';
    public static String GET(String EndP){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(EndP);
        request.setHeader('Authorization',Atoken);
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        
        HttpResponse response = http.send(request);
        return response.getbody();
        
    }
    
    public static String POST(String body,String EndP){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(EndP);
        request.setHeader('Authorization',Atoken);
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        if(body!=null){
            request.setBody(body);  }
        HttpResponse response = http.send(request);
        return response.getbody();
        
    }

}