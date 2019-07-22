({
  doInit: function(component, event, helper) {
    var objName =
      component.get("v.sObjectName") != "Rule__c"
        ? component.get("v.sObjectName")
        : component.find("object").get("v.value");

    helper.getFieldApiName(component, objName);

    helper.getProducts(component, "");
  },

  save: function(component, event, helper) {
    var objectApiName =
      component.get("v.sObjectName") != "Rule__c"
        ? component.get("v.sObjectName")
        : component.find("object").get("v.value");
    var fieldApiName = component.find("field").get("v.value");
    var productId = component.get("v.selectedProductId");
    var fieldValue =
      component.find("value").get("v.value") != ""
        ? component.find("value").get("v.value")
        : component.find("value").get("v.checked");
    var fieldType = component.get("v.valueType");
    var operator = component.find("operator").get("v.value");

    helper.saveRule(
      component,
      helper,
      objectApiName,
      fieldApiName,
      productId,
      fieldValue,
      fieldType,
      operator
    );
  },

  setFieldApiName: function(component, event, helper) {
    var objName = component.find("object").get("v.value");
    helper.getFieldApiName(component, objName);
  },

  changeType: function(component, event, helper) {
    var operators = [
      { label: "Equal", value: "equal" },
      { label: "Not Equal", value: "notEqual" },
      { label: "Less than", value: "lessthan" },
      { label: "Greater than", value: "greaterThan" },
      { label: "Less Than or Equal", value: "lessThanOrEqual" },
      { label: "Greater than or Equal", value: "greaterThanOrEqual" }
    ];
    var operatorsToStr = [
      { label: "Equal", value: "equal" },
      { label: "Not Equal", value: "notEqual" }
    ];

    var fieldApiName = component.find("field").get("v.value");
    var fieldApiType = component.get("v.fieldApiType");
    for (var items in fieldApiType) {
      if (fieldApiType[items].field === fieldApiName) {
        component.set("v.valueType", fieldApiType[items].type);
      }
    }

    var valueType = component.get("v.valueType");
    var value = component.find("value");
    value.set("v.value", "");
    value.set("v.formatter", "");
    value.set("v.step", "");
    value.set("v.checked", "");
    if (valueType === "BOOLEAN") {
      helper.setTypeValue(component, "toggle");
    } else if (valueType === "EMAIL") {
      helper.setTypeValue(component, "email");
    } else if (valueType === "PHONE") {
      helper.setTypeValue(component, "tel");
    } else if (valueType === "URL") {
      helper.setTypeValue(component, "url");
    } else if (
      valueType === "CURRENCY" ||
      valueType === "DOUBLE" ||
      valueType === "INTEGER" ||
      valueType === "PERCENT"
    ) {
      helper.setTypeValue(component, "number");
      if (valueType === "CURRENCY") {
        value.set("v.formatter", "currency");
        value.set("v.step", "0.01");
      } else if (valueType === "PERCENT") {
        var value = component.find("value");
        value.set("v.formatter", "percent");
        value.set("v.step", "0.01");
      } else if (valueType === "DOUBLE") {
        var value = component.find("value");
        value.set("v.formatter", "decimal");
        value.set("v.step", "0.01");
      }
    } else if (valueType === "DATE") {
      helper.setTypeValue(component, "date");
    } else if (valueType === "DATETIME") {
      helper.setTypeValue(component, "datetime");
    } else {
      helper.setTypeValue(component, "");
    }

    if (
      valueType === "ADDRESS" ||
      valueType === "BOOLEAN" ||
      valueType === "EMAIL" ||
      valueType === "ID" ||
      valueType === "PHONE" ||
      valueType === "PICKLIST" ||
      valueType === "REFERENCE" ||
      valueType === "STRING" ||
      valueType === "TEXTAREA" ||
      valueType === "URL"
    ) {
      component.set("v.valueType", "STRING");
      component.set("v.operator", operatorsToStr);
    } else {
      component.set("v.operator", operators);
    }
    console.log("### " + component.get("v.valueType"));
    var operatorCombobox = component.find("operatorCombobox");
    $A.util.removeClass(operatorCombobox, "slds-hide");
  },

  getProduct: function(component, event, helper) {
    var inputTxt = component.find("product").get("v.value");
    helper.getProducts(component, inputTxt);
  },

  setProduct: function(component, event, helper) {
    helper.selectProduct(component, event, helper);
    var productsList = component.find("productsList");
    $A.util.addClass(productsList, "slds-hide");
  },

  setHide: function(component, event, helper) {
    var productsList = component.find("productsList");
    $A.util.addClass(productsList, "slds-hide");
  },

  remHide: function(component, event, helper) {
    var productsList = component.find("productsList");
    $A.util.removeClass(productsList, "slds-hide");
  }
});
