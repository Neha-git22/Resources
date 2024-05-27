public class UserGroup{
    public static void create(){
        Group Gr = new Group();
        Gr.Name='Apex Group22';
        insert Gr;
        
        User Uid=[SELECT Id FROM User where username='neha1@astreait.com' LIMIT 1];
        GroupMember GM = new GroupMember();
        GM.GroupId=Gr.Id;
        GM.UserorGroupId=Uid.Id;
        insert GM;
        
    }
    

}