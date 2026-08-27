function createEmployee(index)
{
	//var index = array_length(oSystem.employees)
	//var _employeeId = index
	var _name = oSystem.names[random(array_length(oSystem.names)-1)]
	var _surname = oSystem.names[random(array_length(oSystem.names)-1)]
	var _weapon = choose("fishrod","gun","pickaxe","medkit")
	
	var _firearms = 0
	var _str = 0
	var _perception = 0
	var _fish = 0
	var _medicine = 0
	var _sanity = random(2)
	
	var _ocupation = choose("Unemployed","Fisherman","Excavator","Soldier","Medic")
	if _ocupation == "Unemployed" {_fish= random(1); _str = random(1);_perception= random(1)}
	if _ocupation == "Fisherman" {_fish++; _sanity+=.5}
	if _ocupation == "Excavator" _str++
	if _ocupation == "Soldier" {_firearms++; _str+=.5; _perception+=.5}
	if _ocupation == "Medic" _medicine++
	
	
	var _habilities = []
	
	for (var i = 0; i < floor(random(3)+1);i++)
	{
		var hability = choose("no close family","Good eyes","Strong","gay")
		while array_contains(_habilities,hability)
		{
			hability = choose("no close family","Good eyes","Strong","gay")
		}
		if hability = "Good eyes" _perception++
		if hability = "Strong" _str++
		
		_habilities[i] = hability
	}
	
	var _HP = 10+random(5)*_str
	
	oSystem.employees[index] = {
		employeeId	:	index,
		name		:	_name,
		surname		:	_surname,
		ocupation	:	_ocupation,
		habilities	:	_habilities,
		status		:	"alive",
		weapon		:	_weapon,
		maxHP		:	_HP,
		HP			:	_HP,
		ammo		:	0,//struct_get(oSystem.weapons,_weapon).ammo,
		firearms	:	_firearms,
		str			:	_str,
		perception	:	_perception,
		fish		:	_fish,
		medicine	:	_medicine,
		sanity		:	_sanity
		
	}
}


