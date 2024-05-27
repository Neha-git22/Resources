trigger Testtrigger on Contact (before insert, before update) {
    AccountContactPhoneHandler.AccountHandler(trigger.new,trigger.oldMap);
}