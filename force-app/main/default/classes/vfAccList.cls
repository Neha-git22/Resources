public class vfAccList {
    public List<Account> accounts { get; set; }
    public Integer pageSize { get; set; }
    public Integer pageNumber { get; set; }
    public Integer totalPages { get; set; }
    public Boolean hasNext { get; set; }
    public Boolean hasPrevious { get; set; }
    public Id recordId { get; set; }
    
    public vfAccList() {
        pageSize = 10; 
        pageNumber = 1;
        pagination();
    }
    
    private void pagination() {
        Integer offset = (pageNumber - 1) * pageSize;
        accounts = [SELECT Id, Name, Phone FROM Account LIMIT :pageSize OFFSET :offset];
        updateVars();
    }
    
    private void updateVars() {
        Integer totalRecords = [SELECT COUNT() FROM Account];
        totalPages = (totalRecords + pageSize - 1) / pageSize;
        hasNext = pageNumber < totalPages;
        hasPrevious = pageNumber > 1;
    }
    
    public void firstPage() {
        pageNumber = 1;
        pagination();
    }
    
    public void previousPage() {
        pageNumber--;
        pagination();
    }
    
    public void nextPage() {
        pageNumber++;
        pagination();
    }
    
    public void lastPage() {
        pageNumber = totalPages;
        pagination();
    }
    
    public PageReference editRecord() {
        if (recordId != null) {
            PageReference editPage = new PageReference('/' + recordId + '/e');
            editPage.setRedirect(true);
            ApexPages.currentPage().getParameters().put('nooverride', '1'); 
            editPage.getParameters().put('nooverride', '1');
            editPage.getParameters().put('retURL', '/' + recordId);
            editPage.getParameters().put('cancelURL', '/' + recordId);
            editPage.getParameters().put('saveURL', '/' + recordId);
            return editPage;
        }
        return null;
    }
    
    public void deleteRecord() {
        if (recordId != null) {
            try {
                delete new Account(Id = recordId);
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Record deleted successfully.'));
            } catch (Exception e) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error deleting record: ' + e.getMessage()));
            }
            pagination();
        }
    }
}