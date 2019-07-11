({
  executeFildApiNameAction: function(component, action, idObj) {
    action.setParams({
      idObj: idObj
    });
    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        component.set("v.fildApiName", response.getReturnValue());
      }
    });

    $A.enqueueAction(action);
  }
});
