trigger CreateAccRelCon on Account (After insert,After Undelete){
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUndelete)){
        CreateAccRelCon_Dispatcher.dispatch(Trigger.OperationType);
    }
}