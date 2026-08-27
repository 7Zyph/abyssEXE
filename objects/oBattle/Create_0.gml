team[0]=oSystem.employees[0].employeeId
team[3]=oSystem.employees[1].employeeId
team[2]=oSystem.employees[2].employeeId
team[1]=oSystem.employees[3].employeeId

for (var i = 0; i<array_length(team);i++)
{
	if oSystem.employees[team[i]].weapon != "none"
	{
		oSystem.employees[team[i]].ammo = variable_clone(struct_get(oSystem.weapons,oSystem.employees[team[i]].weapon).ammo)
	}
}

nextEvent = 0
travelTimer = 0
oState = "start"
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
	if  struct_get(oSystem.weapons,oSystem.employees[team[i]].weapon).type = 1
	{
		fishers[array_length(fishers)] = team[i]
	}
}

for (var i = 0; i<array_length(team);i++)
{
	if  struct_get(oSystem.weapons,oSystem.employees[team[i]].weapon).type = 1
	{
		miners[array_length(miners)] = team[i]
	}
}