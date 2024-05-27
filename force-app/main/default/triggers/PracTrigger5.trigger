trigger PracTrigger5 on Contact (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        PracTrigger5_Handler.RContacts(trigger.new);
    }

}