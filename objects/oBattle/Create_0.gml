team=[0,-1,-1,-1]
validTeam = false
teamMazSize = 4
global.expedition = false
areas = [oSystem.levels.mines,oSystem.levels.forest,oSystem.levels.city,oSystem.levels.fields,oSystem.levels.greatTree,]
area = -1
selectedArea= -1

areaBoxX = 200
areaBoxY = 30
areaBoxW = 100
areaBoxH = 16
areaBoxT = 40

startButtonX = 400
startButtonY = 200
startButtonW = 16
startButtonH = 10



/*for (var i = 0; i<array_length(team);i++)
{
	if oSystem.employees[team[i]].weapon != "none"
	{
		oSystem.employees[team[i]].ammo = variable_clone(struct_get(oSystem.weapons,oSystem.employees[team[i]].weapon).ammo)
	}
}*/

nextEvent = 0
travelTimer = 0
oState = "select"
set = 0
expLog=[]
onscreenMaxText = 30

Timer = 100

levelLootTier = ["common","common","common","common","uncommon","uncommon","uncommon","rare","rare","ultra rare"]

targetSet = false
enemySet = false
enemies = []
enemiesAlive = 0
charsAlive = 0
encounterOver = false

miningOrder = []
crystalHP = 10
crystalIndex = 0
crystalEvent = false

stri = ""

tryPower = 0
lakeType = "normal"
fishTier = ["common","common","common","common","uncommon","uncommon","uncommon","rare","rare","ultra rare"]
fishers = []
miners = []
charindex = 0
expEnd = false
battleOrder = []

for (var i = 0; i<array_length(team);i++)
{
	if team[i] != -1
	{	
		if  struct_get(oSystem.weapons,oSystem.employees[team[i]].weapon).type = 1
		{
			fishers[array_length(fishers)] = team[i]
		}
	}
}

for (var i = 0; i<array_length(team);i++)
{
	if team[i] != -1
	{
		if  struct_get(oSystem.weapons,oSystem.employees[team[i]].weapon).type = 1
		{
			miners[array_length(miners)] = team[i]
		}
	}
}