trigger LeadRating on Lead (before insert,before update, after undelete){
    if(trigger.isBefore && trigger.isInsert || trigger.isBefore && trigger.isUpdate || trigger.isAfter && trigger.isUndelete){
        LeadRating_Handler.SetLead(trigger.new);
    }

}