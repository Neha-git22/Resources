trigger ProjectStatusTrigger on Assignment__c (After Update,After Insert,After Delete,Before Insert,Before Update){
    if(trigger.isAfter && (trigger.isUpdate || trigger.isInsert)){
        ProjStat.handleStatus(trigger.new);
    }

}