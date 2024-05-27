trigger CaseOrigin on Case (before insert,before update,after undelete) {
    if(trigger.isBefore && trigger.isInsert || trigger.isBefore && trigger.isUpdate || trigger.isAfter && trigger.isUndelete){
        CaseOrigin_Handler.SetCase(trigger.new);
    }

}