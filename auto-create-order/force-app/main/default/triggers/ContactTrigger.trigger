trigger ContactTrigger on Contact (before insert, before update) {

    if (Trigger.isUpdate) {
        List<Contact> contacts = Trigger.new;
        List<Rule__c> rules = new List<Rule__c>();
        for(Contact cont : contacts) {
            if (cont.LastName == 'Test') {
                Rule__c rule = new Rule__c();
                rule.Object_Api_Name__c = 'Contact';
                rule.Field_Api_Name__c = cont.LastName;
                rule.Field_Value__c = 'Test';
                rule.Operator__c = 'equal';
                rules.add(rule);
            }
        }

        update rules;
    }

    if (Trigger.isInsert) {
        List<Contact> contacts = Trigger.new;
        List<Rule__c> rules = new List<Rule__c>();
        for(Contact cont : contacts) {
            if (cont.LastName == 'Test') {
                Rule__c rule = new Rule__c();
                rule.Object_Api_Name__c = 'Contact';
                rule.Field_Api_Name__c = cont.LastName;
                rule.Field_Value__c = 'Test';
                rule.Operator__c = 'equal';
                rules.add(rule);
            }
        }

        insert rules;
    }
}