trigger ContactMail on Contact (after insert){
    if(trigger.isAfter && trigger.isInsert){
        ContactMail_Handler.ContactMail(trigger.new);
    }

}