public class ClickUp {
    
     //'90608847_50dd50c36cdb9701191b5cba82afa7b1c87456ecba96be7b32fb660f5ac1bcae';

    public static void Clickget()
    {
        String client_Id = 'M4N2PB0MRFCV0Q71E0GVOPTWCOW1WDIN';
        String client_secret='HNJIDDG0VTQERUZBIBD6BQW86YHLIZNEOQOJZTFEVM2DZ3J9SEATAJCZWYM34QNY';
        

        String code='IXPXDSQ18AG6PPO5WBBVIUSTCHD50J6Q';
        //Blob headerValue = Blob.valueOf(client_Id + ':' + client_secret);
        string body = 'grant_type=authorization_code';
        //String authorizationHeader = 'Basic'+EncodingUtil.base64Encode(headerValue).;
        ///System.debug(authorizationHeader);
        String url='https://api.clickup.com/api/v2/oauth/token?client_id='+client_Id+'&client_secret='+client_secret+'&code='+code;
        String ResBody=Util_ClickUp.POST(body,url);
        

        
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(ResBody);
            System.debug((String) responseMap.get('access_token'));
            String Atoken=(String) responseMap.get('access_token');
        
    }
    
    public static void AuthCode(){
        String client_Id = 'M4N2PB0MRFCV0Q71E0GVOPTWCOW1WDIN';
        String client_secret='HNJIDDG0VTQERUZBIBD6BQW86YHLIZNEOQOJZTFEVM2DZ3J9SEATAJCZWYM34QNY';
        String username='ANeha';
        String password='Clickneha123';
        String red='dneha-c1-dev-ed.develop.lightning.force.com';
        String code='IXPXDSQ18AG6PPO5WBBVIUSTCHD50J6Q';
        Blob headerValue = Blob.valueOf(username + ':' + password);
        string body = 'response_type=code_credentials';
        String authorizationHeader = 'Basic'+EncodingUtil.base64Encode(headerValue);
        System.debug(authorizationHeader);
        String url='https://app.clickup.com/api?client_id='+client_Id+'&redirect_uri='+red;
        String Atoken;
        
        /*Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(url);
        request.setHeader('Authorization', 'Basic');
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setBody(body);
        HttpResponse response = http.send(request);
        System.debug(response.getbody());*/

        /*if (response.getStatusCode() == 200){
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug((String) responseMap.get('access_token'));
            Atoken=(String) responseMap.get('access_token');
        } else {
            //return null;
        }*/

 
    }
    
    public static void Get_Teamid(){
        String url='https://api.clickup.com/api/v2/team';
        String Body=Util_ClickUp.GET(url);
        System.debug(Body);
        
        String Team_id;
        //if (Stat == 200){
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(Body);
            list<Object> l = (list<Object>) responseMap.get('teams');
            map<String,Object> m = (map<String,Object>) l[0];
            Team_id = (String) m.get('id');
            System.debug(Team_id);
            
        //} else {
            //return null;
        //}
        Get_Space(Team_id);
    }
    
    public static void Get_Space(String teamId){
        String url='https://api.clickup.com/api/v2/team/'+teamId+'/space';
        String Body=Util_ClickUp.GET(url);
        String Space_id ;
        
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(Body);
            //System.debug(responseMap);
            list<Object> l = (list<Object>) responseMap.get('spaces');
            map<String,Object> m = (map<String,Object>) l[0];
            Space_id = (String) m.get('id');
            System.debug(Space_id);
            
        Get_Folder(Space_id);
    }
    
    public static void Get_Folder(String SpaceId){
        String url='https://api.clickup.com/api/v2/space/'+SpaceId+'/folder';
        
        String FolderName='IntFirst_Folder';
        String Body=Util_ClickUp.GET(url);
        String Folder_Id ;
        

            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(Body);
            System.debug(responseMap);
            //Folder_Id=(String)responseMap.get('id');
            
            list<Object> l = (list<Object>) responseMap.get('folders');
            map<String,Object> m = (map<String,Object>) l[1];
            Folder_Id = (String) m.get('id');
            System.debug(Folder_Id);
        
        Get_List(Folder_Id);
    }
    
