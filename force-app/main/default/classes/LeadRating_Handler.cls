public class LeadRating_Handler {
    public static void SetLead(List<Lead> leadL){
        for(Lead L:leadL){
            if(L.Website=='LeadSource'){
                L.Rating='Cold';
            }
            else{
                L.Rating='Hot';
            }
        }
    }

}