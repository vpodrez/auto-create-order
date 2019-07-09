({
  doInit: function(component, event, helper) {
    var rules = [];
    var action = component.get("c.getChooseRules");
    var obj = component.get("v.sObjectName") + '';
    var items = [];
    action.setParams({ 
        obj : obj
    });
    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        rules = response.getReturnValue();
        for (var i = 0; i < rules.length; i++) {
          var item = {
            label: rules[i],
            value: rules[i]
          };
          items.push(item);
        }
        component.set("v.rules", items);
      }
    });

    $A.enqueueAction(action);
  }
});