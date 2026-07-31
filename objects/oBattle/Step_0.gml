if Timer>0 Timer--

switch oState
{
	case "start":
		if Timer = 0{
			expLog[array_length(expLog)] =  "Expedition started"
			oState = "encounter"//choose("lake","item","encounter")
			set = 0
			//enemies = []
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
		//if array_length(enemies) < 1
		//{
			
			for (var i = 0; i < 1+floor(random(2));i++)
			{
				enemies[array_length(enemies)] = struct_get(oSystem.enemies,choose("zombie","demon"))
			}
		//}
		
		//expLog[array_length(expLog)] =  "Team found a " + enemies
		
		//battleOrder[array_length(battleOrder)] = enemies		
		for (var i =0; i < array_length(enemies);i++)
		{
			battleOrder[array_length(battleOrder)] = ["enemy",i]
		}
		
		for (var i =0; i < array_length(team);i++)
		{
			battleOrder[array_length(battleOrder)] = ["player",team[i]]
		}
		battleOrder = array_shuffle(battleOrder)
		
		Timer = floor(360+(180-random(360)))
		//tries = 0
		set = true
		charindex = 0
	}
	stri = string(enemies[0].HP)
	var charsAlive = 0
	for (var i = 0; i < array_length(team);i++)
	{
		if oSystem.employees[team[i]].status != "dead"
		{
			charsAlive++
		}
	}
	var enemiesAlive = 0
	for (var i = 0; i < array_length(enemies);i++)
	{
		if enemies[i].status != "dead"
		{
			enemiesAlive++
		}
	}
	if charsAlive = 0 //and Timer = 0
	{
		expLog[array_length(expLog)] =  "End of expedition - Team Died"
		oState = "end"
	}
	stri = enemiesAlive
	if enemiesAlive = 0 //and Timer = 0
	{
		set = false
		expLog[array_length(expLog)] =  "All enemies Defeated"
		var loot
		for (var i = 0; i < array_length(enemies);i++)
		{
			loot = enemies[i].drops[floor(random(array_length(enemies[i].drops)))]
			expLog[array_length(expLog)] =  "you found " + loot
			itemGet(loot)
		}
		array_resize(enemies,0)
		oState = "start"
		Timer = floor(360+(180-random(360)))
	}
	if charindex > array_length(battleOrder)-1 charindex = 0
	
	if Timer = 0
	{
		var name = ""
		var target = -1
		
		if battleOrder[charindex][0] = "enemy" 
		{
			if enemies[battleOrder[charindex][1]].status = "alive"
			{
				name = enemies[battleOrder[charindex][1]].name
				target = floor(random(array_length(battleOrder)))
				while battleOrder[target][0] != "player" //and oSystem.employees[battleOrder[target][1]].HP = 0
				{
					target = floor(random(array_length(battleOrder)))
					if battleOrder[target][0] = "player"
					{
						if  oSystem.employees[battleOrder[target][1]].HP <= 0 target = floor(random(array_length(battleOrder)))
					}
				}
				var damage = floor(enemies[battleOrder[charindex][1]].atk + random(enemies[battleOrder[charindex][1]].atk*.25))
				
				oSystem.employees[battleOrder[target][1]].HP = max(oSystem.employees[battleOrder[target][1]].HP-damage,0)
				
				if oSystem.employees[battleOrder[target][1]].HP = 0
				{
					oSystem.employees[battleOrder[target][1]].status = "dead"
					expLog[array_length(expLog)] = name + " killed " + oSystem.employees[battleOrder[target][1]].name
					//array_delete(battleOrder,target,1)
				}
				else expLog[array_length(expLog)] = name + " attacked " + oSystem.employees[battleOrder[target][1]].name
				Timer = floor(180+random(180))
			}
			charindex++
		}
		if charindex > array_length(battleOrder)-1 charindex = 0
		if battleOrder[charindex][0] = "player" and Timer = 0
		{
			name = oSystem.employees[battleOrder[charindex][1]].name
			target = floor(random(array_length(battleOrder)))
			if oSystem.employees[battleOrder[charindex][1]].status = "alive" 
			{
				var healing = false
				if struct_get(oSystem.weapons,oSystem.employees[battleOrder[charindex][1]].weapon).type = 4 healing = true
				if healing
				{
					var leastHP = 0
					for (var i = 0; i > array_length(team);i++)
					{
						if oSystem.employees[team[leastHP]].HP > oSystem.employees[team[i]].HP	leastHP = i
					}
					if oSystem.employees[team[leastHP]].HP < (oSystem.employees[team[leastHP]].maxHP)*.6 
					{
						var heal = struct_get(oSystem.weapons,oSystem.employees[battleOrder[charindex][1]].weapon).healpwr*(1+oSystem.employees[battleOrder[charindex][1]].medicine)
						oSystem.employees[team[leastHP]].HP = min(oSystem.employees[team[leastHP]].HP+(heal),oSystem.employees[team[leastHP]].maxHP)
						expLog[array_length(expLog)] = name + " healed " + oSystem.employees[team[leastHP]].name
						Timer = floor(180+random(180))
					}
					else healing = false
				}
				if !healing
				{
					while battleOrder[target][0] != "enemy" //and oSystem.employees[battleOrder[target][1]].HP = 0
					{
						target = floor(random(array_length(battleOrder)))
						if battleOrder[target][0] = "enemy"
						{
							if enemies[battleOrder[target][1]].HP <= 0 target = floor(random(array_length(battleOrder)))
						}
					}
					var damage = struct_get(oSystem.weapons,oSystem.employees[battleOrder[charindex][1]].weapon).atk + oSystem.employees[battleOrder[charindex][1]].str
					if struct_get(oSystem.weapons,oSystem.employees[battleOrder[charindex][1]].weapon).type = 3
					{
						if oSystem.employees[battleOrder[charindex][1]].ammo > 0
						{
							damage = struct_get(oSystem.weapons,oSystem.employees[battleOrder[charindex][1]].weapon).rAtk + oSystem.employees[battleOrder[charindex][1]].firearms
							oSystem.employees[battleOrder[charindex][1]].ammo--
						}
					}
					enemies[battleOrder[target][1]].HP = max(enemies[battleOrder[target][1]].HP-damage,0)
					if enemies[battleOrder[target][1]].HP <= 0 enemies[battleOrder[target][1]].status = "dead"
					expLog[array_length(expLog)] = enemies[battleOrder[target][1]].status = "dead" ? name + " killed " + enemies[battleOrder[target][1]].name : name + " attacked " + enemies[battleOrder[target][1]].name
					Timer = floor(180+random(180))
				}
			}
			charindex++
		}
	}
	
	break
	
	case "end":
	expLog[array_length(expLog)] = "End of log"
	break
}