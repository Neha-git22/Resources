public class OppRelProd_Handler{
    public static void CreateProd(List<Opportunity> oppL){
        List<OpportunityLineItem> Oli=new List<OpportunityLineItem>();
        Id PId=[SELECT Id FROM PricebookEntry WHERE Pricebook2.Name='standard' LIMIT 1][0].Id;
        if(oppL!=null){
            for(Opportunity O:oppL){
                OpportunityLineItem Oppli=new OpportunityLineItem();
                Oppli.OpportunityId=O.Id;
                Oppli.Quantity=4;
                Oppli.TotalPrice=4000;
                Oppli.PricebookEntryId=PId;
                Oppli.Product2Id=[SELECT Id,Product2.Id FROM PricebookEntry WHERE Id=:Oppli.PricebookEntryId][0].Product2.Id;
                
                //Opp.Name='Product';
                Oli.add(Oppli);
            }
        }
        insert Oli;
    }
}