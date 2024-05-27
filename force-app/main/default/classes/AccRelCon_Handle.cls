public class AccRelCon_Handle {
    
    @AuraEnabled
    public static List<Account> getData(){
        return [SELECT Name,Id FROM Account];
        
    }
    
    @AuraEnabled
    public static list<Contact> getConData(string accountId) {
        List<Contact> RelCon=[SELECT FirstName, LastName, Email FROM Contact WHERE AccountId =:accountId];
        return RelCon;
        
    }
    
}