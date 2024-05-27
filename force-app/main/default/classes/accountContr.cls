public class accountContr {
    
    public List<Account> account{get; set;}
    
    public accountContr(){
     account = [select ID,Name,Phone from Account];
    }


}