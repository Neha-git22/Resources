trigger UpdateAccRelOppEmail on Account (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        UpdateAccRelOpp_Handler.changeMail(trigger.new,trigger.oldmap);
    }
}