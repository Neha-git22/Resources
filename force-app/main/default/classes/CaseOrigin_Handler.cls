public class CaseOrigin_Handler {
    public static void SetCase(List<Case> caseL){
        for(Case C:caseL){
            if(C.Origin=='Email'){
                C.Priority='Medium';
                C.Status='New';
           }
        }
        
    }

}