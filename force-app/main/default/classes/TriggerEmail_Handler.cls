public class TriggerEmail_Handler{
    public static void ContactCheck(List<contact> newconL, Map<id,contact> oldconM){
        for(Contact c:newconL){
            if(c.Email==oldconM.get(c.id).Email){
                c.email.addError('Cannot Enter same Email!');
            }
            
        }
    }   
}