public class ConCount_Handler {
    public static void RelContacts(List<Contact> conL,List<Contact> oldconL){
        Set<Id> accIds = new Set<Id>();
        List<Account> upacc=new List<Account>();
           
       if(conL!=null) 
        {for(Contact C: conL){
            accIds.add(C.AccountId);
        }} 
        
        if(oldconL!=null)
        {for(Contact C1: oldconL){
            accIds.add(C1.AccountId);
        }} 
        
        List<Account> accL=[SELECT Number_of_Contacts__c,Id,(SELECT LastName FROM Contacts) FROM Account WHERE Id IN :accIds];
        
        for(Account A:accL){
            A.Number_of_Contacts__c=A.Contacts.size();
            upacc.add(A);
        }
        update upacc;
    }

}