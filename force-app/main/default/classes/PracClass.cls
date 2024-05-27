public class PracClass{
    public static void InitializeApexDataTypes(){
        Integer i=9;
        List<Integer> intList=new List<Integer>();
        intList.add(1);
        intList.add(2);
        intList.add(3);
        Decimal d=0.5;
        Double Db=200.897654;
        Long L=2023L;
        Date Da = Date.newInstance(2023, 12, 17);
        PrintValue(i,intList,d,Db,L,Da);
             
        
    }
    
    public static void PrintValue(Integer i, List<Integer> Li, Decimal d, Double Db,Long L, Date Da){
        System.Debug(i+' '+d+' '+Db+' '+L+' '+Da);
        System.Debug(Li);
        
    }
    
    //SET-2 QUES-1
    public static void getacc(){
        Date d=Date.newInstance(2020, 11, 1);
        List<AccountHistory> accL=[SELECT CreatedDate,Account.Name FROM AccountHistory WHERE Account.Name='neha' AND CreatedDate >=:d];
        System.debug(accL);
    }

}