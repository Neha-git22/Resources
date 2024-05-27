public class ProjStat{
    public static void handleStatus(List<Assignment__c> asgnL){
        Set<Id> INSstats=new Set<Id>();
        if(asgnL!=null){
            for(Assignment__c A:asgnL){
                INSstats.add(A.ProjectId__c);
            }
        }
        //List<Project__c> oldstats2=[SELECT Id,Status__c,(SELECT Status__c FROM Assignment__r) FROM Project__c WHERE Id IN:INSstats];
        List<Assignment__c> oldstats=[SELECT Id,ProjectId__c,Status__c,ProjectId__r.Status__c FROM Assignment__c WHERE ProjectId__c IN :INSstats];
        Map<Id,String> CrpMap=new Map<Id,String>();
        List<Project__c> UPDpros=new List<Project__c>();
        for(Assignment__c O:oldstats){
            if(!CrpMap.containsKey(O.ProjectId__c)){
                if(O.Status__c=='Cancelled'){
                    CrpMap.put(O.ProjectId__c,'Ca');
                }
                if(O.Status__c=='Active'){
                    CrpMap.put(O.ProjectId__c,'A');
                }
                if(O.Status__c=='Completed'){
                    CrpMap.put(O.ProjectId__c,'Co');
                }
            }
            else{
                if(O.Status__c=='Cancelled'){
                    CrpMap.put(O.ProjectId__c,'Ca');
                }
                if(O.Status__c=='Active' && CrpMap.get(O.ProjectId__c)!='Ca'){
                    CrpMap.put(O.ProjectId__c,'A');
                }
                if(O.Status__c=='Completed' && CrpMap.get(O.ProjectId__c)=='Co'){
                    CrpMap.put(O.ProjectId__c,'Co');
                }
            }
        }
        
        List<Project__c> Pros=[SELECT Id,Status__c FROM Project__c WHERE Id IN :INSstats];
        
        for(Project__c P:Pros){
            if(CrpMap.containsKey(P.Id)){
                if(CrpMap.get(P.Id)=='A'){
                    P.Status__c='Active';
                }
                if(CrpMap.get(P.Id)=='Ca'){
                    P.Status__c='Cancelled';
                }
                if(CrpMap.get(P.Id)=='Co'){
                    P.Status__c='Completed';
                }
            }
        }
        update Pros;
        
    }
    
}