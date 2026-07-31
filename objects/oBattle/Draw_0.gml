for (var i=0;i<array_length(team);i++)
{
	
	draw_text(10,300+10*i,struct_get(oSystem.weapons,oSystem.employees[team[i]].weapon).name)
	
}

if array_length(expLog)<onscreenMaxText
{
	for (var i = 0; i<array_length(expLog); i++)
	{
		draw_text(300,10*i,expLog[i])
	}
}
else
{
	
	var textlogStart = array_length(expLog)-onscreenMaxText
	for (var i = 0; i<onscreenMaxText; i++)
	{
		draw_text(300,10*i,expLog[textlogStart + i])
	}
	
}
draw_text(10,130,array_length(enemies))
draw_text(10,150,stri)
draw_text(10,170,enemies)