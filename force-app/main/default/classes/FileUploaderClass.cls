public with sharing class FileUploaderClass {
    /*
* @method uploadFile() 
* @desc Creates a content version from a given file's base64 and name
* 
* @param {String} base64 - base64 string that represents the file
* @param {String} filename - full file name with extension, i.e. 'products.csv'
* @param {String} recordId - Id of the record you want to attach this file to
* 
* @return {ContentVersion} - returns the created ContentDocumentLink Id if the
*   upload was successful, otherwise returns null
*/
    @AuraEnabled
    public static String uploadFile(String base64, String filename, String recordId,String url) {
        ContentVersion cv = createContentVersion(base64, filename);
        ContentDocumentLink cdl = createContentLink(cv.Id, recordId);
        if (cv == null || cdl == null) { return null; }
        
        return cdl.Id;
        
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
    private static ContentVersion createContentVersion(String base64, String filename) {
        ContentVersion cv = new ContentVersion();
        cv.VersionData = EncodingUtil.base64Decode(base64);
        cv.Title = filename;
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
    private static ContentDocumentLink createContentLink(String contentVersionId, String recordId) {
        if (contentVersionId == null || recordId == null) { return null; }
        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId = [
            SELECT ContentDocumentId 
            FROM ContentVersion 
            WHERE Id =: contentVersionId
        ].ContentDocumentId;
        cdl.LinkedEntityId = recordId;
        // ShareType is either 'V', 'C', or 'I'
        // V = Viewer, C = Collaborator, I = Inferred
        cdl.ShareType = 'V';
        
        try {
            insert cdl;
            return cdl;
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
    
   /* @AuraEnabled
    public static List<List<String>> LoadFiles(String recId){
        
        Map<Id, Account_Attachment__c> dataMap = new Map<Id, Account_Attachment__c>([SELECT Id, Type__c, Type_Of_Document__c, URL__c, Account__c FROM Account_Attachment__c WHERE Account__c = :recId]);
        List<ContentDocumentLink> titleDoc = [SELECT ContentDocumentId, LinkedEntityId, contentDocument.title FROM ContentDocumentLink WHERE LinkedEntityId = :dataMap.keySet()];
        Map<Id, List<String>> titleMap = new Map<Id, List<String>>();
        
        
        for (Account_Attachment__c accAtt : dataMap.values()) {
            
            if (!titleMap.containsKey(accAtt.Id)) {
                List<String> strList = new List<String>();
                strList.add(accAtt.Type__c);
                strList.add(accAtt.Type_Of_Document__c);
                strList.add(accAtt.URL__c);
                
                titleMap.put(accAtt.Id, strList);
                
                
            }
        }
        
        System.debug(titleMap.values());
        
        for(ContentDocumentLink cdl : titleDoc){
            if(titleMap.containsKey(cdl.LinkedEntityId)){
                titleMap.get(cdl.LinkedEntityId).add(cdl.contentDocument.title);
                //titleMap.put(cdl.LinkedEntityId,titleMap.get(cdl.LinkedEntityId).add(cdl.contentDocument.title));
            }
        }
        
        System.debug(titleMap);
        return titleMap.values();
    
}*/
}