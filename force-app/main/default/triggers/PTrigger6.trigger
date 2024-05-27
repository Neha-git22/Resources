trigger PTrigger6 on Contact (after insert, after delete, after update, after undelete){
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate|| trigger.isDelete || trigger.isUndelete)){
        PTrigger6_Handler.RContacts(trigger.new,trigger.old);
    }

}