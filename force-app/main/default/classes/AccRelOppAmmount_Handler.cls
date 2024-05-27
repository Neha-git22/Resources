public class AccRelOppAmmount_Handler {
    public static void OppAmount(List<Account> accL){
        Set<Id> accIds=new Set<Id>();
        for(Account A:accL){
            accIds.add(A.Id);
        }
        
        List<Account> newAcc=[SELECT Id,Name,(SELECT Amount FROM Opportunities) FROM Account WHERE Id IN :accIds];
        
        for(Account A:newAcc){
            
            
        }
    }

}