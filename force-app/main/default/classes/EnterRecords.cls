public class EnterRecords {
    public static void REnter(){
        List<Account> accL=new List<Account>();
        for(Integer i=0;i<600;i++){
            Account Acc=new Account();
            Acc.Name='Harry'+i;
            accL.add(Acc);
   
        }
        insert accL;
        system.debug(accL);
    }
       
}