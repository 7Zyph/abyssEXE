//draw_self()

draw_sprite_stretched(sTaskbar,0,0,344,640,16)
draw_sprite(sTaskMenuIcon,0,0,344)

for (var i = 0; i<array_length(shortcuts);i++)
{
	var app = shortcuts[i]
	var img = 0
	if oSystem.currentWindow != app.window
	{
		img = app.status = "open"? 1:2
	}
	else img = 0
	draw_sprite(app.taskbarIcon,img,iconsPosX+16*i,iconsPosY)
}