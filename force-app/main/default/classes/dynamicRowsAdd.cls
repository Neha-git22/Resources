public class dynamicRowsAdd {
    public List<InnerClassAccountList> accList {get;set;}
    public Integer rowToRemove {get;set;}   
    
    public dynamicRowsAdd(){
        accList = new List<InnerClassAccountList>();
        addNewRowToAccList();
    }    
    
    public PageReference SaveMultipleAccounts(){
        system.debug('==accList==>'+accList.size());
        List<Account> insertedAccountRecords = new List<Account>();
        if(accList !=null && !accList.isEmpty()){
            for(InnerClassAccountList eachRecord : accList ){
                Account accTemp = eachRecord.record;
                insertedAccountRecords.add(accTemp);                
            }
            system.debug('==insertedAccountRecords==>'+insertedAccountRecords.size());
            insert insertedAccountRecords;
        }  
        
        pagereference pg = new pagereference('/apex/dynamicRowsAdd');        
        pg.setredirect(true);               
        return pg;
        
    }    
    
    public void removeRowFromAccList(){
        accList.remove(rowToRemove);
    }
    
    public void addNewRowToAccList(){
        InnerClassAccountList newRecord = new InnerClassAccountList();
        Account newAccountRecord = new Account();        
        newRecord.record = newAccountRecord;
        newRecord.index = accList.size();
        accList.add(newRecord);
    }    
    
    public class InnerClassAccountList{
        public Integer index {get;set;}
        public Account record {get;set;}
    }     
}