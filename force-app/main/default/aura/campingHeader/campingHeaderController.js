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
            
            var theItems = component.get("v.items");
        	var newItem1 = JSON.parse(JSON.stringify(newItem));
 			console.log("Camping before 'create': " + JSON.stringify(theItems));
        	theItems.push(newItem1);
        	component.set("v.items", theItems);
        	console.log("Camping after 'create': " + JSON.stringify(theItems))   
        }
    }
    
     
})