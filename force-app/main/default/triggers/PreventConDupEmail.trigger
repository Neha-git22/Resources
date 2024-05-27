trigger PreventConDupEmail on Contact (before insert,Before Update) {
        PreventConDupEmail_handler.ConEmail(trigger.new,trigger.old);
}