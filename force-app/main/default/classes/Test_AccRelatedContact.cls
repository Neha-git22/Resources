@isTest
public class Test_AccRelatedContact {
    @isTest
    public static void TestARC(){
        Account A=new Account();
        A.Name='Test';
        insert A;
        
        Contact C=[SELECT AccountId,LastName FROM Contact WHERE AccountId=:A.Id];
        System.assertNotEquals(null,C);
    }

}