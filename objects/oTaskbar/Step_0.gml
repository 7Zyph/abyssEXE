for (var i = 0; i<array_length(shortcuts);i++)
{
	var app = shortcuts[i]
	if point_in_rectangle(oCursor.x,oCursor.y,iconsPosX+16*i,iconsPosY,(iconsPosX+16)+16*i,iconsPosY+16) and oCursor.click
	{
		if app.status != "open" app.status = "open"
		oSystem.currentWindow=app.window
	}
}