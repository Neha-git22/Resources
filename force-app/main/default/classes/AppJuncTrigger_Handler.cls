public class AppJuncTrigger_Handler {
    public static void CheckCandidate(List<Application__c> appL){
        //Set<Id> appIds=new Set<Id>();
        Set<Id> canIds=new Set<Id>();
        for(Application__c A:appL){
            if(A.Status__c=='Selected'){
                canIds.add(A.Candidate_Id__c);
                //appIds.add(A.Id);
            }
        }
        
        List<Application__c> SelApps=[SELECT Name,Candidate_Id__c,Status__c,Candidate_Id__r.Name FROM Application__c WHERE Candidate_Id__c IN :canIds AND Status__c='In Progress'];
        
        for(Application__c Ac:SelApps){
            ac.Name=ac.name+ac.Candidate_Id__r.name;
            //11
            Ac.Status__c='Rejected';
        }
        update SelApps;
    }
    
}