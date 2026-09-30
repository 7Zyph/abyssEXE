if oSystem.currentWindow="expedition"
{
	//draw_sprite(sBattleBG,0,0,0)
	draw_set_colour(c_white)
	draw_text(3,2,"Expedition")

	draw_set_colour(c_black)
	for (var i = 0; i<array_length(team);i++)
	{
		if team[i] != -1
		{	
			var char = oSystem.employees[team[i]]
			var weapon = struct_get(oSystem.weapons,oSystem.employees[team[i]].weapon)
			draw_text(35,28+33*i,char.name +" "+ char.surname)
			draw_text(35,38+33*i,char.status)
			draw_text(35,48+33*i,weapon.name)
			if weapon.type = 3 draw_text(100,48+33*i,"Ammo: "+ string(char.ammo) +"/"+ string(weapon.ammo))
		}
	
	}
	draw_set_colour(c_white)
	if array_length(expLog)<onscreenMaxText
	{
		for (var i = 0; i<array_length(expLog); i++)
		{
			draw_set_colour(oSystem.colors[expLog[i][1]]) 
			draw_text(157,28+10*i,expLog[i][0])
		}
	}
	else
	{
	
		var textlogStart = array_length(expLog)-onscreenMaxText
		for (var i = 0; i<onscreenMaxText; i++)
		{
			draw_set_colour(oSystem.colors[expLog[i][1]]) 
			draw_text(157,28+10*i,expLog[textlogStart + i][0])
		}
	
	}
	
	if oState = "select"
	{
		for (var i = 0; i<array_length(areas);i++)
		{
			if areas[i].unlocked
			{
				draw_sprite_stretched(sBox,0,areaBoxX,areaBoxY+areaBoxH*i,areaBoxW,areaBoxH)
				draw_text(areaBoxX+16,4+areaBoxY+areaBoxH*i,areas[i].name)
			}
		}
		if selectedArea != -1
		{
			draw_text(300,300,areas[selectedArea].name)
			draw_sprite_stretched(sBox,0,startButtonX,startButtonY,startButtonW,startButtonH)
		}
	}
	
	
	//draw_text(10,130,oSystem.enemies.zombie.HP)
	//draw_text(10,150,enemiesAlive)
	draw_text(10,170,oState)
}