function message_create(_x,_y,_funcs=[["Ok",create_msg]],_msg = "message :3", _name = "message.txt")
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
	message_create(random(600),random(300))
}