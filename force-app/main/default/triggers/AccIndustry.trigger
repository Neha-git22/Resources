trigger AccIndustry on Account (after insert){
    if(trigger.isAfter && trigger.isInsert){
        AccIndustry_Handler.AccRelCon(trigger.new);
        
    }

}