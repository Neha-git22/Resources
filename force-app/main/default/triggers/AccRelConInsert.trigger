trigger AccRelConInsert on Account (After insert) {
    
    if(Trigger.isAfter && Trigger.isInsert){
        AccrelConInsert_handler.Create(trigger.new);
    }

}