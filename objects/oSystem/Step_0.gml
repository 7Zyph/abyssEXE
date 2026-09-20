if global.timer>0 global.timer --
if stckTimer > 0 stckTimer-- 
if stckBuyTimer > 0 stckBuyTimer-- 
// stock market
if stckTimer = 0
{
	for (var i = 0; i<array_length(stckItems);i++)
	{
		var item = stckItems[i]
		if item.unlocked
		{
			if !array_length(item.history)
			{
				for (var j = 0; j<10; j++)
				{
					item.price = item.price + (item.vol*(item.chance+((item.stckbase-item.stck)/item.stckbase)-random(2)))
					item.price = clamp(item.price,item.minValue,item.maxValue)
					item.history[array_length(item.history)] = item.price
				}
			}
			item.price = item.price + (item.vol*(item.chance+((item.stckbase-item.stck)/item.stckbase)-random(2)))
			item.price = clamp(item.price,item.minValue,item.maxValue)
			item.history[array_length(item.history)] = item.price
			array_delete(item.history,0,1)
		}
	}
	stckTimer = 60
}

if stckBuyTimer = 0 
{
	for (var i = 0; i<array_length(stckItems);i++)
	{
		var item = stckItems[i]
		if item.unlocked
		{
			item.stck = round(item.stck+item.vol*((((item.price-item.minValue)/(item.maxValue-item.minValue))-.5)*2))
		}
	}
	stckBuyTimer = 60
}