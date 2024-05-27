public with sharing class RelRecords {
    
    @AuraEnabled
    public static List<Account> GetRelRecords(String accName){
        string key = accName+ '%';
        List<Account> accL= [SELECT Id, Name,Email__c FROM Account WHERE Name LIKE :key];
        return accL;
    }
}