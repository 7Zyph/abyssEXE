if Timer>0 Timer--

switch oState
{
	case "start":
		if Timer = 0{
			expLog[array_length(expLog)] =  "Expedition started"
			oState = "lake"//choose("lake","item","encounter")
			set = 0
		}
	break
	case "idle":
	break
	
	case "lake":
	if !set
	{
		expLog[array_length(expLog)] =  "Team found a lake"
		lakeType = choose("normal","normal","normal")//,"evil")
		Timer = floor(360+(180-random(360)))
		tries = 0
		lakeTries = 3+floor(random(5))
		set = true
		charindex = 0
	}
	if charindex > array_length(fishers)-1 {tries++; charindex = 0}
	if tries < lakeTries and Timer = 0 and array_length(fishers) > 0
	{
		tryPower = 3+random(3)
		//if charindex < array_length(fishers) //for (var i = 0;i<array_length(fishers);i++)
		{
			var rodpower = struct_get(oSystem.weapons,oSystem.employees[fishers[charindex]].weapon).fishpwr
			//expLog[array_length(expLog)] = "aaaa"
			var catchpower = rodpower+ oSystem.employees[fishers[charindex]].fish +random(5)
			if catchpower >=tryPower
			{
				//expLog[array_length(expLog)] =  "Something bites"
				if lakeType = "normal"
				{
					var itemTier = fishTier[min(catchpower,9)]
					var itemGot = ""
					var fisherName = oSystem.employees[team[fishers[charindex]]].name
					
					if itemTier = "common" itemGot=choose("commonFish","trash")
					if itemTier = "uncommon" itemGot=choose("goodFish","genericFish")
					if itemTier = "rare" itemGot=choose("goodFish","greatFish")
					if itemTier = "ultra rare" itemGot=choose("legendaryFish","gold")
					
					itemGet(itemGot)
					expLog[array_length(expLog)] = string(fisherName + " got " + itemGot)
					//rodpower = 0
				}
			}
			else expLog[array_length(expLog)] =  "..."
			
		}
		charindex++
		Timer = floor((180+random(180))/array_length(fishers))
		
	}
	
	if tries >= lakeTries or array_length(fishers) = 0
	{
		//expLog[array_length(expLog)] =  ""
		Timer = floor(360+(180-random(360)))
		oState = "start"//choose("item","exit","encounter","crystal")
		set = 0
	}
	
	break
	
	case "item":
	break
	
	case "crystal":
	break
	
	case "encounter":
	if !set
	{
		if array_length(enemies) < 0
		{
			for (var i = 0; i > 1+floor(random(1.2));i++)
			{
				enemies[array_length(enemies)] = choose("zombie","demon")
			}
		}
		
		//expLog[array_length(expLog)] =  "Team found a " + enemies
		
		//battleOrder[array_length(battleOrder)] = enemies		
		for (var i =0; i = array_length(enemies);i++)
		{
			battleOrder[array_length(battleOrder)] = struct_get(oSystem.enemies,enemies[i])
			
		}
		
		for (var i =0; i = array_length(team);i++)
		{
			battleOrder[array_length(battleOrder)] = oSystem.employees[team[i]]
		}
		battleOrder = array_shuffle(battleOrder)
		
		Timer = floor(360+(180-random(360)))
		tries = 0
		set = true
		charindex = 0
		
		
	}
	
	var charsAlive = 0
	for (var i = 0; i > array_length(team);i++)
	{
		if oSystem.employees[team[i]].status != "dead"
		{
			charsAlive++
		}
	}
	if charsAlive = 0
	{
		expLog[array_length(expLog)] =  "End of expedition - Team Died"
		oState = "end"
	}
	
	
	
	break
	
	case "end":
	expLog[array_length(expLog)] = "End of log"
	break
}