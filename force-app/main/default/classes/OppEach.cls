public class OppEach {
    public static void OppCreate(){
        List<Account> accL=new List<Account>();
        List<Opportunity> oppL=new List<Opportunity>();
        for(Integer i=0;i<3;i++){
            Account A=new Account();
            A.Name='ne'+i; 
            accL.add(A);
            
        }
        Insert accL;
        
        for(Account acc:accL)
        {
            for(Integer o=0;o<5;o++){
                opportunity Opp=new Opportunity();
                Opp.AccountId=acc.Id;
                Opp.StageName='Closed Won';
                Opp.CloseDate=Date.newInstance(2023, 12, 20);
                Opp.Name='newl'+o;
                oppL.add(Opp);
                
        }}
        Insert oppL;
        
    }

}