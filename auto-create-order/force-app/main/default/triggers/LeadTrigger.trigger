trigger LeadTrigger on Lead (before insert, before update) {
	if (Trigger.isInsert || Trigger.isUpdate) {
		List<Lead> leads = Trigger.new;
		List<Rule__c> rules = [Select Object_Api_Name__c, Field_Api_Name__c, Product__c, Field_Value__c, Field_Api_Type__c, Operator__c From Rule__c Where Object_Api_Name__c = 'Lead'];
		List<Order__c> orders = new List<Order__c>();

		for(Lead lead : leads) {
			for (Rule__c rule : rules) {
				if (lead.get(rule.Field_Api_Name__c) != null && CompareCondition.compare(rule.Operator__c, String.valueOf(lead.get(rule.Field_Api_Name__c)), rule.Field_Value__c, rule.Field_Api_Type__c)) {
					Order__c order = new Order__c();
					order.Name = 'Order for ' + lead.LastName;
					order.Product__c = rule.Product__c;
					orders.add(order);
				}
			}
		}

		insert orders;
	}
}