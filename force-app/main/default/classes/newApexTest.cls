public with sharing class newApexTest {
    public newApexTest() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccRecords(){
        List<Account> acc=[SELECT Name, phone, Email__c FROM Account WHERE Name LIKE 'Neha%' LIMIT 5];
        return acc;

    }


}