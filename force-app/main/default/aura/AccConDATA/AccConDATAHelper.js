({
    fetchAccHelper : function(component, event, helper) {
        var action = component.get("c.getAccounts");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.accList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    fetchContacts: function(component, accountId) {
        var action = component.get("c.getContacts");
        action.setParams({ accountId: accountId });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var contacts = response.getReturnValue();
                if (contacts && contacts.length > 0) {
                    component.set("v.conList", contacts);
                    component.set("v.showCard", true);
                } else {
                    
                    component.set("v.showCard", false);
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "No Contacts Found",
                        "message": "There are no contacts associated with this account.",
                        "type": "info"
                    });
                    toastEvent.fire();
                }
            } 
        });
        $A.enqueueAction(action);
    }    
})