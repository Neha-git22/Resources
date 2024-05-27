public class OppInfo_Handler {
    @AuraEnabled
    public static String InsertOpp(String Name , Date Dat , String Stage , String aName , Integer Prob){
        Opportunity opp=new Opportunity();
        opp.Name=Name;
        opp.CloseDate=Dat;
        opp.StageName=Stage;
        opp.AccountId=aName;
        opp.Probability=Prob;
        insert opp;
        System.debug(opp);
        return opp.Id;
        
        
    }
    
    
    
    
}