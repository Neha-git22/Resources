public with sharing class AccAttachment {
    
    @AuraEnabled
    public static String AccAt(String rTy,String pTy,String Des,String link,String id,String cd){
        Account_Attachment__c a=new Account_Attachment__c();
        a.Name='Auto';
        a.Type__c=rTy;
        a.Document_Type__c=pTy;
        a.Description__c=Des;
        a.URL__c=link;
        a.Account__c=id;
        insert a;
        a.DocId__c=cd;
        update a;
        return a.Id;
        
    }
    
    @AuraEnabled
    public static String uploadFile(String base64, String filename, String recordId,String url,String AtId) {
        System.Debug(AtId);
        ContentVersion cv = createContentVersion(base64, filename,AtId);
        Id cdId = createContentLink(cv.Id, recordId);
        if (cv == null || cdId == null) { return null; }
        
        return cdId;
        
    }
    /*
* @method createContentVersion() [private]
* @desc Creates a content version from a given file's base64 and name
* 
* @param {String} base64 - base64 string that represents the file
* @param {String} filename - full file name with extension, i.e. 'products.csv'
* 
* @return {ContentVersion} - returns the newly created ContentVersion, or null
*   if there was an error inserting the record
*/
    private static ContentVersion createContentVersion(String base64, String filename,String atID) {
        ContentVersion cv = new ContentVersion();
        cv.VersionData = EncodingUtil.base64Decode(base64);
        cv.Title = filename+atID;
        System.debug(cv.Title);
        cv.PathOnClient = filename;
        try {
            insert cv;
            return cv;
        } catch(DMLException e) {
            System.debug(e);
            return null;
        }
    }
    
    /*
* @method createContentLink() [private]
* @desc Creates a content link for a given ContentVersion and record
* 
* @param {String} contentVersionId - Id of the ContentVersion of the file
* @param {String} recordId - Id of the record you want to attach this file to
* 
* @return {ContentDocumentLink} - returns the newly created ContentDocumentLink, 
*   or null if there was an error inserting the record
*/
    private static String createContentLink(String contentVersionId, String recordId) {
        if (contentVersionId == null || recordId == null) { return null; }
        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId = [
            SELECT ContentDocumentId 
            FROM ContentVersion 
            WHERE Id =: contentVersionId
        ].ContentDocumentId;
        Id CDid=cdl.ContentDocumentId;
        System.debug(CDid);
        cdl.LinkedEntityId = recordId;
        // ShareType is either 'V', 'C', or 'I'
        // V = Viewer, C = Collaborator, I = Inferred
        cdl.ShareType = 'V';
        
        try {
            insert cdl;
            return CDid;
        } catch(DMLException e) {
            System.debug(e);
            return null;
        }
    }
    
    @AuraEnabled
    public static String Notecreate(String url,String recId){
        Note n=new Note();
        n.Title=url;
        n.Body='url';
        n.ParentId=recId;
        insert n;
        return n.Id;
    }
    
    /*@AuraEnabled
    public static void uploadFile(String filename, String rTy, String pTy,String link, String Des, String id){
        Account_Attachment__c a=new Account_Attachment__c();
        a.Name='Auto';
        a.Type__c=rTy;
        a.Document_Type__c=pTy;
        a.Description__c=Des;
        if(link !=null){
            a.URL__c=link; }
        a.Account__c=id;
        insert a;
        
        //Set<Id> AttIds=new Set<Id>();
        //List<Account_Attachment__c> attList=[SELECT Id FROM Account_Attachment__c WHERE Account__c=:Id];
        //for(Account_Attachment__c a:attList){
          //  AttIds.add(a.Id);
        //}
        if(filename !=null){
        ContentVersion cv = new ContentVersion();
        cv.Title = filename;
        cv.PathOnClient = 'TestDocument.pdf';
        cv.VersionData = Blob.valueOf('Test Content');
        cv.IsMajorVersion = true;
        
        Insert cv;
        
            
        Id conDocId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cv.Id].ContentDocumentId;
            
        ContentDocumentLink cdl = New ContentDocumentLink();
        cdl.LinkedEntityId =id;
        cdl.ContentDocumentId = conDocId;
        cdl.shareType = 'V';
        
        Insert cdl;
         
        }
        //return cdl.id;
    }*/
    
    @AuraEnabled
    public static List<AttWrapper> LoadFiles(String recId){
        List<AttWrapper> attachmentList=new List<AttWrapper>();
        
        Map<Id,String> TmapId=new Map<Id,String>();
        Map<Id,String> imapId=new Map<Id,String>();
        //Map<Id,Map<Id,String>> RecAtts=new Map<Id,Map<Id,String>>(); //Map for att
        List<ContentDocumentLink> RecAttsList=[SELECT Id, LinkedEntityId, ContentDocumentId,ContentDocument.Title FROM ContentDocumentLink WHERE LinkedEntityId=:recId];
        List<Account_Attachment__c> attachments = [SELECT Id, Name, Type__c, Document_Type__c, URL__c, Account__c 
                                                   FROM Account_Attachment__c 
                                                   WHERE Account__c = :recId];
        /*for(Account_Attachment__c At:attachments){
            Map<Id,String> m=new Map<Id,String>();
            RecAtts.put(At.Id,m);
        }*/
        
        for(ContentDocumentLink doc:RecAttsList){
            
            String filename = doc.ContentDocument.Title;
                String regexPattern = '([a-zA-Z0-9]{18})\\b';
                Pattern pattern = Pattern.compile(regexPattern);
            System.debug(pattern);
                Matcher matcher = pattern.matcher(filename);
            System.debug(matcher);
                
            if (matcher.find()){
                String id = matcher.group(1);
                System.debug(id);
                TmapId.put(id,doc.ContentDocument.Title);
                imapId.put(id,doc.ContentDocumentId);
            }
                    
        }
        
        /*for(Account_Attachment__c At:attachments){
            for(ContentDocumentLink doc:RecAttsList){
                String filename = doc.ContentDocument.Title;
                String regexPattern = '([a-zA-Z0-9]{18})\\b';
                Pattern pattern = Pattern.compile(regexPattern);
                Matcher matcher = pattern.matcher(filename);
                
                if (matcher.find()) {
                    String id = matcher.group(1);
                    System.debug('Extracted ID: ' + id);
                    //String Onlytitle;
                    if(At.Id==id){
                    TmapId.put(At.Id,doc.ContentDocument.Title);
                    imapId.put(At.Id,doc.ContentDocumentId);
                    System.debug(TmapId.get(At.Id));
                } 
                } else {
                    System.debug('ID not found.');
                }
                
            }
            
        }*/
        System.debug(TmapId);
      
        for (Account_Attachment__c attachment : attachments){
            AttWrapper at=new AttWrapper();
            at.atId=attachment.Id;
            at.atName=attachment.Name;
            at.atType=attachment.Type__c;
            at.atDoctype=attachment.Document_Type__c;
            at.atURL=attachment.URL__c;
            
            if (TmapId.containsKey(attachment.Id) && attachment.URL__c==null){
                at.atFileTitle=TmapId.get(attachment.Id);
                
            }
            
            if (imapId.containsKey(attachment.Id) && attachment.URL__c==null){
                at.atFileid=imapId.get(attachment.Id);
            }
            attachmentList.add(at);
        }
        
        
        System.debug(attachmentList);
        return attachmentList;
        
    }
    
    @AuraEnabled
    public static boolean Stat(String aid){
        Account acc=[SELECT Id,Name,Status__c FROM Account WHERE Id=:aid ];
        if(acc.Status__c=='Draft'){
            return true;
        }
        return false;
    }
    public class AttWrapper{
        @AuraEnabled public String atId;
        @AuraEnabled public String atName;
        @AuraEnabled public String atType;
        @AuraEnabled public String atDoctype;
        @AuraEnabled public String atURL;
        @AuraEnabled public String atFileTitle;
        @AuraEnabled public String atFileid;
        
        
    }
    
    
}



