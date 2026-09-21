if oSystem.currentWindow = "stockmarket" 
{
	for (var i=0; i<array_length(items[category]);i++)
	{
		if point_in_rectangle(oCursor.x,oCursor.y,X_pos,Y_pos+height*i,X_pos+width,(Y_pos+height)+height*i) and oCursor.click and !global.timer
		{
			selected = selected = i? -1: i
		}
	}
	
	for (var i = 0; i<array_length(buy_val)+1;i++)
	{
		if point_in_rectangle(oCursor.x,oCursor.y,buy_x+(10+buy_w)*i,buy_y,buy_x+buy_w+(10+buy_w)*i,buy_y+buy_h) and oCursor.click and !global.timer
		{
			var item = items[category][selected]
			if i != array_length(buy_val)
			{
				if global.money >= (item.price)*buy_val[i] and item.stck>buy_val[i]
				{
					itemBuy(item,buy_val[i])
				}
			} 
			else 
			{
				if global.money >= item.price*item.stck
				{
					itemBuy(item,item.stck)
				}
			}
		}
	}
	for (var i = 0; i<array_length(buy_val)+1;i++)
	{
		if point_in_rectangle(oCursor.x,oCursor.y,buy_x+(10+buy_w)*i,buy_y+15,buy_x+buy_w+(10+buy_w)*i,(buy_y+15)+buy_h) and oCursor.click and !global.timer
		{
			var item = items[category][selected]
			if i != array_length(buy_val)
			{
				if item.stck>=buy_val[i] and item.qtd>0
				{
					itemSell(item,buy_val[i])
				}
			} 
			else 
			{
				if item.qtd>0
				{
					itemSell(item,item.qtd)
				}
			}
		}
	}
}