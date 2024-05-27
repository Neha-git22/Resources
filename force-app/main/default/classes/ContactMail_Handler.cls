public class ContactMail_Handler{
    public static void ContactMail(List<Contact> conL){
        List<String> MailIds=new List<String>();
        for(Contact C:conL){
            if(C.Email!=null)
            {String S=(String)C.get('Email');
             MailIds.add(S);}
        }
        if(MailIds!=null){
            SendMail(MailIds);}
        
    }
    public static void SendMail(List<String> MailIds){
       // List<Message.SingleEmailMessage> Mlist = new List<Message.SingleEmailMessage>();
       List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            for(String S:MailIds){
                Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
                
                List<String> sendTo = new List<String>();
                sendTo.add(S);
                mail.setToAddresses(sendTo);
                mail.setPlainTextBody('Your Contact has been created!');
                mails.add(mail);
            }
        Messaging.sendEmail(mails);
    }

}