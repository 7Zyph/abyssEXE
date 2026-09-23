draw_sprite_stretched(sBox,0,x,y,windowW,windowH)
draw_text(x+5,y+3,name)
draw_text(x+10,y+msg_y,msg)

var button_x = windowW/2 - ((button_size+2)*array_length(funcs))/2
var text_size = 0
for (var i = 0 ;i < array_length(funcs);i++)
{
	text_size = button_size/2-(string_length(funcs[i][0])*5)/2
	draw_sprite_stretched(sBox,0,x+button_x+(button_size+2)*i,y+buttons_y,button_size,12)
	draw_text(x+button_x+text_size+(button_size+2)*i,y+buttons_y+2,funcs[i][0])
	//draw_text(x,y-10-(10*i),text_size)
}