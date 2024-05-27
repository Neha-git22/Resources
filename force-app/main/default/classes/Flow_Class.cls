public class Flow_Class {
    @InvocableMethod(label='Send_Mail' description='Send Mail on AccRelCon Creation' Category='Account')
    public static void SendMail(List<Id> AccId){
        
        List<Account> Emails=[SELECT Id,Name,Owner.Email FROM Account WHERE Id IN :AccId];
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            for(Account S:Emails){
                Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
                String[] newStr=new String[]{S.Owner.Email};
                mail.setToAddresses(newStr);
                mail.setPlainTextBody('Your Account has been created!');
                mails.add(mail);
            }
        Messaging.sendEmail(mails);
        
    }

}