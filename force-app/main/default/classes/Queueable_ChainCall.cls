public class Queueable_ChainCall implements Queueable {
    public void execute(QueueableContext context) {
        List<Account> accL = new List<Account>();
        accL=[SELECT Id,Name FROM Account];
        for(Account acc:accL){
            acc.Name+=' UPD-acc';
        }
        update accL;
        System.enqueueJob(new Queueable_childJob());
    }

}