public with sharing class RuleController {

    @AuraEnabled
    public static List<String> getFields(String objName){
        Map<String, Schema.SObjectField> objFields = Schema.getGlobalDescribe().get(objName).getDescribe().fields.getMap();
        List<String> fields = new List<String>();
        for (String idKey : objFields.keyset()) {
            fields.add(objFields.get(idKey) + '');
        }

        return fields;
    }

    // add callback for recording record
    @AuraEnabled
    public static void saveRule(String objectApiName, String fieldApiName, String fieldValue, String operator){
        Rule__c rule = new Rule__c();
        rule.Object_Api_Name__c = objectApiName;
        rule.Field_Api_Name__c = fieldApiName;
        rule.Field_Value__c = fieldValue;
        rule.Operator__c = operator;

        insert rule;
    }
}