window_set_fullscreen(true)

//at01 = font_add("at01.ttf",12,false,false,32,128)
at01 = font_add("aseprite.ttf",5,false,false,32,128)
if (font_add_get_enable_aa())
{
    font_add_enable_aa(false);
}

randomize()

//if !instance_exists(oCursor) instance_create_depth(320,180,-999,oCursor)

names = ["Everlee","Mateo","Leanna","Isaias","Blakely","Raylan","Maeve","Bodie","Zoey",
"Jagger","Nancy","Leonel","Daleyza","Trenton","Jovie","Legend","Lyric","Kason","Bridget",
"Zyair","Lennon","Quentin","Mckenzie","Orion","Colette","Braylen","Veronica","Tristan","Genesis",
"Sterling","Adley","Edwin","Havens","Samir","Evie","Luke","Selah","Hayes","Selah",
"Walker","Aubrie","Kingston","Madelyn","Jose","Aarya","Kayson","Alisson","Carl","Daisy"]

weapons = 
{
	fishrod : 
	{
		itemID	: "fishrod",
		name	: "Fishrod",
		type	: 1,
		atk		: 1,
		fishpwr	: 1,
		ammo	: 1,
	},
	pickaxe :
	{
		itemID	: "pickaxe",
		name	: "Pickaxe",
		type	: 2,
		atk		: 2,
		minepwr	: 1,
		ammo	: 1,
	},
	gun:
	{
		itemID	: "gun",
		name	: "Gun",
		type	: 3,
		rAtk	: 4,
		atk		: 1,
		ammo	: 8,
	},
	medkit:
	{
		itemID	: "medkit",
		name	: "Medkit",
		type	: 4,
		atk		: 1,
		healpwr	: 5,
		ammo	: 1,
	},

}
enemies =
{
	zombie:
	{
		enemyID		: "zombie",
		name		: "Zombie",
		type		: "enemy",
		status		: "alive",
		HP			: 10,
		maxHP		: 10,
		//currentHP	: 10,
		atk			: 3,
		drops		: ["nothing","smallCrystal"]
	},
	demon:
	{
		enemyID		: "demon",
		name		: "Demon",
		type		: "enemy",
		status		: "alive",
		HP			: 15,
		maxHP		: 15,
		//currentHP	: 15,
		atk			: 5,
		drops		: ["smallCrystal","smallCrystal","smallCrystal","demonPelt"]
	},
}

levels =
{
	mines: 
	{
		levelID		: "mines",
		name		: "Mines",
		ground		:
		[["nothing","trash","trash","fragCrystal"]],
	},



}


employees = []

for (var i = 0;i < 8;i++)
{
	createEmployee(i)
}
 
