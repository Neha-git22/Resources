trigger ConCount on Contact (after delete,after insert, after update, after undelete) {
    if(trigger.isAfter && (trigger.isDelete || trigger.isInsert || trigger.isUpdate || trigger.isUndelete)){
         ConCount_Handler.RelContacts(trigger.new,trigger.old);
        
    }

}