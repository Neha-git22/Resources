public class CreateAccRelCon_Handler{
    public static void ConCreate(List<Account> accL){
        Set<Id> accIds=new Set<Id>();
        List<Contact> conUpdL;
        
        if(!accL.isEmpty()){
            for(Account A:accL){
                accIds.add(A.Id);
            }
        }
        
        List<Account> checkaccL=[SELECT Id,Name,(SELECT Id,LastName FROM Contacts) FROM Account WHERE Id IN :accIds];
        
        if(!checkaccL.isEmpty())
        {
            for(Account A:checkaccL){
                if(A.Contacts.size()==0){
                    Contact con=new Contact();
                    con.AccountId=A.Id;
                    con.LastName='Trigger con';
                    conUpdL.add(con);
                }
            }
        }
        insert conUpdL;
    }
    
}