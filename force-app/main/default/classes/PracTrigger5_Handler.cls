public class PracTrigger5_Handler {
    
    public static void RContacts(List<Contact> conL){
        set<Id> s = new set<Id>();
        for(Contact c:conL)
        {
            s.add(c.AccountId);
        }
        
        //mapname.containskey(c.AccountId) && mapname.get(c.AccountId)>0
        
        List<Account> accL=[SELECT id, (SELECT id,AccountId,LastName FROM Contacts) from account where id IN :s ];
        Map<Id,Integer> TMap =new Map<Id,Integer>();
        for(Account A: accL){
            TMap.put(A.id,A.Contacts.size());
        }
        for(Contact C:conL){
            if(TMap.containsKey(C.AccountId) && TMap.get(C.AccountId)>0){
                C.Lastname.addError('Contact Already exists!');
            }
        }
    }
}