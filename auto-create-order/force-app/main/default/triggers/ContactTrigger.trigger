trigger ContactTrigger on Contact (before insert, before update) {

    if (Trigger.isUpdate) {
         List<Contact> contacts = Trigger.new;
                                                                                    // add any fields!!!
        Map<String, Rule__c> rules = new Map<String, Rule__c>([Select Field_Api_Name__c From Rule__c Where Object_Api_Name__c = 'Contact']);
		// all rule for Contact <Field Api Name, Rule>
        for(Contact cont : contacts) {
            if (cont.LastName == 'Test' && rules.containsKey(cont.LastName)) {
                // Update Order
                // Order__c order = new Order__c();
            }
        }

        //update order;
    }

    if (Trigger.isInsert) {
        List<Contact> contacts = Trigger.new;
                                                                                    // add any fields!!!
        Map<String, Rule__c> rules = new Map<String, Rule__c>([Select Field_Api_Name__c From Rule__c Where Object_Api_Name__c = 'Contact']);
		// all rule for Contact <Field Api Name, Rule>
        for(Contact cont : contacts) {
            if (cont.LastName == 'Test' && rules.containsKey(cont.LastName)) {
                // Insert Order
                // Order__c order = new Order__c();
            }
        }

        //insert order;
    }
}