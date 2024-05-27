trigger PracTrigger3 on Account (after insert, after update) {
    List<Account> accl=trigger.new;
    List<Contact> conL=new List<Contact>();
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        for(Account A:accL){
            if(A.Create_Contact__c == true){
                for(integer i=0;i<A.Contacts_To_Be_Created__c;i++){
                    Contact con=new Contact();
                    con.LastName='Anne Frank';
                    con.AccountId=A.Id;
                    conL.add(con);
                }
            }
        }
        insert conL;
    }

}