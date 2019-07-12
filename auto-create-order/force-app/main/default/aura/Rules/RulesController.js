({
  doInit: function(component, event, helper) {
    // v.recordId
    // v.sObjectName

    var objName = component.get("v.sObjectName") + "";

    helper.executeFieldApiNameAction(component, objName);
  },

  save: function(component, event, helper) {
    var objectApiName = component.get("v.sObjectName");
    var fieldApiName = component.get("v.fieldApiName");
    var fieldValueInput = component.find("value");
    var fieldValue = fieldValueInput.get("v.value");
    var operator = component.find("operator").get("v.value");

/*    if (isNaN(fieldValue)) {
      inputField.set("v.validity", { valid: false, badInput: true });
      //inputField.showHelpMessageIfInvalid();
      return;
    } else {*/
      // add callback for recording record
      // and create helper method
      helper.saveRule(
        component,
        helper,
        objectApiName,
        fieldApiName,
        fieldValue,
        operator
      );
    //}
  }

  /*  handleBlur: function (cmp, event) {
    var validity = cmp.find("myinput").get("v.validity");
    console.log(validity.valid); //returns true
  }*/
});
