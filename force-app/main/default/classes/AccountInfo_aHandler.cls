public class AccountInfo_aHandler {
    
    @AuraEnabled
    public static String InsertAcc(String Name , String Num , String emil){
        Account A=new Account();
        A.Name=Name;
        A.Phone=Num;
        A.Email__c=emil;
        insert A;
        return A.Id;
        
    }

}