({
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Opportunity name', fieldName: 'opportunityName', type: 'text'},
            {label: 'Account name', fieldName: 'accountName', type: 'text'},
            {label: 'Close date', fieldName: 'closeDate', type: 'date'},
            {label: 'Confidence', fieldName: 'confidence', type: 'percentage'},
            {label: 'Amount', fieldName: 'amount', type: 'currency', typeAttributes: { currencyCode: 'EUR', maximumSignificantDigits: 5}},
            {label: 'Contact Email', fieldName: 'contact', type: 'email'},
            {label: 'Contact Phone', fieldName: 'phone', type: 'phone'},
            {label: 'Website', fieldName: 'website', type: 'url', typeAttributes: { target: '_self'}},
            {label: 'Address', fieldName: 'address', type: 'location'}
        ]);
        
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

        
    }
});