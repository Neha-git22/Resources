public class CallMethods {
    public static void method1(List<Account> accL){
        Integer i=accL.size();
        System.debug(i);
    }
    
    public static void method2(){
        List<Account> accs=[SELECT Id,Name FROM Account WHERE Name LIKE '% %'];
        method1(accs);
    }

}

//SELECT Id,StageName FROM Opportunity WHERE StageName='Closed Won'
//SELECT Id,Account.Name,Name FROM Opportunity WHERE Account.Name='ne1'
//SELECT Id,LastName FROM Contact ORDER BY LastName DESC LIMIT 100
//SELECT Id,AccountId,LastName FROM Contact WHERE AccountId=''
//SELECT Id,Name FROM Account WHERE Id NOT IN (SELECT AccountId FROM Contact)