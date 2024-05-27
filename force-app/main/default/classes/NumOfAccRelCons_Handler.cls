public class NumOfAccRelCons_Handler {
    public static void CreateCons(List<Account> accL){
        List<Contact> conL=new List<Contact>();
        for(Account A:accL){
            for(Integer i=1;i<=A.NumberofLocations__c;i++){
                Contact con=new Contact();
                con.AccountId=A.Id;
                con.Lastname='RelCon'+i;
                conL.add(con);
            }
        }
        insert conL;
             
        
    }

}