if oSystem.currentWindow = "stockmarket"
{
	draw_set_colour(oSystem.colors[0])
	for (var i=0; i<array_length(items[category]);i++)
	{
		if items[category][i].unlocked
		{
			draw_sprite_stretched(sBox,0,X_pos,Y_pos+height*i,width,height)
			draw_text(X_pos+32,(Y_pos+8)+32*i,items[category][i].name)
			draw_text(X_pos+32,(Y_pos+18)+32*i,items[category][i].price)
		}
		else
		{
			draw_sprite_stretched(sBox,0,X_pos,Y_pos+height*i,width,height)
			draw_text(X_pos+32,(Y_pos+8)+32*i,"???")
			draw_text(X_pos+32,(Y_pos+18)+32*i,"???")
		}
	}
	if selected !=-1 
	{
		var graph_x = 200
		var graph_y = 100
		
		for (var i = 0; i < array_length(items[category][selected].history)-1;i++)
		{

			if  items[category][selected].history[i] < items[category][selected].history[i+1] draw_set_colour(oSystem.colors[0])
			else draw_set_colour(oSystem.colors[1])
			
			draw_line_width(graph_x+10*i,graph_y-items[category][selected].history[i],graph_x+10*(i+1),graph_y-items[category][selected].history[i+1],1)
		}
	}
}