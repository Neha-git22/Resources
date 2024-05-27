trigger OppISOcode on Opportunity (Before insert,Before Update){
    
    if(Trigger.isBefore && Trigger.isInsert){
        OppISOcode_Handler.INSetOppnum(trigger.new);
    }
    
    if(Trigger.isBefore && Trigger.isUpdate){
        
    }
}