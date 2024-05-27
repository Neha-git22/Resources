public class ProjectStatusTrigger_Handler{
    public static void handleStatus(List<Assignment__c> asgnL){
        Set<Id> INSstats=new Set<Id>();
        if(asgnL!=null){
            for(Assignment__c A:asgnL){
                INSstats.add(A.ProjectId__c);
            }
        }
              
        List<Assignment__c> oldstats=[SELECT Id,ProjectId__c,Status__c,ProjectId__r.Status__c FROM Assignment__c WHERE ProjectId__c IN :INSstats];
        //Map<Id,Project__c> ProL=new Map<Id,Project__c>([SELECT Id,Status__c FROM Project__c WHERE Id IN :INSstats.keyset()]);
        //List<Project__c> oldstats2=[SELECT Id,Status__c,(SELECT Status__c FROM Project__r) FROM Project__c WHERE Id IN:INSstats];
        Map<Id,Project__c> ProM=new Map<id,Project__c>();

        LIst<Project__c> UPDpros=new List<Project__c>();
            
        Set<Project__c> ProS=new Set<Project__c>();
        
        for(Assignment__c Oa:oldstats){
            if(Oa.Status__c=='Cancelled'){
                Oa.ProjectId__r.Status__c = 'Cancelled';
                //ProS.add(Oa.ProjectId__r);
                if(!ProM.containskey(Oa.ProjectId__c)){
                  ProM.put(Oa.ProjectId__c,Oa.ProjectId__r); }
                //UPDpros.add(Oa.ProjectId__r);
            }
            else if(Oa.Status__c=='Active'){
                Oa.ProjectId__r.Status__c = 'Active';
                //ProS.add(Oa.ProjectId__r);
                if(!ProM.containskey(Oa.ProjectId__c)){
                    ProM.put(Oa.ProjectId__c,Oa.ProjectId__r); }
                UPDpros.add(Oa.ProjectId__r);
            }
            else if(Oa.Status__c=='Completed'){
                Oa.ProjectId__r.Status__c = 'Completed';
                //ProS.add(Oa.ProjectId__r);
                if(!ProM.containskey(Oa.ProjectId__c)){
                    ProM.put(Oa.ProjectId__c,Oa.ProjectId__r); }
                
            }
            UPDpros.add(Oa.ProjectId__r);
            
        }
            System.debug(ProM);
            List<Project__c> Pl=new List<Project__c>(ProS);
            update UPDpros;
            
        
    }

}