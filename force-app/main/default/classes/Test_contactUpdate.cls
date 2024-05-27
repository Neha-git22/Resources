@isTest
public class Test_contactUpdate {
        @isTest 
        public static void TestContact(){
        List<Contact> conL = new list<Contact>();
        for(Integer i=0;i<5;i++){
            Contact con = new Contact();
            con.LastName='Neha'+i;
            con.phone = '99';
            conL.add(con);
        }
        insert conL;
        

        Test.startTest();
        Batch_contactUpdate B=new Batch_contactUpdate();
        Database.executeBatch(B);
        Test.stopTest();
    }
    
    
}