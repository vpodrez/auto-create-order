({
  getFieldApiName: function(component, objName) {
    var fields = [];
    var items = [];

    var action = component.get("c.getFields");
    action.setParams({
      objName: objName
    });

    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        fields = response.getReturnValue();
        for (var obj in fields) {
          console.log(fields[obj].type);
          var item = {
            label: fields[obj].field,
            value: fields[obj].field
          };
          items.push(item);
        }
        component.set("v.fieldApiName", items);
        component.set("v.fieldApiType", fields);
      }
    });

    $A.enqueueAction(action);
  },

  getFieldApiNameType: function(component, objName) {
    var fields = [];
    var items = [];

    var action = component.get("c.getType");
    action.setParams({
      objName: objName
    });

    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        fields = response.getReturnValue();
        for (var i = 0; i < fields.length; i++) {
          var item = {
            label: fields[i],
            value: fields[i],
            type: ""
          };
          items.push(item);
        }
        component.set("v.fieldApiName", items);
      }
    });

    $A.enqueueAction(action);
  },

  getProducts: function(component, inputTxt) {
    var action = component.get("c.getProducts");

    action.setParams({
      inputTxt: inputTxt
    });

    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        var products = response.getReturnValue();
        component.set("v.products", products);
      }
    });

    $A.enqueueAction(action);
  },

  selectProduct: function(component, event, helper) {
    var ctarget = event.currentTarget;
    var Id = ctarget.dataset.value;
    var Name = ctarget.innerHTML;

    component.set("v.selectedProductId", Id);
    component.set("v.inputTxt", Name);
  },

  saveRule: function(
    component,
    helper,
    objectApiName,
    fieldApiName,
    productId,
    fieldValue,
    fieldType,
    operator
  ) {
    console.log(
      objectApiName +
        " " +
        fieldApiName +
        " " +
        fieldValue +
        " " +
        productId +
        " " +
        operator
    );
    if (
      objectApiName == "" ||
      fieldApiName == "" ||
      fieldValue == "" ||
      fieldType == "" ||
      productId == "" ||
      operator == ""
    ) {
      helper.showErrorToast();
      return null;
    }

    var action = component.get("c.saveRule");

    action.setParams({
      objectApiName: objectApiName,
      fieldApiName: fieldApiName,
      productId: productId,
      fieldValue: fieldValue,
      fieldType: fieldType,
      operator: operator
    });

    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        helper.showSuccessToast();
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
          recordId: response.getReturnValue(),
          slideDevName: "related"
        });
        navEvt.fire();
      }
      if (state === "ERROR") {
        helper.showErrorToast();
      }
    });

    $A.enqueueAction(action);
  },

  showSuccessToast: function() {
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
      title: "Success",
      message: "Rule has been created",
      duration: "2000",
      key: "info_alt",
      type: "success",
      mode: "pester"
    });
    toastEvent.fire();
  },

  showErrorToast: function() {
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
      title: "Error ",
      message: "Rule has not been created",
      duration: "2000",
      key: "info_alt",
      type: "error",
      mode: "pester"
    });
    toastEvent.fire();
  },

  setTypeValue: function(component, type) {
    var value = component.find("value");
    value.set("v.type", type);
  }
});
