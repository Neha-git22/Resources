public class Batch_contactUpdate implements database.Batchable<sObject> {
    
    public database.QueryLocator start(Database.BatchableContext ctx){
        //Fetch Your Data here, for example-
        String q = 'SELECT Id, Status__c FROM Order__c WHERE ';
        return database.getQueryLocator(q);
    }
    
    public void execute(Database.BatchableContext ctx, List<Contact> conL){
        //Perform you Logic here, for example-
        for(Contact con: conL){
            con.Phone='9999604953';
        }
        update conL;
    }
    
    public void finish(Database.BatchableContext ctx){
        //Executes in the Last, After Execution of the Batch
        system.debug('Batch Executed !!!');
        
    }
    
}