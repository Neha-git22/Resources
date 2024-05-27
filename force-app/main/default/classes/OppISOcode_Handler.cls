public class OppISOcode_Handler{
    public static void INSetOppnum(List<Opportunity> oppL){
        Integer i=10001;
        /*Map<Id,String> Isocodes=new Map<Id,String>();
if(!oppL.isEmpty()){
for(Opportunity O:oppL){
Isocodes.put(O.Id,O.ISO_Code__c);
}
}*/
        //CSopplist__c C1=CSopplist__c.getinstance('AUD');
        //CSopplist__c C2=CSopplist__c.getinstance('USD');
        //CSopplist__c C3=CSopplist__c.getinstance('NZD');
        Map<String,CSopplist__c> CSmap=new Map<String,CSopplist__c>();
        CSmap.put('AUD',CSopplist__c.getinstance('AUD'));
        CSmap.put('USD',CSopplist__c.getinstance('USD'));
        CSmap.put('NZD',CSopplist__c.getinstance('NZD'));
        
        if(!oppL.isEmpty()){
            for(Opportunity O:oppL){
                
                //Opportunity oldOppValues=[SELECT Opp_Number__c FROM Opportunity WHERE ISO_Code__c=:O.ISO_Code__c ORDER BY CreatedDate DESC LIMIT 1];
                if(O.ISO_Code__c=='AUD'){
                    //i=Integer.valueOf(oldOppValues.Opp_Number__c.substringAfter('AVJ')) + 1;
                    
                    O.Opp_Number__c='AVJ'+CSmap.get('AUD').ISO_numbers__c;
                    CSmap.get('AUD').ISO_numbers__c++;
                    
                }
                
                if(O.ISO_Code__c=='USD'){
                    //i=Integer.valueOf(oldOppValues.Opp_Number__c.substringAfter('AVJ')) + 1;
                    
                    O.Opp_Number__c='UVJ'+CSmap.get('USD').ISO_numbers__c;
                    CSmap.get('USD').ISO_numbers__c++;
                    
                }
                
                if(O.ISO_Code__c=='NZD'){
                    //i=Integer.valueOf(oldOppValues.Opp_Number__c.substringAfter('AVJ')) + 1;
                    
                    O.Opp_Number__c='IVJ'+CSmap.get('NZD').ISO_numbers__c;
                    CSmap.get('NZD').ISO_numbers__c++;
                    
                }
                
                
                
                
                /*if(oldOppValues==null && O.ISO_Code__c=='AUD'){
O.Opp_Number__c='AVJ'+i;
}
if(oldOppValues==null && O.ISO_Code__c=='USD'){
O.Opp_Number__c='UVJ'+i;
}
if(oldOppValues==null && O.ISO_Code__c=='NZD'){
O.Opp_Number__c='IVJ'+i;
}*/
            }
            update CSmap.values();
            
        }
    }
    
}