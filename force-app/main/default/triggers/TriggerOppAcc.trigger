trigger TriggerOppAcc on Account (after insert, after undelete) {
    if(trigger.isAfter && (trigger.isInsert || trigger.isUndelete)){
        TriggerOppAcc_Handler.CreateOpp(trigger.new);
    }

}