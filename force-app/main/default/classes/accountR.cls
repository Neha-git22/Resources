public with sharing class accountR {
    
    @AuraEnabled
    public static List<Account> getAccRecords(){
        List<Account> acc=[SELECT Name, phone, Email__c, Rating FROM Account];
        return acc;
    
    }
    
    @AuraEnabled
    public static void editAcc(Id i,String N,String P,String E,String R){
            Account Acc=[SELECT Name,Phone,Email__c,Rating FROM Account WHERE Id=:i];
          
          if(N!=null){
             Acc.Name=N;
          }
          if(P!=null){
            Acc.Phone=P;
          }
          if(E!=null){
            Acc.Email__c=E;
          }
          if(R!=null){
            Acc.Rating=R;
          }
          update Acc;

    }
    
    @AuraEnabled
    public static void saveAccounts(List<account> records){
        if(records.size()>0 && records != null){
            List<account> accs = new List<account>();
            
            for(integer i = 0; i < records.size(); i++) {
                account acc = new account();
                acc.Id = records[i].Id;
                acc.Name = records[i].Name;
                acc.Phone = records[i].Phone;
                accs.add(acc);
            }
            
            upsert accs;
        }
    }
}