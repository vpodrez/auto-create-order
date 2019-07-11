({
  doInit: function(component, event, helper) {
    // v.recordId
    // v.sObjectName

    var objectApiName = component.get("v.sObjectName") + "";
    var idObj = component.get("v.recordId") + "";
    var action;

    if (objectApiName === "Contact") {
      action = component.get("c.getContactLastName");
    } else if (objectApiName === "Lead") {
      action = component.get("c.getLeadLastName");
    } else if (objectApiName === "Account") {
      action = component.get("c.getAccountName");
    } else if (objectApiName === "Opportunity") {
      action = component.get("c.getOpportunityName");
    }
    helper.executeFildApiNameAction(component, action, idObj);
  },

  save: function(component, event, helper) {
    var objectApiName = component.get("v.sObjectName");
    var fildApiName = component.get("v.fildApiName");
    var fieldValue = component.get("v.fieldValue");
    var operator = component.find("operator").get("v.value");

    // add callback for recording record
    // and create helper method
  }
});
