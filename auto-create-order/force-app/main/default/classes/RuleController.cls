public with sharing class RuleController {
    @AuraEnabled
    public static List<String> getChooseRules(){
        List<Rule__c> rules = [Select Name From Rule__c Where Object_Api_Name__c = 'Account'];
        List<String> items = new List<String>();
        for(Rule__c rule : rules) {
            items.add(rule.Name);
        }
        return items;
    }
}
