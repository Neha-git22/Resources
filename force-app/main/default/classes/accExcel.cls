public class accExcel{
    public static List<Account> accL{set; get;}
    
    public void getContacts(){
        accL=[SELECT Id,Name FROM Account];
    }
    

}