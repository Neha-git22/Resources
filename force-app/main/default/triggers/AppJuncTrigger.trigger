trigger AppJuncTrigger on Application__c (Before Insert){
    if(Trigger.isBefore && Trigger.isInsert){
        AppJuncTrigger_Handler.CheckCandidate(Trigger.new);
    }

}