public class AccountTrigger_handler{
    public static void mergeAction(List<Account> oldaccL){
        List<Account_backup__c> upacc=new List<Account_backup__c>();
        for(Account A:oldaccL){
            if(A.MasterRecordId!=null){            
                Account_backup__c accBack=new Account_backup__c();
                accBack.Account_Name__c=A.Name;
                accBack.Acc_Phone__c=A.Phone;
                upacc.add(accBack);
            }
        }
        insert upacc;
    }
    
}