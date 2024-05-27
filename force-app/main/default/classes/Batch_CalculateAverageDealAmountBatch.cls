public class Batch_CalculateAverageDealAmountBatch{
    public database.QueryLocator start(Database.BatchableContext ctx){
        //Fetch Your Data here, for example-
        String s='Harry%';
        String q = 'SELECT Id, Name FROM Account WHERE Name LIKE :s';
        return database.getQueryLocator(q);
    }
    
    public void execute(Database.BatchableContext ctx, List<Account> accL){
        //Perform you Logic here, for example-
        for(Account acc: accL){
            acc.Name+='Potter';
        }
        update accL;
    }
    public void finish(Database.BatchableContext ctx){
           /*
               Messaging.SingleEmailMessage msg= new Messaging.SingleEmailMessage();
           msg.toAddresses=new String[]{'neha1@astreait.com'};
           msg.subject='Account Update Email';
           msg.plainTextBody='Account Name has been updated.';
           Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>{msg};
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);        
        system.debug('Batch Executed!!!');
        */
    }

}