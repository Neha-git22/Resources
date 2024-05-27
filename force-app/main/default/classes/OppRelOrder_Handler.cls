public class OppRelOrder_Handler{
    public static void OrderInsert(List<Opportunity> newOppL,Map<Id,Opportunity> oldOppM){
        Set<Id> OppIds=new Set<Id>();
        for(Opportunity O:newOppL){
            if(O.StageName!=oldOppM.get(O.Id).StageName && (O.StageName=='Closed Won' || O.StageName=='Closed Lost')){
                OppIds.add(O.Id);
            }
        }
        
        Id AccId=[SELECT Id,Name FROM Account WHERE Name='nehahahah'][0].Id;
        //Id CtrId=[SELECT Id,AccountId FROM Contract WHERE AccountId=:AccId][0].Id;
        List<Opportunity> OppList=[SELECT Id FROM Opportunity WHERE Id IN :OppIds];
        
        Id PEId=[SELECT Id FROM PricebookEntry WHERE Pricebook2.Name='standard' LIMIT 1][0].Id;
        Id ProId=[SELECT Id,Product2.Id FROM PricebookEntry WHERE Id=:PEId][0].Product2.Id;
        Id PbId=[SELECT Id,Pricebook2Id FROM PricebookEntry WHERE Id=:PEId][0].Pricebook2Id;
            
        List<Order> RelOrders=new List<Order>();
        if(!OppList.isEmpty()){
            for(Opportunity O:OppList){
                Order OppOrder= new Order();
                OppOrder.OpportunityId=O.Id;
                OppOrder.AccountId=AccId;
                OppOrder.EffectiveDate=Date.newInstance(2023, 12, 29); 
                //OppOrder.ContractId=CtrId;
                OppOrder.Status='Draft';
                OppOrder.Pricebook2Id=PbId;
                RelOrders.add(OppOrder);
            }
        }
        insert RelOrders;
        
        Map<Id,Id> OrderIds=new Map<Id,Id>();
        for(Order Ord:RelOrders){
            OrderIds.put(Ord.OpportunityId,Ord.Id);
        }
        
        List<OrderItem> OItemsList=new List<OrderItem>();
        List<OpportunityLineItem> OliList=[SELECT Product2Id,OpportunityId,PricebookEntryId,UnitPrice,Opportunity.Name FROM OpportunityLineItem WHERE OpportunityId IN :OppIds];
            for(OpportunityLineItem Oi:OliList){
                OrderItem OdItem=new OrderItem();
                OdItem.Quantity=2;
                OdItem.OrderId=OrderIds.get(Oi.OpportunityId);
                OdItem.PricebookEntryId=Oi.PricebookEntryId;
                OdItem.UnitPrice=Oi.UnitPrice;
                OdItem.Product2Id=Oi.Product2Id;
                OItemsList.add(OdItem);
            }
        insert OItemsList;

    }

}