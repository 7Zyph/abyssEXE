if oSystem.currentWindow = "teamapp"
{
	for (var i=0; i<array_length(oSystem.employees);i++)
	{
		draw_sprite_stretched(sBox,0,X_pos,Y_pos+height*i,width,height)
		draw_text(X_pos+32,(Y_pos+8)+32*i,oSystem.employees[i].name +" "+ oSystem.employees[i].surname)
		draw_text(X_pos+32,(Y_pos+18)+32*i,oSystem.employees[i].status)
	}
	
	if selected != -1 
	{
		var info_x = 224
		var info_y = 32
		var info_h = 300
		var info_w = 200
		var text_x = info_x +10
		var text_y = info_y +100
		
		draw_sprite_stretched(sBox,0,info_x,info_y,info_w,info_h)
		draw_text(text_x,text_y,">> employee N" +" "+ string(oSystem.employees[selected].employeeId))
		draw_text(text_x,10+text_y,oSystem.employees[selected].name +" "+ oSystem.employees[selected].surname)
		draw_text(text_x,20+text_y,oSystem.employees[selected].ocupation)
		draw_text(text_x,30+text_y,oSystem.employees[selected].habilities)
		draw_text(text_x,40+text_y,oSystem.employees[selected].status)
		draw_text(text_x,50+text_y,"ammo : " +string(oSystem.employees[selected].ammo))
	}
}