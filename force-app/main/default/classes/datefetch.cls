public class datefetch {
    //SET-2 QUES-1
    public static void getacc(){
        Date d=Date.newInstance(2020, 11, 1);
        List<Account> accL=[SELECT Id,CreatedDate,Name FROM Account WHERE Name='neha' AND CreatedDate >=:d];
        System.debug(accL);
    }
    
    public static void fetch(){
        List<Account> accL=[SELECT Id,Name,(SELECT Id FROM Contacts) FROM Account];
        for(Account A:accL){
            if(A.Contacts.size()==0){
                System.debug(A);
            }
        }
    }

    
}