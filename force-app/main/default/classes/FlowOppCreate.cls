public with sharing class FlowOppCreate {

    @AuraEnabled
    public static Id OppInsert(String name,String stage,String accId,Date Cdate){
        Opportunity Opp=new Opportunity();
        Opp.AccountId=accId;
        Opp.Name=name;
        Opp.StageName=stage;
        Opp.CloseDate=Cdate;
        insert Opp;
        return Opp.Id;
    }
}