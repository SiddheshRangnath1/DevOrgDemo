({
	createCamping: function(component, item)
    {
        var theItems = component.get("v.items");
 
        // Copy the item to a new object
        // THIS IS A DISGUSTING, TEMPORARY HACK
        var newItem = JSON.parse(JSON.stringify(item));
 		console.log("Camping before 'create': " + JSON.stringify(theItems));
        theItems.push(newItem);
        component.set("v.items", theItems);
        console.log("Camping after 'create': " + JSON.stringify(theItems));
    }
})