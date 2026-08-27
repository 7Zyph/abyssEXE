var X_pos = x +10

draw_sprite_stretched(sBox,0,x,y,120,65)
draw_text(X_pos,5+y,">> employee N" + string(oSystem.employees[slot].employeeId))
draw_text(X_pos,15+y,oSystem.employees[slot].name +" "+ oSystem.employees[slot].surname)
draw_text(X_pos,25+y,oSystem.employees[slot].ocupation)
draw_text(X_pos,35+y,oSystem.employees[slot].habilities)
draw_text(X_pos,45+y,oSystem.employees[slot].status)
draw_text(X_pos,60+y,oSystem.employees[slot].ammo)
/*
draw_text(X_pos,65+y,"HP = "+string(oSystem.employees[slot].HP))
draw_text(X_pos,75+y,"sanity = "+string(oSystem.employees[slot].sanity))
draw_text(X_pos,85+y,"firearms = "+string(oSystem.employees[slot].firearms))
draw_text(X_pos,95+y,"fish = "+string(oSystem.employees[slot].fish))
draw_text(X_pos,105+y,"perception = "+string(oSystem.employees[slot].perception))
draw_text(X_pos,115+y,"str = "+string(oSystem.employees[slot].str))
draw_text(X_pos,125+y,"med = "+string(oSystem.employees[slot].medicine))

//if point_in_rectangle(oCursor.x,oCursor.y,x,y,x+120,y+55) draw_text(X_pos,45+y,"hover")