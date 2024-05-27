public with sharing class CreateCon {
    
    @AuraEnabled
    public static Id CreateContact(String nameF,String nameL, String Phnum,Date Bdate){
        Contact con=new Contact();
        con.FirstName=nameF;
        con.LastName=nameL;
        con.Phone=Phnum;
        con.Birthdate=Bdate;
        
        insert con;
        return con.Id;
        
        
    }
        
        @AuraEnabled(cacheable=true)
        public static List<Account> GetAccRecords(){
            List<Account> Acc=new List<Account>();
            Acc=[SELECT Name,Id FROM Account];
            return Acc;
        }
}