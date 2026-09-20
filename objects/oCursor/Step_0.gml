if timer > 0 timer --
x = mouse_x
y = mouse_y
click = false
if timer = 0 and mouse_check_button_released(mb_left)
{
	timer = 15
	click = true
}
