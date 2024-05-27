@isTest
public class Test_BatchInvoice{
    @isTest
    public static void TestM(){
        List<Invoice__c> InvL=new List<Invoice__c>();
        for(Integer i=0;i<=10;i++){
            Invoice__c Inv=new Invoice__c();
            Inv.Name='Inv'+i;
            Inv.Amount__c=1001;
            InvL.add(Inv);
        }
       insert InvL;
        
        Test.startTest();
        Batch_InvoiceUPD B=new Batch_InvoiceUPD();
        Database.executeBatch(B);
        Test.stopTest();
            List<Invoice__c> testInvL=[SELECT Id,Status__c FROM Invoice__c];
        for(Invoice__c I:testInvL){
            System.assertEquals('High Value',I.Status__c); }
        
          }

}