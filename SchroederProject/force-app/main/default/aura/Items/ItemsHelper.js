({
    fetchData : function(component, event, helper) {

        var action = component.get("c.getItems");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.itemList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);

    }
})
