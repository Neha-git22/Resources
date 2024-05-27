trigger RelConError on Contact (before insert,before update) {
    if(trigger.isBefore &&(trigger.isInsert || trigger.isUpdate)){
        RelConError_Handler.RelContacts(trigger.new);
    }
}