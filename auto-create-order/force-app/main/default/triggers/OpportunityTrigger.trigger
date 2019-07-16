trigger OpportunityTrigger on Opportunity (before insert) {
    if (Trigger.isInsert || Trigger.isUpdate) {
        List<Opportunity> opportunities = Trigger.new;
        List<Rule__c> rules = [Select Object_Api_Name__c, Field_Api_Name__c, Product__c, Field_Value__c, Operator__c From Rule__c Where Object_Api_Name__c = 'Opportunity'];
        List<Order__c> orders = new List<Order__c>();

        for(Opportunity opp : opportunities) {
            for (Rule__c rule : rules) {
                if (opp.get(rule.Field_Api_Name__c).equals(rule.Field_Value__c) && rule.Operator__c.equals('equal')) {
                    Order__c order = new Order__c();
                    order.Name = 'Order for ' + opp.Name;
                    order.Product__c = rule.Product__c;
                    orders.add(order);
                } else  if (opp.get(rule.Field_Api_Name__c) != rule.Field_Value__c && rule.Operator__c.equals('notEqual')) {
                    Order__c order = new Order__c();
                    order.Name = 'Order for ' + opp.Name;
                    order.Product__c = rule.Product__c;
                    orders.add(order);
                } else  if (Integer.valueof(opp.get(rule.Field_Api_Name__c)) < Integer.valueof(rule.Field_Value__c) && rule.Operator__c.equals('lessthan')) {
                    Order__c order = new Order__c();
                    order.Name = 'Order for ' + opp.Name;
                    order.Product__c = rule.Product__c;
                    orders.add(order);
                } else  if (Integer.valueof(opp.get(rule.Field_Api_Name__c)) > Integer.valueof(rule.Field_Value__c) && rule.Operator__c.equals('greaterThan')) {
                    Order__c order = new Order__c();
                    order.Name = 'Order for ' + opp.Name;
                    order.Product__c = rule.Product__c;
                    orders.add(order);
                } else  if (Integer.valueof(opp.get(rule.Field_Api_Name__c)) <= Integer.valueof(rule.Field_Value__c) && rule.Operator__c.equals('lessThanOrEqual')) {
                    Order__c order = new Order__c();
                    order.Name = 'Order for ' + opp.Name;
                    order.Product__c = rule.Product__c;
                    orders.add(order);
                } else  if (Integer.valueof(opp.get(rule.Field_Api_Name__c)) >= Integer.valueof(rule.Field_Value__c) && rule.Operator__c.equals('greaterThanOrEqual')) {
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