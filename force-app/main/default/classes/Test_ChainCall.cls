@isTest
public class Test_ChainCall {
    @isTest
    public static void QueueTest(){
        List<Contact> conL=new List<Contact>();
        for(Integer i=0;i<10;i++){
            Contact C=new Contact();
            C.Lastname='Lannister';
            conL.add(C);
        }
        insert conL;
        
        List<Account> accL=new List<Account>();
        for(Integer i=0;i<10;i++){
            Account A=new Account();
            A.Name='Snape';
            accL.add(A);
        }
        insert accL;
        /*Test.startTest();
        ID jobID1 = System.enqueueJob(new Queueable_ChainCall());
        
        Test.stopTest();*/
    }
    @isTest
    public static void Testing(){
       Test.startTest();
        Queueable_ChainCall Q1 = new Queueable_ChainCall();
        Q1.execute(null);
       //ID jobID = System.enqueueJob(new Queueable_ChainCall());
       Queueable_childJob Q2 = new Queueable_childJob();
       Q2.execute(null);
       Test.stopTest();
    }
}