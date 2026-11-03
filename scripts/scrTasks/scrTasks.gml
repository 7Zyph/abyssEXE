function createTasks(_id,_dificulty = round(random(3)),_type = round(random(1)),_item = oSystem.stckItems[random(array_length(oSystem.stckItems))],_enemy = oSystem.enemies_list[random(array_length(oSystem.enemies_list))],_qtd = round(random(20)))
{
	
	var _nx= random(600)
	var _ny= random(300)
	var _reward = 100*(_dificulty * (_qtd*.5)) 
	
	if _type = 0
		global.tasks[_id] = 
		{
			taskId: _id,
			nX: _nx,
			nY: _ny,
			type : 0,
			turnIn: false,
			item : _item,
			qtd	 : _qtd,
			reward : _reward
		}
	if _type = 1
		global.tasks[_id] = 
		{
			taskId: _id,
			nX: _nx,
			nY: _ny,
			type : 1,
			turnIn: false,
			enemy : _enemy,
			qtd	 : _qtd,
			reward : _reward
		}
	with (instance_create_depth(_nx,_ny,-99,oNotes))
		{
			task = _id
			//name = ""
		}
	
}

/*function createNote(_id)
{
	//x = global.tasks[task].nX
	//y = global.tasks[task].nY
	with (instance_create_depth(global.tasks[_id].nX,global.tasks[_id].ny,-99,oNotes))
	{
		task = _id
		name = ""
	}
}