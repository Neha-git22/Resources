public class SendMailScheduled {
    
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