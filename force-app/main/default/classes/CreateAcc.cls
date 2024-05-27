public with sharing class CreateAcc {

    @AuraEnabled
    public static Id accCreate(String name,String email){
        Account acc=new Account();
        acc.Name=name;
        acc.Email__c=email;
        insert acc;
        return acc.Id;
    }

    @AuraEnabled
    public static Id conCreate(String Lastname,String phone,String account){
        Contact con=new Contact();
        con.LastName=Lastname;
        con.Phone=phone;
        if(account!=''){
        con.AccountId=account;}
        insert con;
        return con.Id;
        
    }
   
}