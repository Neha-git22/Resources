public class AccIndustry_Handler{
    public static void AccRelCon(List<Account> accL){
        for(Account A:accL){
            if(A.Industry=='Banking'){
                Contact con=new Contact();
                con.AccountId=A.Id;
                con.LastName=A.Name;
                con.Phone=A.Phone;
                insert con;
            }
        }
        
    }

}