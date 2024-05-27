public class contactprevent_handler {
    public static void precontact(List<contact> conlist){
        set<Id> accountids = new set<id>();
        for(contact newcon : conlist){
            accountids.add(newcon.AccountId);
        }
            Map<Id, Integer> concount = new map<Id, Integer>();
            List<contact> ec = [Select AccountId from Contact where AccountId in : accountids];
            for(contact existingContact : ec){
                if(concount.containsKey(existingContact.AccountId)){
                    concount.put(existingContact.AccountId, concount.get(existingContact.AccountId)+1);
                }
                    else {
                        concount.put(existingContact.AccountId, 1);
                    }
                           }
               for (contact newcons : conlist){
                        if(concount.containskey(newcons.AccountId)){
                            newcons.adderror('Cannot add a new contact');
                        } 

}
}
        
    }