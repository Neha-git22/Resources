public class RelConError_Handler {
    public static void RelContacts(List<Contact> conL){
        set<Id> AccIds = new set<id>();
        for(contact con : conL){
            AccIds.add(con.AccountId);
        }
        Map<Id, Integer> Counter = new map<Id, Integer>();
        List<contact> Cons = [Select AccountId from Contact where AccountId in : AccIds];
        for(Contact C : Cons){
            if(Counter.containsKey(C.AccountId)){
                Counter.put(C.AccountId, Counter.get(C.AccountId)+1);
            }
            else {
                Counter.put(C.AccountId, 1);
            }
        }
        for (contact i : conL){
            if(Counter.get(i.AccountId)>1){
                i.adderror('2 Contacts already exist');
            } 
        }
    }
}