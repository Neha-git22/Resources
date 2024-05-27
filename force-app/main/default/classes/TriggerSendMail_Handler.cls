public class TriggerSendMail_Handler {
    public static void SendMail(List<Account> newaccL){
        List<String> StringMails = new List<String>();
        for(Account A: newaccL){
            String S=(String)A.get('Email__c');
            StringMails.add(S);
            
        }
        FutureMail(StringMails);
        
    }
    
    @future
    public static void FutureMail(List<String> EMails){
       // List<Message.SingleEmailMessage> Mlist = new List<Message.SingleEmailMessage>();
       List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            for(String S:EMails){
                Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
                
                List<String> sendTo = new List<String>();
                sendTo.add(S);
                mail.setToAddresses(sendTo);
                mail.setPlainTextBody('Your Account has been created!');
                mails.add(mail);
            }
        Messaging.sendEmail(mails);
    }
    

}