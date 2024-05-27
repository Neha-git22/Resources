public class AccrelConInsert_handler {
    public static void Create(List<Account> accL){
        List<Contact> conUp = new List<Contact>();
        for(Account A:accL){
            Contact con=new Contact();
            con.LastName='test';
            con.AccountId=A.Id;
            conUp.add(con);
        }
        insert conUp;
    }

}