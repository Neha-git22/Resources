({
    myAction: function(component, event, helper) {
        helper.fetchAccHelper(component);
        component.set('v.columns', [
            {label: 'Account Name', fieldName: 'Name', type: 'button', typeAttributes: {label: {fieldName: 'Name'}, variant: 'base'}},
            {label: 'Phone', fieldName: 'Phone', type: 'Phone'},
            {label: 'Email', fieldName: 'Email__c', type: 'Email'}
        ]);

        component.set('v.conColumns', [
            {label: 'Last Name', fieldName: 'LastName', type: 'text'},
            {label: 'Email', fieldName: 'Email', type: 'Email'}
        ]);
    },

    showContacts: function(component, event, helper) {
        var accountId = event.getParam('row').Id;
        helper.fetchContacts(component, accountId);
    }
})