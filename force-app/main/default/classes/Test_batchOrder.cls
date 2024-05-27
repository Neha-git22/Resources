@isTest
public class Test_batchOrder{
    @isTest
    public static void TestM(){
        List<Order__c> OrList=new List<Order__c>();
        for(Integer i=0;i<=100;i++){
            Order__c Ord=new Order__c();
            Ord.Name='Inv'+i;
            Ord.Status__c='Active';
            Ord.Order_Date__c=Date.newInstance(2023,12,03);
            OrList.add(Ord);
        }
       insert OrList;
        
        Test.startTest();
        Batch_OrderStat B=new Batch_OrderStat();
        Database.executeBatch(B);
        Test.stopTest();
            List<Order__c> testorL=[SELECT Id,Status__c FROM Order__c];
        for(Order__c ord:testorL){
            System.assertEquals('Expired',ord.Status__c); }
        
          }

}