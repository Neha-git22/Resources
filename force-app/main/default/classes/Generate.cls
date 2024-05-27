public with sharing class Generate {
    
    @AuraEnabled
    public static List<Account> getRecords(Date D1,Date D2){
        List<Account> accL=new List<Account>();
        DateTime Dt1=(DateTime)D1;
        DateTime Dt2=(DateTime)D2;
        accL=[SELECT Id,Name FROM Account WHERE CreatedDate>=:Dt1 AND CreatedDate<=:Dt2 LIMIT 5];
        System.debug('accL'+accL);
        return accL;
    }
}