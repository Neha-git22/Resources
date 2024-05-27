@isTest
public class Test_AccIndustry {
    @isTest
    public static void TestAccount(){
        Account A=new Account();
        A.Name='Test';
        A.Industry='Banking';
        A.Phone='1234';
        insert A;
        
        Contact C=[SELECT AccountId,LastName,Phone FROM Contact WHERE AccountId=:A.Id];
        System.assertEquals('Test',C.LastName);
        System.assertEquals('1234',C.Phone);
    }
}