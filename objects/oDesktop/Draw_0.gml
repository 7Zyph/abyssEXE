if oSystem.currentWindow = "desktop" 
{
	for (var i = 0; i<array_length(shortcuts);i++)
	{
		var app = shortcuts[i]
		draw_sprite(app.desktopIcon,0,app.posX,app.posY)
		draw_set_colour(oSystem.colors[0])
		draw_text(app.posX,app.posY+18,app.name)
		//draw_text(10,10,"zap")
	}
}