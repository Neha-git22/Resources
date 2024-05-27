({
	myconAction : function(component, event, helper) {
		var name=component.get('v.conName');
        name=name+'@gmail.com';
        component.set('v.conEmail',name);
        

	}
})