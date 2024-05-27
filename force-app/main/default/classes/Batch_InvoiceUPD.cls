public class Batch_InvoiceUPD implements Database.Batchable<Sobject>{
    
    public Database.QueryLocator start(Database.BatchableContext ctx) {
        return Database.getQueryLocator('SELECT Id, Amount__c FROM Invoice__c');
    }
    public void execute(Database.BatchableContext ctx, List<Invoice__c> InvoicesL) {
        List<Invoice__c> InvL = new List<Invoice__c>();

        for (Invoice__c i : InvoicesL){
            if (i.Amount__c > 1000){
                i.Status__c = 'High Value';
            } else if (i.Amount__c >= 500 && i.Amount__c <= 1000) {
                i.Status__c = 'Medium Value';
            } else{
                i.Status__c = 'Low Value';
            }

            InvL.add(i);
           
        }
        update InvL;
    }

    public void finish(Database.BatchableContext ctx) {
        
    }
}