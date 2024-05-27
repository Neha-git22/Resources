public class VfbtnMailcontroller{
    public Account account { get; private set; }
    public List<Account> accL { get; private set; }
    public List<Contact> Contacts { get; private set; }
    public List<Opportunity> Opportunities { get; private set; }

    public void VfbtnMailcontroller(ApexPages.StandardController stdController) {
        
        this.account = (Account)stdController.getRecord();
        fetchRelatedData();
    }
    
    private void fetchRelatedData(){
        accL=[SELECT Id,Name,Phone FROM Account WHERE Id=:account.Id];
        
    }
    public void sendPDFToOwner() {
        
        fetchRelatedData();
        PageReference pdfPage = Page.btnMail;
        pdfPage.getParameters().put('id', account.Id);
        Blob pdfBlob;
        try {
            pdfBlob = pdfPage.getContentAsPDF();
        } catch (VisualforceException e) {
            pdfBlob = Blob.valueOf('Error generating PDF: ' + e.getMessage());
        }

        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject('Account Details PDF');
        //email.setToAddresses(new String[]{account.Owner.Email}); 
        email.setToAddresses(new String[]{'lucky@astreait.com'});
        email.setPlainTextBody('Attached is the PDF with account details.');

        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setFileName('AccountDetails.pdf');
        attachment.setBody(pdfBlob);

        email.setFileAttachments(new Messaging.EmailFileAttachment[]{attachment});
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
        
        //return pdfPage;
    }

}