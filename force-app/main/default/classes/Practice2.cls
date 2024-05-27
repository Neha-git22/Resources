public class Practice2 {
    public static void Records1(){
        List<Account> accL =new List<Account>();
        
        for(Integer i=0;i<5;i++){
            Account acc=new Account();
            acc.Name='Neha'+i;
            accL.add(acc);
        }
        insert accL;
        
        List<Contact> conL=new List<Contact>();
        
        for(Account A: accL){
            for(Integer i=0;i<3;i++){
                Contact con=new Contact();
                con.LastName='A';
                con.AccountId=A.Id;
                conL.add(con);
            }
        }
        insert conL;
        for(Contact C: conL){
            C.LastName+=C.AccountId;
        }
        
        update conL;
    }
    public static void Records2(){
        List<Contact> conL=new List<Contact>();
        conL=[SELECT Id,LastName,Account.Id,Account.Name FROM Contact];
        for(Contact C: conL){
            C.LastName+=C.AccountId;
        }
        
        update conL;
        
    }
}