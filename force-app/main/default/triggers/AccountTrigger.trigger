trigger AccountTrigger on Account (After Delete,After Update,After Insert,Before Update,Before Insert){
    if(trigger.isAfter  && trigger.isDelete){
        AccountTrigger_handler.mergeAction(trigger.old);
    }
        
}