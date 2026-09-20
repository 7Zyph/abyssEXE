for (var i = 0; i<array_length(shortcuts);i++)
{
	var app = shortcuts[i]
	if point_in_rectangle(oCursor.x,oCursor.y,iconsPosX+16*i,iconsPosY,(iconsPosX+16)+16*i,iconsPosY+16) and oCursor.click and !global.timer
	{
		global.timer = 15
		if app.status != "open" app.status = "open"
		if oSystem.currentWindow = app.window and oSystem.currentWindow != "desktop" {oSystem.currentWindow = "desktop"}
		else oSystem.currentWindow = app.window
		
		
	}
}