public class demopagevfcontroller {
    private final account account;
    public demopagevfcontroller(){
        account = [select ID, Name from Account 
                       where Id = :ApexPages.currentPage().getParameters().get('id')];
    }
    public Account getAccount(){
        return account; 
    }
    public PageReference save(){
        update account;
        return null;
    }
}