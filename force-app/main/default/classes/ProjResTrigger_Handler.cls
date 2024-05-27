public class ProjResTrigger_Handler{
    public static void TotalhoursUPD(List<Project_Resource__c> ProResL,List<Project_Resource__c> oldPR){
        Set<Id> updIds=new Set<Id>();
        if(!ProResL.isEmpty()){
            for(Project_Resource__c PR:ProResL){
                updIds.add(PR.ProjectId__c);
            }
        }
        if(oldPR!=null){
            for(Project_Resource__c PR:oldPR){
                updIds.add(PR.ProjectId__c);
            }
        }
        
        List<Project__c> ProjectL=new List<Project__c>();
        Map<Id,Decimal> updmap=new Map<Id,Decimal>();
        List<AggregateResult> PRList=[SELECT ProjectId__c,SUM(Hours_Worked__c) Hsum FROM Project_Resource__c WHERE ProjectId__c IN:updIds GROUP BY ProjectId__c];
        for(AggregateResult agg:PRList){
            updmap.put((Id)agg.get('ProjectId__c'), (Decimal)agg.get('Hsum'));
        }
        for(Project__c proj:[SELECT Id,Total_hourss__c FROM Project__c]){
            if(updmap.containsKey(proj.Id)){
                proj.Total_hourss__c=updmap.get(proj.Id);
            }
            ProjectL.add(proj);
        }
        update ProjectL;
    }

}