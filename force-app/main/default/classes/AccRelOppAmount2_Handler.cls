public class AccRelOppAmount2_Handler {
    public static void OppAmount(List<Opportunity> newoppL,List<Opportunity> oldoppL){
        Set<Id> AccIds=new Set<Id>();
        if(newoppL!=null){
            for(Opportunity O:newoppL){
            AccIds.add(O.AccountId);}
        }
        if(oldoppL!=null){
        for(Opportunity O:oldoppL){
            AccIds.add(O.AccountId);}
        }
        
        List<Account> AmountOpp=[SELECT Id,Opp_Amount_Sum__c,(SELECT Id,Amount FROM Opportunities) FROM Account WHERE Id IN :AccIds];
        Decimal i=0;
        
        for(Account A:AmountOpp){
            for(Opportunity Op:A.Opportunities){
                i+=Op.Amount;  
            }
            A.Opp_Amount_Sum__c=i;
        }
        update AmountOpp;
    }

}