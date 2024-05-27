trigger AccRelConCount on Contact (After Insert, After Update, After Delete, After Undelete){
    if(Trigger.isAfter && (Trigger.isInsert ||Trigger.isUpdate || trigger.isDelete || Trigger.isUndelete)){
        AccRelConCount_Handler.ConCount(trigger.new,trigger.old);
    }

}