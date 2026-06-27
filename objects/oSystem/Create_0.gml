at01 = font_add("at01.ttf",12,false,false,32,128)
if (font_add_get_enable_aa())
{
    font_add_enable_aa(false);
}

randomize()


names = ["Everlee","Mateo","Leanna","Isaias","Blakely","Raylan","Maeve","Bodie","Zoey",
"Jagger","Nancy","Leonel","Daleyza","Trenton","Jovie","Legend","Lyric","Kason","Bridget",
"Zyair","Lennon","Quentin","Mckenzie","Orion","Colette","Braylen","Veronica","Tristan","Genesis",
"Sterling","Adley","Edwin","Havens","Samir","Evie","Luke","Selah","Hayes","Selah",
"Walker","Aubrie","Kingston","Madelyn","Jose","Aarya","Kayson","Alisson","Carl","Daisy"]



employees = [-1,-1,-1,-1,-1,-1,-1,-1]

for (var i = 0;i < 8;i++)
{
	createEmployee(i)
}
 
