window_set_fullscreen(true)
global.timer = 0
//at01 = font_add("at01.ttf",12,false,false,32,128)
at01 = font_add("aseprite.ttf",5,false,false,32,128)
if (font_add_get_enable_aa())
{
    font_add_enable_aa(false);
}

randomize()

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
	crystalfrag:
	{
		name	: "Crystal Fragment",
		desc	: "",
		invImage: sPlaceholder,
		unlocked: true,
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
	crystalShard:
	{
		name	: "Crystal Shard",
		desc	: "",
		invImage: sPlaceholder,
		unlocked: true,
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
	crystalchunk:
	{
		name	: "Crystal Chunk",
		desc	: "",
		invImage: sPlaceholder,
		unlocked: true,
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
	crystal:
	{
		name	: "Crystal",
		desc	: "",
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
	greatTreeLeaf:
	{
		name	: "Leaf of the Great Tree",
		desc	: "",
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
 

