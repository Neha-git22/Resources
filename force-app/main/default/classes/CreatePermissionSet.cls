public class CreatePermissionSet{
    public static void CreateSet(){
        PermissionSet P= new PermissionSet();
        P.Name='PS_Apex';
        P.Label='PSApex';
        insert P;
        
        PermissionSetAssignment PA= new PermissionSetAssignment();
        PA.PermissionSetId=P.Id;
        Id userId=[SELECT Id FROM User][0].Id;
        PA.AssigneeId=userId;
        insert PA;
    }

}