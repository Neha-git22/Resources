public class linkedScall {
    
    public static void linkedget(){
       
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:linked_Named/v2/userinfo');
        req.setMethod('GET');
        //req.setHeader('apikey', 'a5nA42EQEdyNidtjzRfdFcja04nt02cR');
        HttpResponse res = h.send(req);
        System.debug(res.getBody());
    }

}