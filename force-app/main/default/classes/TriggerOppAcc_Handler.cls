public class TriggerOppAcc_Handler {
    
    public static void CreateOpp(List<Account> newaccL){
        List<Opportunity> oppL=new List<Opportunity>();
        for(Account acc : newaccL){
            opportunity opp = new opportunity();
            opp.Name='newOpp';
            opp.CloseDate=Date.today().addDays(20);
            opp.StageName='Prospecting';
            opp.Accountid=acc.id;
            oppL.add(opp);
        }
        insert oppL;
        update oppl;
    }
}