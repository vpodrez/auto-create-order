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
        for (var i = 0; i < fields.length; i++) {
          var item = {
            label: fields[i],
            value: fields[i]
          };
          items.push(item);
        }
        component.set("v.fieldApiName", items);
      }
    });

    $A.enqueueAction(action);
  },

  getProducts: function(component) {
    var products = [];
    var items = [];

    var action = component.get("c.getProducts");

    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        products = response.getReturnValue();
        for (var i = 0; i < products.length; i++) {
          var item = {
            label: products[i].Name,
            value: products[i].Id
          };
          items.push(item);
        }
        component.set("v.products", items);
      }
    });

    $A.enqueueAction(action);
  },

  saveRule: function(
    component,
    helper,
    objectApiName,
    fieldApiName,
    productId,
    fieldValue,
    operator
  ) {
    if (
      objectApiName == '' ||
      fieldApiName == '' ||
      fieldValue == '' ||
      productId == '' ||
      operator == ''
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
      operator: operator
    });

    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        helper.showSuccessToast();
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
  }
});
