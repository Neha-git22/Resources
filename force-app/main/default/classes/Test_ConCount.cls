@isTest
public class Test_ConCount {
    @isTest
    public static void ConTest(){
        Account acc=new Account();
        acc.Name='neha Acc';
        insert acc;
        
        Contact con=new Contact();
        con.LastName='neha';
        con.AccountId=acc.Id;
        insert con;
        
        List<Account> newacc=[SELECT Id,Number_of_Contacts__c FROM Account WHERE Id=:con.AccountId];
        
        System.assertEquals(1,acc.Number_of_Contacts__c);
        
    }

}