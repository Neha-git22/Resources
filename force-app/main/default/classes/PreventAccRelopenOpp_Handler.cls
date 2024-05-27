public class PreventAccRelopenOpp_Handler{
    public static void PreventAccDel(List<Account> oldaccL){
        Set<Id> accIds=new Set<Id>();
        if(!oldaccL.isEmpty()){
            for(Account A:oldaccL){
                accids.add(A.Id);
            }
        }
        
       
        List<Opportunity> accRelopp = [SELECT Id,StageName,Account.Id FROM Opportunity WHERE Account.Id IN :accids];
        Map<Id,String> accM=new Map<Id,String>();
        for(Opportunity O:accRelopp){
            accM.put(O.Account.Id,O.StageName);
        }
        
        for(Account A:oldaccL){
            if(accM.get(A.Id)!='Closed Lost' || accM.get(A.Id)!='Closed Won'){
                A.addError('Cannot delete due to open opportunity!');
            }
        }
    }

}