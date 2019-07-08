trigger LeadTrigger on Lead (before insert) {

    if (Trigger.isInsert) {
        List<Lead> leads = Trigger.new;
        List<Rule__c> rules = new List<Rule__c>();
        for(Lead lead : leads) {
            Rule__c rule = new Rule__c();
            rule.Name = 'New Rule Name';
            rule.Object_Api_Name__c = 'Lead';
            rule.Field_Api_Name__c = lead.Name;
            rule.Field_Value__c = '123213';
            rule.Operator__c = 'asdasdsa';
            rules.add(rule);
        }
        
        insert rules;
    }
}