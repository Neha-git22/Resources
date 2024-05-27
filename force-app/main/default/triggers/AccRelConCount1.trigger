trigger AccRelConCount1 on Contact (After Insert, After Update, After Delete, After Undelete){
    if(Trigger.isAfter && (Trigger.isInsert ||Trigger.isUpdate || trigger.isDelete || Trigger.isUndelete)){
        AccRelConCount1_Handler.ConCount(trigger.new,trigger.old);
    }

}