({
	myaccAction : function(component, event, helper) {
		var name=component.get('v.accName');
        //name=name+'@.gmail.com';
        //component.set('v.accEmail',name);
        
        var action = component.get('c.InsertAcc');
        action.setParams({
            'Name': name,
            'Num' : component.get("v.accNumber"),
            'Email' : component.get("v.accEmail")
        });
         action.setCallback(this, $A.getCallback(function (response) {
             var returnData = response.getReturnValue();
             alert('dfghjk');
             var state = response.getState(); 
             if (state === "SUCCESS"){
                 alert("An Account with the Id:"+returnData+" has been created successfuly! ");
             } else if (state === "ERROR"){
                 var errors = response.getError();
                 console.log(errors);
             }
         }));
         $A.enqueueAction(action);
        
        
	}
})