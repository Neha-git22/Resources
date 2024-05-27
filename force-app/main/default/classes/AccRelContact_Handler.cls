public class AccRelContact_Handler {
    public static void ConCreate(List<Account> accL){
        List<Contact> conL=new List<Contact>();
        for(Account A:accL){
            Contact con=new Contact();
            con.AccountId=A.Id;
            con.Lastname=A.Name+'Related';
            conL.add(con);
        }
        insert conL;
    }

}