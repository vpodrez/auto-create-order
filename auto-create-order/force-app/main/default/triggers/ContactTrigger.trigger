trigger ContactTrigger on Contact (before insert) {

    if (Trigger.isInsert) {
        List<Contact> contacts = Trigger.new;
        List<Rule__c> rules = new List<Rule__c>();
        for(Contact cont : contacts) {
            Rule__c rule = new Rule__c();
            rule.Name = 'New Rule Name';
            rule.Object_Api_Name__c = 'Contact';
            rule.Field_Api_Name__c = cont.Name;
            rule.Field_Value__c = '123213';
            rule.Operator__c = 'asdasdsa';
            rules.add(rule);
        }
        
        insert rules;
    }
}