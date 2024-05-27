@isTest
public class Test_CaseOrigin_Handler {
    @isTest
    public static void testCase(){
        Case C=new Case();
        C.Origin='Email';
        //C.Status='New';
        insert C;
        
        Case check=[SELECT Id,Priority,Status FROM Case WHERE Id=:C.Id];
        System.assertEquals('Medium',check.Priority);
        System.assertEquals('New',check.Status);
    }

}