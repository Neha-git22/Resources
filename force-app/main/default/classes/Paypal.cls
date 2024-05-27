public class Paypal {
    
    public static void Paypalget()
    {
        String client_Id = 'AQJqQ47cpTZwhlefQs3GNhxC-EPk89pRbBLqoEmkcO0aoc79i7v7dHNiA9oizWTWnCd5xlEiM8UDIoOV';
        String client_secret='EC_FeFkhMRxXQ55Or0jOpnLI_5gJiVjcRjrBrW51tlh5BhkSFg4jiX0OOFQaomgebKxZDSzWkRwYTPbk';
        //Blob headerValue = Blob.valueOf(client_Id + ':' + client_secret);
        string body = 'grant_type=client_credentials';
        //String authorizationHeader = 'Basic'+EncodingUtil.base64Encode(headerValue);
        ///System.debug(authorizationHeader);
        String url='https://api-m.sandbox.paypal.com/v1/oauth2/token';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(url);
        request.setHeader('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueOf(client_Id + ':' + client_secret)));
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setBody(body);
        HttpResponse response = http.send(request);//
        System.debug(response.getbody());
        //return response;
        if (response.getStatusCode() == 200) {
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug((String) responseMap.get('access_token'));
        } else {
            //return null;
        }
    }
    
    
    public static void paypalT(){
        String key = 'A21AALf3p69ttusDSTdFSPKPrUTsHRGIb_Q4_ENlZJjDy2jsLQWIohcI9yBwSz5F8yyNkJciIgDESFgc8n3F4KxzI38svDuFw';
        String url='https://api-m.sandbox.paypal.com/v3/vault/payment-tokens';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(url);
        request.setHeader('Authorization', 'Bearer ' + key);
        request.setHeader('Content-Type','application/x-www-form-urlencoded');
        request.setHeader('PayPal-Request-ID','b5efbe82-bbad-4bb0-aeeb-bfef5b442e49');
        //request.setBody('');
        HttpResponse response = http.send(request);
        System.debug(response.getbody()); 
    }
    
    
}