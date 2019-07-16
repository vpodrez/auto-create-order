trigger ContactTrigger on Contact (before insert, before update) {
    if (Trigger.isInsert || Trigger.isUpdate) {
        List<Contact> contacts = Trigger.new;
        List<Rule__c> rules = [Select Object_Api_Name__c, Field_Api_Name__c, Product__c, Field_Value__c, Operator__c From Rule__c Where Object_Api_Name__c = 'Contact'];
        List<Order__c> orders = new List<Order__c>();

        for(Contact cont : contacts) {
            for (Rule__c rule : rules) {
                if (cont.get(rule.Field_Api_Name__c).equals(rule.Field_Value__c) && rule.Operator__c.equals('equal')) {
                    Order__c order = new Order__c();
                    order.Name = 'Order for ' + cont.LastName;
                    order.Product__c = rule.Product__c;
                    orders.add(order);
                } else  if (cont.get(rule.Field_Api_Name__c) != rule.Field_Value__c && rule.Operator__c.equals('notEqual')) {
                    Order__c order = new Order__c();
                    order.Name = 'Order for ' + cont.LastName;
                    order.Product__c = rule.Product__c;
                    orders.add(order);
                } else  if (Integer.valueof(cont.get(rule.Field_Api_Name__c)) < Integer.valueof(rule.Field_Value__c) && rule.Operator__c.equals('lessthan')) {
                    Order__c order = new Order__c();
                    order.Name = 'Order for ' + cont.LastName;
                    order.Product__c = rule.Product__c;
                    orders.add(order);
                } else  if (Integer.valueof(cont.get(rule.Field_Api_Name__c)) > Integer.valueof(rule.Field_Value__c) && rule.Operator__c.equals('greaterThan')) {
                    Order__c order = new Order__c();
                    order.Name = 'Order for ' + cont.LastName;
                    order.Product__c = rule.Product__c;
                    orders.add(order);
                } else  if (Integer.valueof(cont.get(rule.Field_Api_Name__c)) <= Integer.valueof(rule.Field_Value__c) && rule.Operator__c.equals('lessThanOrEqual')) {
                    Order__c order = new Order__c();
                    order.Name = 'Order for ' + cont.LastName;
                    order.Product__c = rule.Product__c;
                    orders.add(order);
                } else  if (Integer.valueof(cont.get(rule.Field_Api_Name__c)) >= Integer.valueof(rule.Field_Value__c) && rule.Operator__c.equals('greaterThanOrEqual')) {
                    Order__c order = new Order__c();
                    order.Name = 'Order for ' + cont.LastName;
                    order.Product__c = rule.Product__c;
                    orders.add(order);
                }
            }
        }

        insert orders;
    }
}