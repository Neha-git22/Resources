global class Scheduler implements Schedulable {
   global void execute(SchedulableContext SC) {
      Batch_OrderStat Bo = new Batch_OrderStat(); 
      Database.executebatch(Bo);
       
   }
}