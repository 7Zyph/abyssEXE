if oSystem.currentWindow = "desktop" 
{
	for (var i = 0; i<array_length(shortcuts);i++)
	{
		var app = shortcuts[i]
		if point_in_rectangle(oCursor.x,oCursor.y,app.posX,app.posY,app.posX+16,app.posY+16) and oCursor.click
		{
			if app.status != "open" app.status = "open"
			oSystem.currentWindow = app.window
		}
	}
}
if oSystem.currentWindow != "desktop" 
{
	if point_in_rectangle(oCursor.x,oCursor.y,616,0,626,10) and oCursor.click
	{
		oSystem.currentWindow = "desktop" 
	}
	
	if point_in_rectangle(oCursor.x,oCursor.y,628,0,638,10) and oCursor.click
	{
		struct_get(oSystem.apps,oSystem.currentWindow).status = "closed"
		oSystem.currentWindow = "desktop" 
	}
}