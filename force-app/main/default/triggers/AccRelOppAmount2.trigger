trigger AccRelOppAmount2 on Opportunity (after insert, after update, after delete, after undelete) {
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate || trigger.isDelete || trigger.isUndelete)){
        AccRelOppAmount2_Handler.OppAmount(trigger.new,trigger.old);
    }
}