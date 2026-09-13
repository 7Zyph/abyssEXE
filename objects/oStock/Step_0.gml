if oSystem.currentWindow = "stockmarket"
{
	for (var i=0; i<array_length(items[category]);i++)
	{
		if point_in_rectangle(oCursor.x,oCursor.y,X_pos,Y_pos+height*i,X_pos+width,(Y_pos+height)+height*i) and oCursor.click
		{
			selected = selected = i? -1: i
		}
	}
}