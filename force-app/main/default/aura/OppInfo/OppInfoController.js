({
	myoppAction : function(component, event, helper) {
		var action = component.get('c.InsertOpp');
        action.setParams({
            'Name': component.get("v.oppName"),
            'Dat' : component.get("v.closeDate"),
            'Stage' : component.get("v.stageName"),
            'aName' : component.get("v.accName"),
            'Prob' : component.get("v.prob")
        });
         action.setCallback(this, $A.getCallback(function (response) {
             var returnData = response.getReturnValue();
             alert("Helloo");
             var state = response.getState(); 
             if (state === "SUCCESS"){
                 alert("An Opportunity with the Id:"+returnData+" has been created successfuly! ");
             } else if (state === "ERROR"){
                 var errors = response.getError();
                 console.log(errors);
             }
         }));
         $A.enqueueAction(action);
    },
    
    
    clearAction : function(component, event, helper) {
        component.set("v.oppName","");
        component.set("v.closeDate","");
        component.set("v.stageName","");
        component.set("v.accName","");
        component.set("v.prob",""); 
	}
})