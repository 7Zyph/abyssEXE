function message_create(_msg = "message :3",_x =256 ,_y= 140,_funcs=[["Ok",-1]], _name = "message.txt")
{
	with (instance_create_depth(_x,_y,-99999,oMessage))
	{
		funcs = _funcs
		msg = _msg
		name = _name
	
	}
}

function create_msg()
{
	message_create(":3",random(600),random(300))
}