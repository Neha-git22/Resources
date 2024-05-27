@isTest
public class Test_UpdateAccRelOpp {
    static testmethod void AccRelOppTest(){
        Account newAcc=new Account();
        newAcc.Name='Cersei';
        newAcc.Email__c='neha99789958@gmail.com';
        insert newAcc;
        
        Opportunity RelOpp=new Opportunity();
        RelOpp.AccountId=newAcc.Id;
        RelOpp.Name='Lannister';
        RelOpp.CloseDate=Date.newInstance(2024, 08, 09);
        RelOpp.StageName='Closed';
        insert RelOpp;
        
        newAcc.Email__c='neha@gmail.com';
        update newAcc;
        
       Opportunity RelOpp1=[SELECT Id,OppEmail__c FROM Opportunity WHERE Id=:RelOpp.Id];
       System.assertEquals('neha@gmail.com',RelOpp1.OppEmail__c);
        
        
    }
}