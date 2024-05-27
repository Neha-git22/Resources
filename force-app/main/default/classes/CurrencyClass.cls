public with sharing class CurrencyClass {
    
    @AuraEnabled
    public static decimal ConvertExchangeAPI(String SC, String TC, String amt){
        Decimal value;
        Map<String,Object> results=new Map<String,Object>();
        String url = 'https://api.apilayer.com/exchangerates_data/convert?to='+SC+'&from='+TC+'&amount='+amt+''; 
        Decimal INR = 0.0;
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        req.setHeader('apikey', 'a5nA42EQEdyNidtjzRfdFcja04nt02cR');
        HttpResponse res = h.send(req);
        //System.debug(res.getBody());
        
        if(res.getStatusCode()==200){
            results = (Map<String,Object>)JSON.deserializeUntyped(res.getBody());
            System.debug(results);
            value = (Decimal)results.get('result');
            System.debug(value);
            
        }
        return value;
    }
    
    public static void ConvertFreeCurrAPI(){
        String url = 'https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_L0EMWQNsaMdezeIzT1IPkEnUFMbHMcQQ13vBtH50'; 
        Decimal INR = 0.0;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        System.debug(res.getBody());
        if(res.getStatusCode()==200){
            
        }
    }
}