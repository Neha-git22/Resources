({
    doInit: function(component, event, helper) {
        // Fetch the list of accounts from the server
        //alert("start");
        var action = component.get("c.getData");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.accL", response.getReturnValue());
            }else if (state === "ERROR"){
                var errors = response.getError();
                console.log(errors);
            }
        });
        $A.enqueueAction(action);
        
    },
    
    fetch: function(component, event, helper){
        var Id=component.find("accList").get("v.value");
        
        var action = component.get("c.getConData");
        
        //alert(Id);
        
        action.setParams({
            'accountId': Id
        });
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            if (state === "SUCCESS") {
                //alert(10);
                component.set("v.conL", response.getReturnValue());
                var cons=component.get("v.conL");
                if(cons==""){
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Warning',
                        message: 'This Account has no related Contacts!',
                        duration:' 5000',
                        key: 'info_alt',
                        type: 'warning',
                        mode: 'sticky'
                    });
                    toastEvent.fire();
                }  
            }else if (state === "ERROR"){
                var errors = response.getError();
                console.log(errors);
            }
        });
        $A.enqueueAction(action);
        
    },
    fetchCon1: function(component, event, helper){
        var a =  component.get("v.customT");
        if(a === true)
            component.set("v.customT",false);
        else if(a === false)
            component.set("v.customT",true);
        
        
        // component.set("v.custo",false);
        var Id=component.find("accList").get("v.value");
        var action = component.get("c.getConData");
        
        //alert(Id);
        
        action.setParams({
            'accountId': Id
        });
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            if (state === "SUCCESS") {
                //alert(10);
                component.set("v.conL", response.getReturnValue());
                //alert(20);    
            }else if (state === "ERROR"){
                var errors = response.getError();
                console.log(errors);
            }
        });
        $A.enqueueAction(action);
    },
    
    fetchCon2: function(component, event, helper){
        var a =  component.get("v.customT");
        //alert(a);
        if(a === true)
            component.set("v.customT",false);
        else if(a === false)
            component.set("v.customT",true);
        
        //alert("in method");
        component.set("v.custom",true);
        var Id=component.find("accList").get("v.value");
        var action = component.get("c.getConData");
        //alert(Id);
        action.setParams({
            'accountId': Id
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //alert(10);
                component.set("v.conL", response.getReturnValue());
                //alert(20);
                //alert(response.getReturnValue())
                component.set("v.columns", [
                    { label: "First Name", fieldName: "FirstName", type: "text" },
                    { label: "Last Name", fieldName: "LastName", type: "text" },
                    { label: "Email", fieldName: "Email", type: "email" }
                ]);
            }else if (state === "ERROR"){
                var errors = response.getError();
                console.log(errors);
            }
        });
        $A.enqueueAction(action);
    }
    
})