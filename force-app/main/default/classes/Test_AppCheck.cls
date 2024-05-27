@isTest
public class Test_AppCheck {
    @isTest
    public static void CandCheck(){
       Application__c A1=new Application__c();
        A1.Name='A1';
        A1.Candidate_Id__c='a0C2t000004MvP6EAK';
        A1.Position__c='a0D2t000005jNaJEAU';
        A1.Status__c='In Progress';
        
        
        Application__c A2=new Application__c();
        A1.Name='A2';
        A2.Candidate_Id__c='a0C2t000004MvP6EAK';
        A2.Position__c='a0D2t000005jNaKEAU';
        A2.Status__c='In Progress';
        
        List<Application__c> apps=new List<Application__c>();
        apps.add(A1);
        apps.add(A2);
        insert apps;
        
        Application__c A3=new Application__c();
        A3.Candidate_Id__c='a0C2t000004MvP6EAK';
        A3.Position__c='a0D2t000005jNaKEAU';
        A3.Status__c='Selected';
        insert A3;
        
        
        
        List<Application__c> appLi =[SELECT Status__c FROM Application__c WHERE Name LIKE 'A'];
        //Set<Application__c> appSe = new Set<Application__c>(appLi);
        for(Application__c A:appLi){
        System.AssertEquals('Rejected',A.Status__c);
        }
    }
}