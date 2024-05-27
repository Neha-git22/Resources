public class Handler_Opportunity_Amount {
    public static void oppmethod(List<Opportunity> OppNewList,List<Opportunity> OppOldList){
        set<Id> ids= new set<Id>();
        if(OppNewList != null){
            for(Opportunity opp: OppNewList){
                if(opp.AccountId!=NULL){
                    ids.add(opp.AccountId);
                }
            }
        }
        if(OppOldList != null){
            for(Opportunity opp: OppOldList){
                if(opp.AccountId!=NULL){
                    ids.add(opp.AccountId);
                }
            }
        }
        system.debug(OppNewList);
        map<Id, Decimal> mp= new map<Id, Decimal>();
        for(AggregateResult opp: [SELECT SUM(Amount) amt,AccountId FROM Opportunity WHERE AccountId In :ids GROUP BY AccountId]){
            mp.put( (Id)opp.get('AccountId'), (Decimal)opp.get('amt') );
            /*if(!mp.containsKey(opp.AccountId)){
                mp.put(opp.AccountId,opp.Amount);
            }
            else {
                mp.put(opp.AccountId,mp.get(opp.AccountId)+opp.Amount);
            }*/
        }
        system.debug(mp);
      List<Account> toUpdate = new List <Account>();
        for(Account acc: [SELECT id,Opportunity_Amount__c FROM Account WHERE Id In :ids]){
            if(mp.containsKey(acc.Id)){
				acc.Opportunity_Amount__c=mp.get(acc.Id);	
            }
            else{
                acc.Opportunity_Amount__c=0;
            }
          toUpdate.add(acc);
        }  
        
        if(toUpdate.size()>0){
            Update toUpdate;
        }
    }

}