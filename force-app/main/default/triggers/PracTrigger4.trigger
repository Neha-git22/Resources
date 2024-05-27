trigger PracTrigger4 on Contact (after insert, after update, after delete, after undelete){
    List<Account> accL =[SELECT Id,Name,Contact_Size__c, (SELECT Id FROM Contacts) FROM Account];
     for(Account A:accL){
        A.Contact_Size__c=A.Contacts.size();
       }
    update accL;

}