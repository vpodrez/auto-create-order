public with sharing class RuleController {
    @AuraEnabled
    public static List<String> getChooseRules(String obj){
        List<Rule__c> rules = [Select Object_Api_Name__c, Field_Api_Name__c, Field_Value__c, Operator__c From Rule__c Where Object_Api_Name__c =: obj];
        List<String> items = new List<String>();
        for(Rule__c rule : rules) {
            items.add(rule.Field_Api_Name__c);
        }

        return items;
    }
}