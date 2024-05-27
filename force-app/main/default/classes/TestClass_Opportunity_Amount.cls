@isTest
public class TestClass_Opportunity_Amount {
    @isTest
    public static void testOppMethod(){
        //Test.startTest();
        Account acc= new Account(Name='Test');
        Insert acc;
        test.startTest();
        Opportunity opp1= new Opportunity(
            Name='Opportunity 1',
            Amount=1000,
            CloseDate=Date.today(),
            StageName='Prospecting',
            AccountId=acc.Id);
        Insert opp1;
        Opportunity opp2= new Opportunity(
            Name='Opportunity 2',
            Amount=2000,
            CloseDate=Date.today(),
            StageName='Prospecting',
            AccountId=acc.Id);
        
        Insert opp2;
        
        
        acc=[Select id,Opportunity_Amount__c From Account WHERE Id=:acc.Id];
        system.assertEquals(3000, acc.Opportunity_Amount__c);
        opp1.Amount=2000;
        update opp1;
        opp2.Amount=3000;
        update opp2;
        acc=[SELECT id,Opportunity_Amount__c FROM Account WHERE Id=:acc.Id];
        system.assertEquals(5000, acc.Opportunity_Amount__c);
        //Test.stopTest();  
        delete new List<Opportunity>{opp1,opp2};      
        test.stopTest();    
            }
}