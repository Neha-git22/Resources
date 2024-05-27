@isTest
public class test_iso {

    @isTest
    static void testOpportunityTriggerHandler() {
        List<Opportunity> oppList = new List<Opportunity>();
        Opportunity testOpportunityAUD = new Opportunity(
            Name = 'Test Opportunity AUD',
            ISO_Code__c = 'AUD',
            StageName = 'Prospecting',
            CloseDate = System.Today(),
            Opp_Number__c = 'AVJ10001'
            
        );
        oppList.add(testOpportunityAUD);
        
        //insert testOpportunityAUD;
        //System.assertEquals('AVJ10001', testOpportunityAUD.Opp_Number__c);
        Opportunity testOpportunityUSD = new Opportunity(
            Name = 'Test Opportunity USD',
            ISO_Code__c = 'USD',
            StageName = 'Prospecting',
            CloseDate = System.Today(),
            Opp_Number__c = 'UVJ10001'
        );
        oppList.add(testOpportunityUSD);
        //insert testOpportunityUSD;
        //System.assertEquals('UVJ10001', testOpportunityUSD.Opp_Number__c);
        Opportunity testOpportunityNZD = new Opportunity(
            Name = 'Test Opportunity NZD',
            ISO_Code__c = 'NZD',
            StageName = 'Prospecting',
            CloseDate = System.Today(),
            Opp_Number__c = 'IVJ10001'
        );
        oppList.add(testOpportunityNZD);
        //System.assertEquals('IVJ10001', testOpportunityNZD.Opp_Number__c);
        insert oppList;
        
    }
}