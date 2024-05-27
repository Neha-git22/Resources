public class Queueable_childJob implements Queueable{
    public void execute(QueueableContext context) {
        List<Contact> conL = new List<Contact>();
        conL=[SELECT Id,LastName FROM Contact];
        for(Contact con: conL){
            con.LastName+='UPD-con';
        }
        update conL;
    }

}