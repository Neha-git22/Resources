trigger NumOfAccRelCons on Account (after insert){
    if(trigger.isAfter && trigger.isInsert){
        NumOfAccRelCons_Handler.CreateCons(trigger.new);
    }

}