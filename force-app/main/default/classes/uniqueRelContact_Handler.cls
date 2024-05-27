public class uniqueRelContact_Handler {
   
    public static void RelatedCon(List<Contact> conL){
        
        set<Id> accId = new set<Id>();
        for(Contact con:conL)
        {
            accId.add(con.AccountId);
        }
                
        List<Contact> RelCons=[SELECT Phone,AccountId FROM Contact WHERE Accountid=:accId];
        for(Contact con:conL){
            for(Contact con1:RelCons)
                if(con.Phone==con1.Phone){
                    con.addError('cannot Add!');
                }
        }
    }
}