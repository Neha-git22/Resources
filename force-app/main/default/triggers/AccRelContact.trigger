trigger AccRelContact on Account (after insert){
    if(trigger.isAfter && trigger.isInsert){
        AccRelContact_Handler.ConCreate(trigger.new);
    }

}