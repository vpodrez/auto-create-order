trigger AccountTrigger on Account (before insert, before update) {
    if (Trigger.isUpdate) {
        // create Rule	
    }

    if (Trigger.isInsert) {
        List<Account> accounts = Trigger.new;
        List<Rule__c> rules = new List<Rule__c>();
        for(Account acc : accounts) {
            Rule__c rule = new Rule__c();
            rule.Name = 'New Rule Name';
            rule.Object_Api_Name__c = 'Account';
            rule.Field_Api_Name__c = acc.Name;
            rule.Field_Value__c = '123213';
            rule.Operator__c = 'asdasdsa';
            rules.add(rule);
        }
        
        insert rules;
    }
}