public with sharing class AccIds {
    @AuraEnabled
    public static LIst<Account> getAccIds(){
        return [SELECT Id, Name, Industry, Type, Phone FROM Account Limit  10 ];

    }

    @AuraEnabled
    public static List<Contact> getRelCon(Id Accid){
        return [SELECT LastName,Email,Phone FROM Contact WHERE AccountId=:Accid];
    }


}