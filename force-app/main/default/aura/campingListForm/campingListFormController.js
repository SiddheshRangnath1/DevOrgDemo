({
	clickCreateItem : function(component, event, helper) 
    {
        var validExpense = component.find('campingform').reduce(function (validSoFar, inputCmp) 
        {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validExpense)
        { 
            // Create the new camping
            var newItem = component.get("v.newItem");
            console.log("Create expense: " + JSON.stringify(newItem));
            helper.createItem(component, newItem); 
            component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                'Name': '',
                'Quantity__c': 0,
                'Price__c': 0,
                'Packed__c': false});
        }
    },
    
})