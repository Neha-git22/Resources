public class AccRelConCount_Handler {
    public static void ConCount(List<Contact> conL,List<Contact> oldconL){
        Set<Id> conIds;
        List<Account> upacc; 
        if(!conL.isEmpty()){
            for(Contact C:conL){
                conIds.add(C.AccountId);
            }
        }
        if(!oldconL.isEmpty()){
            for(Contact C:oldconL){
                conIds.add(C.AccountId);
            }
        } 
        
        List<Account> accL=[SELECT Number_of_Contacts__c,Id,(SELECT LastName FROM Contacts) FROM Account WHERE Id IN :conIds];
        
        for(Account A:accL){
            A.Number_of_Contacts__c=A.Contacts.size();
            upacc.add(A);
        }
        update upacc;
    } 
    
}