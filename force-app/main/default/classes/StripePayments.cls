public class StripePayments {
    
    @AuraEnabled
    public static String Stripeget()
    {
        String key = 'sk_test_51OZSpKSIU2M6GBpclEwUEbj8jit01Zl6hzL0QUX6aKAtWXCBl1m7svI4xQLvvSCMVC4YSldUYrZqGs1mTh2gimRP00MGFYoVcc';
        String url='https://api.stripe.com/v1/payment_links';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(url);
      request.setHeader('Authorization', 'Bearer ' + key);
        //request.setBody('');
        HttpResponse response = http.send(request);
        //System.debug(response.getbody());
        Map<String,Object> responsemp = new Map<String,Object>();
        responsemp = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
        Map<String,Object> paymentIdmap=new Map<String,Object>();
        
        
       System.debug(responsemp);
        // Parse the JSON response
        /*if(response.getStatusCode() != 201) {
            System.debug('response.getStatusCode()-------'+ response.getStatusCode());
            System.debug('response.getBody()-------'+ response.getBody());
            System.debug('response.getStatus()-------'+ response.getStatus());
        } else {

            System.debug('ELSE-----------'+response.getBody());
        }*/
        return response.toString();
    
    }
    
    public static String Linkget()
    {
        String key = 'sk_test_51OZSpKSIU2M6GBpclEwUEbj8jit01Zl6hzL0QUX6aKAtWXCBl1m7svI4xQLvvSCMVC4YSldUYrZqGs1mTh2gimRP00MGFYoVcc';
        String url='https://api.stripe.com//v1/payment_intents';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(url);
        request.setHeader('Authorization', 'Bearer ' + key);
        //request.setBody('');
        HttpResponse response = http.send(request);
        //System.debug(response.getbody());
        Map<String,Object> responsemp = new Map<String,Object>();
        responsemp = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
        Map<String,Object> paymentIdmap=new Map<String,Object>();
        
        
       System.debug(responsemp);
        // Parse the JSON response
        /*if(response.getStatusCode() != 201) {
            System.debug('response.getStatusCode()-------'+ response.getStatusCode());
            System.debug('response.getBody()-------'+ response.getBody());
            System.debug('response.getStatus()-------'+ response.getStatus());
        } else {

            System.debug('ELSE-----------'+response.getBody());
        }*/
        return response.toString();
    
    }
    
    @AuraEnabled
    public static String Stripesession()
    {
        String key = 'sk_test_51OZSpKSIU2M6GBpclEwUEbj8jit01Zl6hzL0QUX6aKAtWXCBl1m7svI4xQLvvSCMVC4YSldUYrZqGs1mTh2gimRP00MGFYoVcc';
        String url='https://api.stripe.com/v1/checkout/sessions';
        String body = 'mode=payment&line_items[0][price]=price_1OZUu2SIU2M6GBpcQ1Df80qW&line_items[0][quantity]=2&success_url=https://dneha-c1-dev-ed.develop.lightning.force.com/lightning/n/AccInfo&customer=cus_PaMyZlbPh1J7SP';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(url);
        request.setHeader('Authorization', 'Bearer ' + key);
        request.setBody(body);
        HttpResponse response = http.send(request);
        //System.debug(response.getbody());
        Map<String,Object> responseM = new Map<String,Object>();
        responseM = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
        String redURL=(String)responseM.get('url');
        
        
        System.debug(redURL);
        // Parse the JSON response
        /*if(response.getStatusCode() != 201) {
            System.debug('response.getStatusCode()-------'+ response.getStatusCode());
            System.debug('response.getBody()-------'+ response.getBody());
            System.debug('response.getStatus()-------'+ response.getStatus());
        } else {

            System.debug('ELSE-----------'+response.getBody());
        }*/
        //PageReference ResPage = new PageReference(redURL);
        return redURL;
    
    }
}