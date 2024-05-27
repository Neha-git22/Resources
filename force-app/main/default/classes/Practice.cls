public class Practice { 
    public static void Reverse(){
     List<Integer> lst= new List<Integer>();
     lst.add(5);
     lst.add(7);
     lst.add(4);
     lst.add(2);
     lst.add(9);
        Integer f=lst[0];
        Integer l=lst[4];
        for(Integer i=0;i<2;i++){
            lst[i]=l;
            l=lst[4-i-1];
            lst[4-i]=f;
            f=lst[i+1];
        }
        
        System.debug(lst);
    }
    
    public static void ReIndexing(){
     List<Integer> lst= new List<Integer>();
     lst.add(5);
     lst.add(7);
     lst.add(4);
     lst.add(2);
     lst.add(9);
     List<Integer> lst1= new List<Integer>();
        for(Integer i=0;i<=4;i++){
            Integer x = i/2;
            Integer y = x*2;
            if(i == y){
                lst1.add(lst[i]);
            }
        }
        for(Integer i=0;i<=4;i++){
            Integer x = i/2;
              Integer y = x*2;
            if(i != y ){
                lst1.add(lst[i]);
            }
        }
          
        System.debug(lst1);      
    }
    
    public static void Records1(){
       Account acc=new Account();
       acc.Name='Neha';
       insert acc;
       List<Contact> conL = new List<Contact>();
       for(integer i=1;i<=10;i++){
            Contact con = new Contact();
            con.LastName = 'ABC' +i;
            con.AccountId=acc.Id;
            conL.add(con);
        }
        insert conL;
        }
    public static void Records2(){
        List<Account> accL = new List<Account>();
        for(Integer i=0;i<=5;i++){
            Account acc = new Account();
            acc.Name='Neha'+i;
            accL.add(acc);
        }
        insert accL;
        
        List<Contact> conL = new List<Contact>();
        for(Account A: accL){
            for(Integer i=0;i<=5;i++){
                Contact con=new Contact();
                con.LastName='Amudapuram';
                con.AccountId=A.Id;
                conL.add(con);
            }
        }
        insert conL;
    }    
    
    
}