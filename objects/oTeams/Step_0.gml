if oSystem.currentWindow = "teamapp"
{
	for (var i=0; i<array_length(oSystem.employees);i++)
	{
		if point_in_rectangle(oCursor.x,oCursor.y,X_pos,Y_pos+height*i,X_pos+width,(Y_pos+height)+height*i) and oCursor.click and !global.timer
		{
			selected = selected = i? -1: i
		}
	}
	totalWeapons = 0
	for (var i = 0; i<array_length(oSystem.weaponsList);i++)
	{
		if oSystem.weaponsList[i].qtd > 0 totalWeapons++
	}
	
	if selected != -1
	{
		if point_in_rectangle(oCursor.x,oCursor.y,selectionBox_x-1,selectionBox_y,selectionBox_x+selectionBox_w+3,selectionBox_y+selectionBox_h) and !selectionBoxOpen and oCursor.click and !global.timer
		{
			selectionBoxOpen = true
			global.timer = 15
		}
		if selectionBoxOpen
		{
			var j = 0
			for (var i = 0; i<array_length(oSystem.weaponsList);i++)
			{
				if oSystem.weaponsList[i].qtd > 0 
				{
					if point_in_rectangle(oCursor.x,oCursor.y,selectionBox_x,10+selectionBox_y+selectionBox_h*j,selectionBox_x+selectionBox_w,20+selectionBox_y+selectionBox_h*j) and oCursor.click and !global.timer
					{
						oSystem.employees[selected].weapon = oSystem.weaponsList[i].itemID
						oSystem.employees[selected].ammo = oSystem.weaponsList[i].ammo
						selectionBoxOpen = false
					}
					j++
				}
			}
		if selectionBoxOpen and oCursor.click  and global.timer = 0 selectionBoxOpen = false
		}
	}
}