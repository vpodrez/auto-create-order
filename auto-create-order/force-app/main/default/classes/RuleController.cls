public with sharing class RuleController {

public class FieldApi {
@AuraEnabled
public String field;

@AuraEnabled
public String type;
}

@AuraEnabled
public static List<FieldApi> getFields(String objName){
	Map<String, Schema.SObjectField> objFields = Schema.getGlobalDescribe().get(objName).getDescribe().fields.getMap();
	List<FieldApi> fields = new List<FieldApi>();
	for (String idKey : objFields.keyset()) {
		SObjectType r = ((SObject)(Type.forName('Schema.' + objName).newInstance())).getSObjectType();
		DescribeSObjectResult d = r.getDescribe();
		FieldApi fieldApi = new FieldApi();
		fieldApi.field = objFields.get(idKey) + '';
		fieldApi.type = d.fields.getMap().get(objFields.get(idKey) + '').getDescribe().getType() + '';
		fields.add(fieldApi);
	}

	return fields;
}

@AuraEnabled
public static List<Product2> getProducts(String inputTxt){

	String input =  '%' + inputTxt + '%';
	List<Product2> products = [Select Id, Name From Product2 Where Name Like :input];

	return products;
}

// add callback for recording record
@AuraEnabled
public static Id saveRule(String objectApiName, String fieldApiName, String productId, String fieldValue, String fieldType, String operator){
	Rule__c rule = new Rule__c();
	rule.Object_Api_Name__c = objectApiName;
	rule.Field_Api_Name__c = fieldApiName;
	rule.Product__c = productId;
	rule.Field_Value__c = fieldValue;
	rule.Field_Api_Type__c = fieldType;
	rule.Operator__c = operator;

	insert rule;
	return rule.Id;
}
}