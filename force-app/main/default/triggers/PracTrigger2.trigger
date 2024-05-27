trigger PracTrigger2 on Account (after insert) {
        List<Account> accL=trigger.new;
        List<Contact> conL=new List<Contact>();
    for(Account A: accL){
        Contact con=new Contact();
        con.LastName='Frank';
        con.AccountId=A.Id;
        conL.add(con);
    }
    insert conL;
}