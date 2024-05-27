public class PreventConDupEmail_handler {
    public static void ConEmail(List<Contact> newconL,List<Contact> oldconL){
        Map<Id,String> AccEmails;
        
        if(!newconL.isEmpty()){
            for(Contact C:newconL){
                AccEmails.put(C.AccountId,C.Email);
            }
        }
        if(!oldconL.isEmpty()){
            for(Contact C:oldconL){
                AccEmails.put(C.AccountId,C.Email);
            }
        }
        
        System.debug(AccEmails);
        
       
    }

}