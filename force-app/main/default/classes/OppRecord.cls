public with sharing class OppRecord {

    @AuraEnabled
    public static Id Oppinsert(String name,Date Cdate, String stage ){
        Opportunity oppNew= new Opportunity();
        oppNew.Name=name;
        oppNew.StageName=stage;
        oppNew.CloseDate=Cdate;
        
        insert oppNew;
        return oppNew.Id;

    }
}