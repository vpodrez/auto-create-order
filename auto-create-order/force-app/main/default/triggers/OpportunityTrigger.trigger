trigger OpportunityTrigger on Opportunity (before insert) {

    if (Trigger.isInsert) {
		List<Opportunity> opportunities = Trigger.new;
        List<Rule__c> rules = new List<Rule__c>();
        for(Opportunity opp : opportunities) {
            /*Rule__c rule = new Rule__c();
            rule.Object_Api_Name__c = 'Opportunity';
            rule.Field_Api_Name__c = opp.LastName;
            rule.Field_Value__c = 'Test';
            rule.Operator__c = 'equal';
            rules.add(rule);*/
        }

        insert rules;
    }
}