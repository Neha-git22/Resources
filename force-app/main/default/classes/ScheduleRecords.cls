public class ScheduleRecords Implements Schedulable
{
    public void execute(SchedulableContext sc)
    {
        //Call an Apex Method or a Batch or whatever you want to Schedule, for example-
        BatchRecords batch=new BatchRecords();
        Database.executeBatch(batch,200);
        
    }
}