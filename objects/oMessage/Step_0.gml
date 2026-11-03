if windowMovetimer>0 windowMovetimer --
var button_x = windowW/2 - ((button_size+2)*array_length(funcs))/2
for (var i = 0 ;i < array_length(funcs);i++)
{
	
	if point_in_rectangle(oCursor.x,oCursor.y,x+button_x+(button_size+2)*i,y+buttons_y,x+button_x+button_size+(button_size+2)*i,y+buttons_y+12) and oCursor.click and !global.timer
	{
		if funcs[i][1] != -1 funcs[i][1]()
		instance_destroy()
	}
}
if point_in_rectangle(oCursor.x,oCursor.y,x-10,y-10,x+128,y+10) and oCursor.clickPressed windowMovetimer = 5

if global.movingWindow = id or global.movingWindow = noone
{
	if windowMovetimer !=0 and (global.movingWindow = id or global.movingWindow = noone)
	{
		global.movingWindow = id
		var difX = oCursor.x - x
		var difY = oCursor.y - y
	
		x = oCursor.x-64
		y = oCursor.y-3
	
	}
	else global.movingWindow = noone
}
		

