public class ProSum_Handler {
    public static void ProSold(List<Opportunity> oppL){
            Set<Id> products = new Set<Id>();
            
            Map<Id, Decimal> productQuantityMap = new Map<Id, Decimal>();
            
            for (Opportunity opp : oppL) {
                if (opp.StageName == 'Closed Won'){
                    List<OpportunityLineItem> lineItems = [SELECT Id, Product2Id, Quantity FROM OpportunityLineItem WHERE OpportunityId = :opp.Id];

                    for (OpportunityLineItem items : lineItems) {
                        products.add(items.Product2Id);
                       
                        if (productQuantityMap.containsKey(items.Product2Id)) {
                            productQuantityMap.put(items.Product2Id, productQuantityMap.get(items.Product2Id) + items.Quantity);
                        } else {
                            productQuantityMap.put(items.Product2Id, items.Quantity);
                        }
                    }
                }
            }
            List<Product2> productsToUpdate = [SELECT Id, Number_Of_Products__c FROM Product2 WHERE Id IN :products];
            for (Product2 product : productsToUpdate){
                if (productQuantityMap.containsKey(product.Id)) {
                    product.Number_Of_Products__c = productQuantityMap.get(product.Id).intValue() +1;
                }
            }
            
            update productsToUpdate;
        } 
    }