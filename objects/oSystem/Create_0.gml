window_set_fullscreen(true)
global.timer = 0
global.movingWindow = noone
//at01 = font_add("at01.ttf",12,false,false,32,128)
at01 = font_add("aseprite.ttf",5,false,false,32,128)
if (font_add_get_enable_aa())
{
    font_add_enable_aa(false);
}

randomize()

global.onMessage = false
global.money = 9999999
currentWindow = "desktop"
apps= 
{
	
	desktop:
	{
		status:"closed"
	},
	expedition:
	{
		posX : 16,
		posY : 16,
		name : "Expedition.exe",
		window: "expedition",
		status: "closed",
		desktopIcon: sExpeditionDesktopIcon,
		taskbarIcon: sExpeditionTaskbarIcon,
		
	},
		teamapp:
	{
		posX : 16,
		posY : 48,
		name : "Teams.exe",
		window: "teamapp",
		status: "closed",
		desktopIcon: sExpeditionDesktopIcon,
		taskbarIcon: sTeamTaskbarIcon,
	},
		stockmarket:
	{
		posX : 16,
		posY : 80,
		name : "Stock_Market.exe",
		window: "stockmarket",
		status: "closed",
		desktopIcon: sExpeditionDesktopIcon,
		taskbarIcon: sStockTaskbarIcon,
	}
	
	
}

colors = [c_white,c_red,c_yellow,c_black]
//if !instance_exists(oCursor) instance_create_depth(320,180,-999,oCursor)

names = ["Everlee","Mateo","Leanna","Isaias","Blakely","Raylan","Maeve","Bodie","Zoey",
"Jagger","Nancy","Leonel","Daleyza","Trenton","Jovie","Legend","Lyric","Kason","Bridget",
"Zyair","Lennon","Quentin","Mckenzie","Orion","Colette","Braylen","Veronica","Tristan","Genesis",
"Sterling","Adley","Edwin","Havens","Samir","Evie","Luke","Selah","Hayes","Selah",
"Walker","Aubrie","Kingston","Madelyn","Jose","Aarya","Kayson","Alisson","Carl","Daisy"]


stckTimer = 0
stckBuyTimer = 0

items = 
{
	trash:
	{
		name	: "Trash",
		desc	: "Trash, does not hold much value",
		unlocked: false,
		stck	: 0,
		qtd		: 0,
		price	: 5
	},
	demonPelt:
	{
		name	: "Demon Pelt",
		desc	: "The skin of a common abyss creature",
		unlocked: false,
		stck	: 0,
		qtd		: 0,
		price	: 20
	},
	crystalfrag:
	{
		name	: "Crystal fragment",
		desc	: "Shattered piece of an abyss crystal",
		invImage: sPlaceholder,
		unlocked: true,
		qtd		: 0,
		stckbase: 1000,
		stck	: 1000,
		price	: 50,
		minValue: 10,
		maxValue: 100,
		chance	: 1,
		vol		: 10,
		history : []
	},
	crystalShard:
	{
		name	: "Crystal Shard",
		desc	: "Broken piece of an abyss crystal",
		invImage: sPlaceholder,
		unlocked: true,
		qtd		: 0,
		stckbase: 1000,
		stck	: 1000,
		price	: 50,
		minValue: 10,
		maxValue: 100,
		chance	: 1,
		vol		: 10,
		history : []
	},
	crystalchunk:
	{
		name	: "Crystal Chunk",
		desc	: "Big",
		invImage: sPlaceholder,
		unlocked: true,
		qtd		: 0,
		stckbase: 1000,
		stck	: 1000,
		price	: 50,
		minValue: 10,
		maxValue: 100,
		chance	: 1,
		vol		: 10,
		history : []
	},
	crystal:
	{
		name	: "Crystal",
		desc	: "A whole abyss crystal in great conditions",
		invImage: sPlaceholder,
		unlocked: false,
		qtd		: 0,
		stckbase: 1000,
		stck	: 1000,
		price	: 50,
		minValue: 10,
		maxValue: 100,
		chance	: 1,
		vol		: 10,
		history : []
	},
	greatTreeLeaf:
	{
		name	: "Leaf of the Great Tree",
		desc	: "The greatest and purest form of an abyss crystall",
		invImage: sPlaceholder,
		unlocked: false,
		qtd		: 0,
		stckbase: 100,
		stck	: 100,
		price	: 50,
		minValue: 10,
		maxValue: 100,
		chance	: 1,
		vol		: 10,
		history : []
	},
}
stckItems= [items.crystalfrag,items.crystalShard,items.crystalchunk,items.crystal,items.greatTreeLeaf]


