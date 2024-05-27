public class Batch_OrderStat implements database.Batchable<sObject> {
    
    public database.QueryLocator start(Database.BatchableContext ctx){
        //Fetch Your Data here, for example-
        //String q = 'SELECT Id,Status__c, Order_Date__c FROM Order__c WHERE Order_Date__c < LAST_N_DAYS:30 AND Status__c="Active"';
        String sFilter = 'Active';
        Integer dFilter = 30;

        String dynamicQuery = 'SELECT Id, Status__c, Order_Date__c FROM Order__c WHERE Order_Date__c < LAST_N_DAYS:' + dFilter + ' AND Status__c = \'' + sFilter + '\'';
        String q = 'SELECT Id,Status__c, Order_Date__c FROM Order__c';
         return database.getQueryLocator(dynamicQuery);
    }
    
    public void execute(Database.BatchableContext ctx, List<Order__c> OrList){
        //Perform you Logic here, for example-
        
        for(Order__c O: OrList){
            O.Status__c='Expired';
        }
        update OrList;
    }
    
    public void finish(Database.BatchableContext ctx){
        //Executes in the Last, After Execution of the Batch
        system.debug('Batch Executed !!!');
        
    }
    
}