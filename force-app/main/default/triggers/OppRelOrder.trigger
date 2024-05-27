trigger OppRelOrder on Opportunity (After Update){
    if(Trigger.isAfter && Trigger.isUpdate){
        OppRelOrder_Handler.OrderInsert(trigger.new,trigger.oldmap);
    }

}