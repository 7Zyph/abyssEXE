if oSystem.currentWindow = "desktop"
{
	//x = global.tasks[task].notesX
	//y = global.tasks[task].notesY
	if windowMovetimer >0 windowMovetimer--
	if point_in_rectangle(oCursor.x,oCursor.y,x-10,y-10,x+128,y+10) and oCursor.clickPressed windowMovetimer = 5

	if global.movingWindow = id or global.movingWindow = noone
	{
		if windowMovetimer !=0 and (global.movingWindow = id or global.movingWindow = noone)
		{
			global.movingWindow = id	
			x = oCursor.x-64
			y = oCursor.y-3
			
			global.tasks[task].nX = x
			global.tasks[task].nY = x
		}
		else global.movingWindow = noone
	}
}