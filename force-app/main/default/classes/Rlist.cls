public class Rlist{
    public String selectedObject { get; set; }
    public List<SObject> relatedRecords { get; set; }
    public List<SelectOption> getObjectOptions() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Opportunity', 'Opportunity'));
        options.add(new SelectOption('Contact', 'Contact'));
        options.add(new SelectOption('Case', 'Case'));
        return options;
    }

    public void updateRelatedList() {
        if (selectedObject == 'Opportunity') {
            relatedRecords = [SELECT Name,AccountId FROM Opportunity LIMIT 10];
        } else if (selectedObject == 'Contact') {
            relatedRecords = [SELECT Name,AccountId FROM Contact LIMIT 10];
        } else if (selectedObject == 'Case') {
            relatedRecords = [SELECT Subject FROM Case LIMIT 10];
        } else {
            relatedRecords = new List<SObject>();
        }
    }
}