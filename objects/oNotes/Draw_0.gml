if oSystem.currentWindow = "desktop"
{
	draw_sprite_stretched(sBox,0,x,y,windowW,windowH)
	draw_text(x+5,y+5, global.tasks[task])
}