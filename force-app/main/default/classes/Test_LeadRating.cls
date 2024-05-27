@isTest
public class Test_LeadRating {
    @isTest
    public static void TestLead(){
        Lead L=new Lead();
        L.LastName='Snow';
        L.Company='Astrea';
        L.Status='Working';
        L.Website='LeadSource';
        insert L;
        
        Lead check=[SELECT Id,Rating FROM Lead WHERE Id=:L.Id];
        System.assertEquals('Cold',check.Rating);
        L.Website='Lead';
        update L;
        Lead check2=[SELECT Id,Rating FROM Lead WHERE Id=:L.Id];
        System.assertEquals('Hot',check2.Rating);
    }

}