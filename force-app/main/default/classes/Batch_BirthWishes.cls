global class Batch_BirthWishes implements database.Batchable<sObject>{
    global List<Messaging.SingleEmailMessage> SendList;
    
    
    global Batch_BirthWishes(){
        SendList = new List<Messaging.SingleEmailMessage>();
    }
    global database.QueryLocator start(Database.BatchableContext ctx){
        //Fetch Your Data here, for example-
        String q ='SELECT Id,LastName,Email,Birthdate FROM Contact WHERE Birthdate!=NULL AND Birthdate=TODAY';
        return database.getQueryLocator(q);
    }
    
    global void execute(Database.BatchableContext ctx, List<Contact> conList){
        //Perform you Logic here, for example-
        EmailTemplate temp=[SELECT Id FROM EmailTemplate WHERE DeveloperName='BirthdayWishesTemplate'];
        
        for(Contact con: conList){
            if(con.Email!=Null){
                Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
                msg.setTemplateId(temp.Id);
                msg.setTargetObjectId(con.Id);
                SendList.add(msg);
            }
        }
    }
    
    global void finish(Database.BatchableContext ctx){
        //Executes in the Last, After Execution of the Batch
        
        Messaging.sendEmail(SendList);
        system.debug('Batch Executed !!!');        
    }
}