    public static void Get_List(String FolderId){
        String url='https://api.clickup.com/api/v2/folder/'+FolderId+'/list';
        String Body=Util_ClickUp.GET(url);
        String List_Id ;
        
        
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(Body);
            System.debug(responseMap);
            //Folder_Id=(String)responseMap.get('id');
            
            list<Object> l = (list<Object>) responseMap.get('lists');
            map<String,Object> m = (map<String,Object>) l[0];
            List_Id = (String) m.get('id'); //901602348872;
            System.debug(List_Id);
            
        
        Get_task(List_Id);
    }
    
    public static void Get_task(String ListId){
        //bulkify for multiple tasks.
        String url='https://api.clickup.com/api/v2/list/'+ListId+'/task';
        String Body=Util_ClickUp.GET(url);
        String Subject;
        String Status;
        String Priority;
        
        
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(Body);
            System.debug(responseMap);
            //Task_name=(String)responseMap.get('id');
            map<String,Object> m=new Map<String,Object>();
            list<Object> l = (list<Object>) responseMap.get('tasks');
            
                m = (map<String,Object>) l[0];
                
            map<String,Object> m2= new map<String,Object>();//for status
            map<String,Object> m3= new map<String,Object>();//for priority
            map<String,Object> m4=new Map<String,Object>();
            list<Object> l2=(list<Object>) m.get('custom_fields');
            m2=(map<String,Object>) m.get('status');
            m4=(map<String,Object>) l2[0];
            
            m3=(map<String,Object>)m.get('priority');
            Status =  (String)m2.get('status'); 
            Priority = (String)m3.get('priority');
            Subject=(String)m4.get('value');
            System.debug(Status);
            //System.debug(Priority);
            //List<Task> TaskSubs=[SELECT Subject FROM Task WHERE Subject=:Subject];
            boolean bool;
            
            //if(TaskSubs.size()!=0){bool=false;}
            Task T=new Task();
            T.Subject=Subject;
            if(Status=='To Do')
            T.Status='Not Started';
            else
            T.Status=Status;
            T.Priority=Priority;
            insert T;
            
       
    }
    
    //public static void Get_Task(String Atoken,String ListId){
        
   // }

        /*String clientId = '804POKMBQLBPH223YN914ZUUJB8K89MU';
        String clientSecret='M7BQDWPJD2Y4CW6UYRD7TB48ZRX5E7C681DQO0E1OS771AW2O8KU5N3BCALCX3JI';
        String redirectURL='dneha-c1-dev-ed.develop.lightning.force.com';
        String Authurl='https://app.clickup.com/api?client_id='+clientId+'&redirect_uri='+redirectURL;
        String key='';
        String url='https://api.clickup.com/api/v2/team/s/space?archived=false';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(Authurl);
        request.setHeader('Authorization','Bearer');
        //https://api.clickup.com/api/v2/oauth/token?client_id='G2DCKHQVB8GB3A8MJWRVND0HKIAO3J4X'&client_secret='G2DCKHQVB8GB3A8MJWRVND0HKIAO3J4X'&code='dneha-c1-dev-ed.develop.lightning.force.com'
        //request.setBody('');
        HttpResponse response = http.send(request);
        //System.debug(response.getbody());
        Map<String,Object> responsemp = new Map<String,Object>();
        responsemp = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
        Map<String,Object> Mapp=new Map<String,Object>();
        
        
       System.debug(responsemp);
        // Parse the JSON response
        /*if(response.getStatusCode() != 201) {
            System.debug('response.getStatusCode()-------'+ response.getStatusCode());
            System.debug('response.getBody()-------'+ response.getBody());
            System.debug('response.getStatus()-------'+ response.getStatus());
        } else {

            System.debug('ELSE-----------'+response.getBody());
        }
        return response.toString();
    }*/
        
        
}