public class data {
    @AuraEnabled
    public static List<Account> getData(){
        return [SELECT Name,Id FROM Account];

    }

}