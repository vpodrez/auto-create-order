public with sharing class RuleController {

    @AuraEnabled
    public static String getContactLastName(String idObj){
        List<Contact> contacts = [Select LastName From Contact Where Id =: idObj Limit 1];
        String lastName = contacts.get(0).LastName;

        return lastName;
    }

        @AuraEnabled
    public static String getLeadLastName(String idObj){
        List<Lead> leads = [Select LastName From Lead Where Id =: idObj Limit 1];
        String lastName = leads.get(0).LastName;

        return lastName;
    }

    @AuraEnabled
    public static String getAccountName(String idObj){
        List<Account> accounts = [Select Name From Account Where Id =: idObj Limit 1];
        String name = accounts.get(0).Name;

        return name;
    }

        @AuraEnabled
    public static String getOpportunityName(String idObj){
        List<Opportunity> opportunities = [Select Name From Opportunity Where Id =: idObj Limit 1];
        String name = opportunities.get(0).Name;

        return name;
    }

    // add callback for recording record
}