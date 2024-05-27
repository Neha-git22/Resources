@RestResource(urlMapping='/Account/*') global with sharing class RestAPIClass {
    
    @HttpGet
    global static List<Account> doGet(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        List<Account> result=new List<Account>();
        result =[SELECT Description,Name FROM Account];
        return result;
    }
    
    @HttpPost
    global static Account createAcc(String Description, String Name) {
        Account acc = new Account(
            Description=Description,
            Name=Name
        );
        insert acc;
        return acc;
    }   
    
    @HttpPut
    global static void doPut(String Description) {
        RestRequest req = RestContext.request;
        //String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account>acc = [SELECT Name, Description FROM Account];
        for(Account A:acc){
            A.Description=Description;
        }
        upsert acc;
        
    }    
    @HttpPatch
    global static Account doPatch(String Description, String Name) {
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account acc = [SELECT Name, Description FROM Account WHERE Id=:accountId];
        acc.Name=Name;
        acc.Description=Description;
        
        upsert acc;
        return acc;
     
    }
    
    @HttpDelete
    global static void dodelete() {
        RestRequest request = RestContext.request;
        String accId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Account acc = [SELECT Id FROM Account WHERE Id = :accId];
        delete acc;
    }
    
}