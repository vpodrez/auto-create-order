public with sharing class CompareCondition {

public static Boolean compare(String operator, String fieldObject, String fieldValue, String fieldType) {
	System.debug('operator ' +  operator + ' fieldObject ' +  fieldObject + ' fieldValue ' +  fieldValue + ' fieldType ' +  fieldType);
	Boolean check = false;
	if (fieldType == 'STRING') {
		if (operator.equals('equal') && fieldObject.equals(fieldValue)) {
			check = true;
		} else if (operator.equals('notEqual') && fieldObject != fieldValue) {
			check = true;
		}
	}else {
		if (fieldType == 'INTEGER' || fieldType == 'CURRENCY'|| fieldType == 'DOUBLE' || fieldType == 'PERCENT') {
			// Number
			if (operator.equals('equal') && Double.valueof(fieldObject) == Double.valueof(fieldValue)) {
				check = true;
			} else if (operator.equals('notEqual') && Double.valueof(fieldObject) != Double.valueof(fieldValue)) {
				check = true;
			} else if (operator.equals('lessthan') && Double.valueof(fieldObject) < Double.valueof(fieldValue)) {
				check = true;
			} else if (operator.equals('greaterThan') && Double.valueof(fieldObject) > Double.valueof(fieldValue)) {
				check = true;
			} else if (operator.equals('lessThanOrEqual') && Double.valueof(fieldObject) <= Double.valueof(fieldValue)) {
				check = true;
			} else if (operator.equals('greaterThanOrEqual') && Double.valueof(fieldObject) >= Double.valueof(fieldValue)) {
				check = true;
			}
		} else if (fieldType == 'DATE' || fieldType == 'DATETIME') {
			// Date
			if (operator.equals('equal') && string.valueOf(fieldObject).equals(fieldValue)) {
				check = true;
			} else if (operator.equals('notEqual') && string.valueOf(fieldObject) != fieldValue) {
				check = true;
			} else if (operator.equals('lessthan') && string.valueOf(fieldObject) < fieldValue) {
				check = true;
			} else if (operator.equals('greaterThan') && string.valueOf(fieldObject) > fieldValue) {
				check = true;
			} else if (operator.equals('lessThanOrEqual') && string.valueOf(fieldObject) <= fieldValue) {
				check = true;
			} else if (operator.equals('greaterThanOrEqual') && string.valueOf(fieldObject) >= fieldValue) {
				check = true;
			}
		}
	}

	return check;
}
}
