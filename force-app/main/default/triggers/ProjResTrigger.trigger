trigger ProjResTrigger on Project_Resource__c (Before insert,Before update,After insert,After update,After delete){
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        ProjResTrigger_Handler.TotalhoursUPD(trigger.new,trigger.old);
    }

}