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
		var graph_y = 200
		var graph_size = 100
		draw_sprite_stretched(sBox,0,graph_x-2,graph_y-graph_size,200,graph_size)
		for (var i = 0; i < array_length(items[category][selected].history)-1;i++)
		{

			if  items[category][selected].history[i] < items[category][selected].history[i+1] draw_set_colour(oSystem.colors[0])
			else draw_set_colour(oSystem.colors[1])
			
			var value_normalized1 = graph_size*(items[category][selected].history[i]-items[category][selected].minValue)/(items[category][selected].maxValue-items[category][selected].minValue)
			var value_normalized2 = graph_size*(items[category][selected].history[i+1]-items[category][selected].minValue)/(items[category][selected].maxValue-items[category][selected].minValue)
			
			draw_line_width(graph_x+10*i,graph_y-value_normalized1,graph_x+10*(i+1),graph_y-value_normalized2,1)
		}
	}
	
	if selected !=-1
	{
		draw_set_colour(oSystem.colors[0])
		var item = items[category][selected]
		var val = "" 
		for (var i=0; i<array_length(buy_val)+1;i++)
		{
			var qtd = 0
			if i != array_length(buy_val)
			{
				qtd = buy_val[i]
				val = string(qtd)
			}
			else 
			{
				qtd = item.stck
				val = "all"
			}
			
			if global.money > item.price*qtd
			{
				draw_sprite_stretched(sBox,0,buy_x+(10+buy_w)*i,buy_y,buy_w,buy_h)
				draw_text(3+buy_x+(10+buy_w)*i,buy_y+3,val)
			}
			
			
		}
	}
	if selected !=-1
	{
		draw_set_colour(oSystem.colors[0])
		var item = items[category][selected]
		var val = "" 
		for (var i=0; i<array_length(buy_val)+1;i++)
		{
			var qtd = 0
			if i != array_length(buy_val)
			{
				qtd = buy_val[i]
				val = string(qtd)
			}
			else 
			{
				qtd = item.qtd
				val = "all"
			}
			
			if item.qtd >= qtd and item.qtd>0
			{
				draw_sprite_stretched(sBox,0,buy_x+(10+buy_w)*i,buy_y+15,buy_w,buy_h)
				draw_text(3+buy_x+(10+buy_w)*i,buy_y+18,val)
			}
			
			
		}
	}
}
draw_text(10,300,global.money)
draw_text(10,310,oSystem.items.crystalfrag.stck)
draw_text(10,320,oSystem.items.crystalfrag.qtd)