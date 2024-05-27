public class AccRelConCount1_Handler {
    public static void ConCount(List<Contact> conL,List<Contact> oldconL){
        Set<Id> conIds=new Set<Id>();
        List<Account> upacc=new List<Account>(); 
        if(!conL.isEmpty()){
            for(Contact C:conL){
                conIds.add(C.AccountId);
            }
        }
        if(oldconL!=null){
            for(Contact C:oldconL){
                conIds.add(C.AccountId);
            }
        } 
        
        List<Account> accL=[SELECT Number_of_Contacts__c,Id,(SELECT LastName FROM Contacts) FROM Account WHERE Id IN :conIds];
        
        for(Account A:accL){
            A.Number_of_Contacts__c=A.Contacts.size();
            upacc.add(A);
        }
        if(upacc!=null){
            update upacc; }
    } 
    
}