@isTest
public class Test_NumOfAccRelCons {
    @isTest
    public static void TestCreateCon(){
        Account A=new Account();
        A.Name='Test';
        A.NumberofLocations__c=3;
        insert A;
        
        List<Contact> conL=[SELECT AccountId,Lastname FROM Contact WHERE AccountId=:A.Id];
        System.assertEquals(A.NumberofLocations__c,conL.size());
        
    }

}