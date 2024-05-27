@isTest
public class Test_RelConError{
    static testmethod void conTest(){
        Account acc = new Account();
        acc.Name='Ice';
        insert acc;
        List<Contact> conL = new List<Contact>();
        for(Integer i=0;i<=2;i++){
            Contact con1 = new Contact(LastName='newCon'+i, AccountId = acc.Id);
            conL.add(con1);
        }
        insert conL;
        Contact con2 = new Contact(LastName='newCon3', AccountId = acc.Id);
        
        test.startTest();
        try{
            insert con2;
        }
        catch (Exception e) {
            String errorMsg = e.getMessage();
            System.assertEquals('Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, 2 Contacts already exist: []', errorMsg);
        }
        test.stopTest();
    }
}