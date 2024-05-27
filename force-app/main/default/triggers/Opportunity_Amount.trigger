trigger Opportunity_Amount on Opportunity (after update,after insert, after delete, after undelete) {
    
    if(trigger.isAfter){
       Handler_Opportunity_Amount.oppmethod(Trigger.new, Trigger.old);
    }
}