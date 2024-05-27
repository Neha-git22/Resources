trigger OppRelProd on Opportunity (after insert){
    OppRelProd_Handler.CreateProd(trigger.new);
    

}