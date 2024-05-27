public class ContactRTypes {
    public static void Rtypes(){
        Id internId=[SELECT Id,Name FROM RecordType WHERE Name='Intern'].Id;
        Id AId=[SELECT Id,Name FROM RecordType WHERE Name='Analyst'].Id;
        Id DId=[SELECT Id,Name FROM RecordType WHERE Name='Developer'].Id;
        List<Contact> conL=[SELECT Id,RecordTypeId,Rating__c FROM Contact WHERE RecordTypeId=:internId];
        List<Contact> conUpd;
        if(!conL.isEmpty()){
            for(Contact C:conL){
                if(C.Rating__c=='4' ||C.Rating__c=='5'){
                    C.RecordTypeId=DId;
                    conUpd.add(C);
                }
                if(C.Rating__c<'4'){
                    C.RecordTypeId=AId;
                    conUpd.add(C);
                }
            }
        }
        if(!conUpd.isEmpty()){
        update conUpd;
        }
    }

}