weapons = 
{
		unarmed : 
	{
		itemID	: "unarmed",
		name	: "Unarmed",
		tier	: 1,
		qtd		: 1,
		type	: 0,
		atk		: 1,
		ammo	: 1,
	},
	fishrod : 
	{
		itemID	: "fishrod",
		name	: "Fishrod",
		qtd		: 1,
		type	: 1,
		atk		: 1,
		fishpwr	: 1,
		ammo	: 1,
	},
	pickaxe :
	{
		itemID	: "pickaxe",
		name	: "Pickaxe",
		qtd		: 1,
		type	: 2,
		atk		: 2,
		minepwr	: 1,
		ammo	: 1,
	},
	gun:
	{
		itemID	: "gun",
		name	: "Gun",
		qtd		: 2,
		type	: 3,
		rAtk	: 4,
		atk		: 1,
		ammo	: 8,
	},
	medkit:
	{
		itemID	: "medkit",
		name	: "Medkit",
		qtd		: 1,
		type	: 4,
		atk		: 1,
		healpwr	: 5,
		ammo	: 1,
	},

}
weaponsList = [weapons.fishrod,weapons.gun,weapons.medkit,weapons.pickaxe, weapons.unarmed]
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
		drops		: [-1,oSystem.items.crystalfrag]
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
		drops		: [oSystem.items.crystalfrag,oSystem.items.crystalfrag,oSystem.items.crystalfrag,oSystem.items.demonPelt]
	},
}
enemies_list = [enemies.zombie,enemies.demon]

levels =
{
	mines: 
	{
		name		: "Mines",
		desc		: "",
		unlocked	: true,
		next		: "forest",
		eventPool	: ["item","crystal","encounter","exit"],
		groundItems	:
		[[-1,oSystem.items.trash,oSystem.items.trash,oSystem.items.crystalfrag]],
		enemiesPool:[oSystem.enemies.zombie,oSystem.enemies.zombie,oSystem.enemies.zombie,oSystem.enemies.demon],
	},
	forest: 
	{
		name		: "Forest",
		desc		: "",
		unlocked	: true,
		next		: "city",
		eventPool	: ["item","crystal","encounter","exit"],
		groundItems	:
		[[-1,oSystem.items.trash,oSystem.items.trash,oSystem.items.crystalfrag]],
		enemiesPool:[oSystem.enemies.zombie,oSystem.enemies.zombie,oSystem.enemies.zombie,oSystem.enemies.demon],
	},
	city: 
	{
		name		: "Forest",
		desc		: "",
		unlocked	: true,
		next		: "fields",
		eventPool	: ["item","crystal","encounter","exit"],
		groundItems	:
		[[-1,oSystem.items.trash,oSystem.items.trash,oSystem.items.crystalfrag]],
		enemiesPool:[oSystem.enemies.zombie,oSystem.enemies.zombie,oSystem.enemies.zombie,oSystem.enemies.demon],
	},
	fields: 
	{
		name		: "Forest",
		desc		: "",
		unlocked	: true,
		next		: "greatTree",
		eventPool	: ["item","crystal","encounter","exit"],
		groundItems	:
		[[-1,oSystem.items.trash,oSystem.items.trash,oSystem.items.crystalfrag]],
		enemiesPool:[oSystem.enemies.zombie,oSystem.enemies.zombie,oSystem.enemies.zombie,oSystem.enemies.demon],
	},
	greatTree: 
	{
		name		: "The Great Tree",
		desc		: "",
		unlocked	: true,
		next		: "forest",
		eventPool	: ["item","crystal","encounter","exit"],
		groundItems	:
		[[-1,oSystem.items.trash,oSystem.items.trash,oSystem.items.crystalfrag]],
		enemiesPool:[oSystem.enemies.zombie,oSystem.enemies.zombie,oSystem.enemies.zombie,oSystem.enemies.demon],
	},



}




employees = []

for (var i = 0;i < 8;i++)
{
	createEmployee(i)
}
 

