trigger TriggerEmail on Contact (before update) {
    if(trigger.isBefore && trigger.isUpdate){
        TriggerEmail_Handler.ContactCheck(trigger.new,trigger.oldmap);
    }

}