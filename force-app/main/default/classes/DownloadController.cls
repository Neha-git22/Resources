public class DownloadController{
    public String currentRecordId {get;set;}
    public List<Contact> conL {get;set;}
    
    public DownloadController(ApexPages.StandardController controller){
        currentRecordId=ApexPages.CurrentPage().getparameters().get('id');
        conL=[SELECT Id,LastName,Phone,Email FROM Contact WHERE AccountId=:currentRecordId];
        
    }
    public PageReference Redirect(){
        PageReference p = Page.Genratecsv;
       p.setRedirect(true);
       return p;
    }

}