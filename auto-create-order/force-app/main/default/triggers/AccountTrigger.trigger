trigger AccountTrigger on Account (before insert, before update) {
	if (Trigger.isInsert || Trigger.isUpdate) {
		List<Account> accounts = Trigger.new;
		List<Rule__c> rules = [Select Object_Api_Name__c, Field_Api_Name__c, Product__c, Field_Value__c, Field_Api_Type__c, Operator__c From Rule__c Where Object_Api_Name__c = 'Account'];
		List<Order__c> orders = new List<Order__c>();

		for(Account acc : accounts) {
			for (Rule__c rule : rules) {
				if (acc.get(rule.Field_Api_Name__c) != null && CompareCondition.compare(rule.Operator__c, String.valueOf(acc.get(rule.Field_Api_Name__c)), rule.Field_Value__c, rule.Field_Api_Type__c)) {
					Order__c order = new Order__c();
					order.Name = 'Order for ' + acc.Name;
					order.Product__c = rule.Product__c;
					orders.add(order);
				}
			}
		}

		insert orders;
	}
}