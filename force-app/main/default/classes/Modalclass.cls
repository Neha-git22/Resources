public class Modalclass {
    @AuraEnabled
    public static List<EntityDefinition> getObjs(String type){
        List<EntityDefinition> Cnames=[SELECT QualifiedApiName FROM EntityDefinition WHERE  QualifiedApiName LIKE '%__c' AND IsCustomSetting = false AND IsSearchLayoutable = true];
        List<EntityDefinition> Snames=[SELECT QualifiedApiName FROM EntityDefinition WHERE(NOT QualifiedApiName LIKE '%__c') AND IsCustomSetting = false AND IsSearchLayoutable = true LIMIT 20];
        
        if(type=='Custom'){
            return Cnames;
        }
        
        if(type=='Standard'){
            return Snames;
        }
        return null; 
    }
    
    @AuraEnabled
    public static List<FieldDefinition> getFields(String Obj){
        List<FieldDefinition> flds=[SELECT  QualifiedApiName FROM FieldDefinition WHERE EntityDefinition.QualifiedApiName = :Obj];
        return flds;
    }
    
}