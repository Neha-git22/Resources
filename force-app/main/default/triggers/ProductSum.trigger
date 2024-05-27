trigger ProductSum on Opportunity (after update) {
    if(Trigger.isafter && Trigger.isUpdate){
        ProSum_Handler.ProSold(trigger.new);
    }

}