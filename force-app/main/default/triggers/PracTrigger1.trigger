trigger PracTrigger1 on Account (before insert) {
       List<Account> accL=trigger.new;
       if(trigger.isbefore && trigger.isInsert){
           for(Account A:accL){
               A.description='New Record - Inserted with Trigger';
           }
          
       }
}