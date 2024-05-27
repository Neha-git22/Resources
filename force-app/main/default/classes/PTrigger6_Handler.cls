public class PTrigger6_Handler {
    public static void RContacts(List<Contact> newL,List<Contact> oldL){
         Set<Id> Idset =new Set<Id>();
        if(newL!=null){
            for(Contact C:newL){
                Idset.add(C.id);
            }
        }
        if(oldL!=null){
            for(Contact C:oldL){
                Idset.add(C.id);
            }
        }
        
        List<Account> accL=[SELECT id,Name,Contact_Size__c,(SELECT id FROM Contacts) FROM Account WHERE Id IN :Idset];
        List<Account> accUpdate=new List<Account>();
        if(accL.size()>0){
            for(Account A:accL){
              A.Contact_Size__c=A.Contacts.size();
                accUpdate.add(A);
            }
         }
        update accUpdate;
        }
           
    }