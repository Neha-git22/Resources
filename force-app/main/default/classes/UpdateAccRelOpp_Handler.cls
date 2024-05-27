public class UpdateAccRelOpp_Handler {
        public static void changeMail(List<Account> newaccL,Map<Id,Account> oldacc){
            
            Map<id,string> Accmap=new Map<id,string>();
            for(Account A:newaccL){
                if(A.Email__c!=oldacc.get(A.id).Email__c)
                Accmap.put(A.Id,A.Email__c);
            }
            List<Opportunity> oppL=[SELECT AccountId,OppEmail__c FROM Opportunity WHERE AccountId IN :Accmap.keySet()];
        
                for(Opportunity opp:oppL){
                    opp.OppEmail__c=Accmap.get(opp.AccountId);
                }
           
            update oppL;
        }
    }