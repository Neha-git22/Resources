trigger contactprevent on Contact (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        Contactprevent_handler.precontact(trigger.new);
    }
}