trigger TriggerSendMail on Account (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        TriggerSendMail_Handler.SendMail(trigger.new);  
    }
}