/*@AuraEnabled
    public static List<ContactWrapper> getAttachmentDetails(Id recordId){
        String objectName = String.valueOf(recordId.getSObjectType());
        String ObjectApiname;
        String ObjectQuery;
        List<ContactWrapper> wrraperInstanceList= new List<ContactWrapper>();
        //Agreement
        if(objectName=='GLSCBIZHB__Agreement__c'){
            Boolean approvalStatus = true;
            Map<id,GLSCBIZHB__Agreement_Document__c> AgreementDocumentMap= new Map<id,GLSCBIZHB__Agreement_Document__c>([Select id,GLSCBIZHB__Document_type__c,Agreement_Document_Name__c,Type__c ,Url__c,GLSCBIZHB__Agreement__r.GLSCBIZHB__Approval_Status__c
                                                                                                   from GLSCBIZHB__Agreement_Document__c where GLSCBIZHB__Agreement__c =: recordId 
                                                                                                   LIMIT 10000]);
            system.debug('AgreementDocumentMap ::'+AgreementDocumentMap);
           
            Map<id,boolean> GetAttachmentMap= new Map<id,boolean>();    
            list<ContentDocumentLink> contentDocumentList= new List<ContentDocumentLink>();
            Map<id,id> AccountAttachmentContentDocMap= new map<id,id>();
            for(ContentDocumentLink contentDoc:[Select id,ContentDocumentId,LinkedEntityId 
                                                from ContentDocumentLink 
                                                where LinkedEntityId =:AgreementDocumentMap.keyset()
                                                Limit 10000 ]){
                                                    if(!AgreementDocumentMap.containskey(contentDoc.LinkedEntityId)){
                                                        GetAttachmentMap.put(contentDoc.LinkedEntityId,false);
                                                    }
                                                    else{
                                                        GetAttachmentMap.put(contentDoc.LinkedEntityId,true);
                                                        AccountAttachmentContentDocMap.put(contentDoc.LinkedEntityId,contentDoc.ContentDocumentId);
                                                    }
                                                    contentDocumentList.add(contentDoc);
                                                }
            for(id key:AgreementDocumentMap.keyset()){
                ContactWrapper wrapperInstance= new ContactWrapper();
                wrapperInstance.AgreementDocumentInstance=AgreementDocumentMap.get(key);
                wrapperInstance.AttachmentDetails=GetAttachmentMap.get(key);
                wrapperInstance.AgreementResult=true;
                wrapperInstance.ContentDocumentIdVariable=AccountAttachmentContentDocMap.get(key);
                wrapperInstance.ApprovalStatus = AgreementDocumentMap.get(key).GLSCBIZHB__Agreement__r.GLSCBIZHB__Approval_Status__c == 'Draft' ? true : false;
                wrraperInstanceList.add(wrapperInstance);
            }
            return wrraperInstanceList;
        }
        return null;
    }*/