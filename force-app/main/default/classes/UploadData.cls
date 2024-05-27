public class UploadData{
    
    
    public List<SelectOption> getdynamiclist() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Account','Account'));
        options.add(new SelectOption('Contact','Contact'));
        options.add(new SelectOption('Opportunity','Opportunity'));
        return options;
    }

}