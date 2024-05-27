trigger uniqueRelContact on Contact (before insert, before update) {
    
    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        uniqueRelContact_Handler.RelatedCon(trigger.new);
    }

}