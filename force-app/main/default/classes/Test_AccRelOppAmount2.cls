@isTest
public class Test_AccRelOppAmount2 {
    
    @isTest
    public static void testOppAmount(){
        Account A=new Account();
        A.Name='NehaAmountTest';
        insert A;
        
        Opportunity O=new Opportunity();
        O.AccountId=A.Id;
        O.Name='RelOpp1';
        O.CloseDate=Date.newInstance(2024, 08, 09);
        O.StageName='Prospecting';
        O.Amount=10;
        insert O;
        
        Opportunity O1=new Opportunity();
        O1.AccountId=A.Id;
        O1.Name='RelOpp2';
        O1.CloseDate=Date.newInstance(2024, 09, 02);
        O1.StageName='Closed Won';
        O1.Amount=20;
        insert O1;
        
        Account Acc=[SELECT Id,Opp_Amount_Sum__c FROM Account WHERE Id=:A.Id];
        System.assertEquals(30,Acc.Opp_Amount_Sum__c);
        
        Delete O1;
        Account Acc1=[SELECT Id,Opp_Amount_Sum__c FROM Account WHERE Id=:A.Id];
        System.assertEquals(10,Acc1.Opp_Amount_Sum__c);
        
    }

}