public class ConCountP_Handler {
    public static void FieldPop(List<Contact> conL){
        Set<Id> aconIds = new Set<Id>();
        for(Contact C:conL){
            aconIds.add(C.AccountId);
        }
        
        List<AggregateResult> agrL=[SELECT AccountId,COUNT(Account.Name) FROM Contact WHERE AccountId IN :aconIds GROUP BY AccountId];
        List<Account> accL=[SELECT Id,Contact_Size__c,(SELECT LastName FROM Contacts) FROM Account WHERE Id IN :aconIds];
        
        for(Account A:accL){
            Integer i=A.Contacts.size();
            A.Contact_Size__c=i;
            
        }
    }

}