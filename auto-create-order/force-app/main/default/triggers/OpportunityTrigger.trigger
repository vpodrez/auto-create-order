trigger OpportunityTrigger on Opportunity (before insert, before update) {
	if (Trigger.isInsert || Trigger.isUpdate) {
		List<Opportunity> opportunities = Trigger.new;
		List<Rule__c> rules = [Select Object_Api_Name__c, Field_Api_Name__c, Product__c, Field_Value__c, Field_Api_Type__c, Operator__c From Rule__c Where Object_Api_Name__c = 'Opportunity'];
		List<Order__c> orders = new List<Order__c>();

		for(Opportunity opp : opportunities) {
			for (Rule__c rule : rules) {
				if (opp.get(rule.Field_Api_Name__c) != null && CompareCondition.compare( String.valueOf(rule.Operator__c), String.valueOf(opp.get(rule.Field_Api_Name__c)), String.valueOf(rule.Field_Value__c), String.valueOf(rule.Field_Api_Type__c))) {
					Order__c order = new Order__c();
					order.Name = 'Order for ' + opp.Name;
					order.Product__c = rule.Product__c;
					orders.add(order);
				}
			}
		}

		insert orders;
	}
}