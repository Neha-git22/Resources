trigger PreventAccRelopenOpp on Account (before delete){
    if(Trigger.isBefore && Trigger.isDelete){
    PreventAccRelopenOpp_Handler.PreventAccDel(Trigger.old);
    }

}