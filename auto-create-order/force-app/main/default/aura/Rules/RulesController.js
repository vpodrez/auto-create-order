({
  doInit: function(component, event, helper) {
    var objName =
      component.get("v.sObjectName") != 'Rule__c'
        ? component.get("v.sObjectName")
        : component.find("object").get("v.value");

    helper.getFieldApiName(component, objName);

    helper.getProducts(component);
  },

  save: function(component, event, helper) {
    var objectApiName =
      component.get("v.sObjectName") != 'Rule__c'
        ? component.get("v.sObjectName")
        : component.find("object").get("v.value");
    var fieldApiName = component.find("field").get("v.value");
    var productId = component.find("product").get("v.value");
    var fieldValue = component.find("value").get("v.value");
    var operator = component.find("operator").get("v.value");

    helper.saveRule(
      component,
      helper,
      objectApiName,
      fieldApiName,
      productId,
      fieldValue,
      operator
    );
  },
  setFieldApiName: function(component, event, helper) {
    var objName = component.find("object").get("v.value");

    helper.getFieldApiName(component, objName);
  }
});
