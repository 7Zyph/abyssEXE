var button_x = windowW/2 - ((button_size+2)*array_length(funcs))/2
for (var i = 0 ;i < array_length(funcs);i++)
{
	
	if point_in_rectangle(oCursor.x,oCursor.y,x+button_x+(button_size+2)*i,y+buttons_y,x+button_x+button_size+(button_size+2)*i,y+buttons_y+12) and oCursor.click and !global.timer
	{
		if funcs[i][1] != -1 funcs[i][1]()
		instance_destroy()
	}
}
	
		

