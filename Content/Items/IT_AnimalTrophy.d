
const int VALUE_BCKOPF = 50;
const int VALUE_MEATBUGFLESH = 10;
const int VALUE_SHEEPFUR = 10;
const int VALUE_WOLFFUR = 10;
const int VALUE_BUGMANDIBLES = 15;
const int VALUE_CLAW = 15;
const int VALUE_LURKERCLAW = 15;
const int VALUE_TEETH = 15;
const int VALUE_CRAWLERMANDIBLES = 15;
const int VALUE_WING = 20;
const int VALUE_STING = 25;
const int VALUE_REPTILESKIN = 25;
const int VALUE_WARGFUR = 25;
const int VALUE_DRGSNAPPERHORN = 100;
const int VALUE_CRAWLERPLATE = 50;
const int VALUE_SHADOWFUR = 250;
const int VALUE_SHARKSKIN = 200;
const int VALUE_TROLLFUR = 300;
const int VALUE_WARANFIRETONGUE = 300;
const int VALUE_SHADOWHORN = 300;
const int VALUE_SHARKTEETH = 300;
const int VALUE_TROLLTOOTH = 300;
const int VALUE_TROLLBLACKFUR = 350;
const int VALUE_GOBLINBONE = 10;
const int VALUE_SKELETONBONE = 10;
const int VALUE_DEMONHEART = 300;
const int VALUE_STONEGOLEMHEART = 300;
const int VALUE_FIREGOLEMHEART = 300;
const int VALUE_ICEGOLEMHEART = 300;
const int VALUE_UNDEADDRAGONSOULSTONE = 400;
const int VALUE_ICEDRAGONHEART = 400;
const int VALUE_FIREDRAGONHEART = 400;
const int VALUE_SWAMPDRAGONHEART = 400;
const int VALUE_ROCKDRAGONHEART = 400;
const int VALUE_DRAGONBLOOD = 200;
const int VALUE_DRAGONSCALE = 200;
const int VALUE_KEILERFUR = 15;

instance ITAT_ADDON_BCKOPF(C_ITEM)
{
	name = "G³owa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BCKOPF;
	visual = "ItAt_Blattcrawler_01.3DS";
	material = MAT_LEATHER;
	description = "G³owa polnego pe³zacza";
	text[0] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_MEATBUGFLESH(C_ITEM)
{
	name = "Owadzie miêso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MEATBUGFLESH;
	visual = "ItAt_Meatbugflesh.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_meatbugflesh;
	description = name;
	text[0] = "";
	text[1] = NAME_BONUS_HP;
	count[1] = 10;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_meatbugflesh()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,10);
};


instance ITAT_SHEEPFUR(C_ITEM)
{
	name = "Owcza skóra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHEEPFUR;
	visual = "ItAt_SheepFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_WOLFFUR(C_ITEM)
{
	name = "Skóra wilka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WOLFFUR;
	visual = "ItAt_WolfFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_BUGMANDIBLES(C_ITEM)
{
	name = "¯uwaczki polnej bestii";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BUGMANDIBLES;
	visual = "ItAt_BugMandibles.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_CLAW(C_ITEM)
{
	name = "Pazury";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_CLAW;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_LURKERCLAW(C_ITEM)
{
	name = "Pazur topielca";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_LURKERCLAW;
	visual = "ItAt_LurkerClaw.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TEETH(C_ITEM)
{
	name = "K³y";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TEETH;
	visual = "ItAt_Teeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_CRAWLERMANDIBLES(C_ITEM)
{
	name = "¯uwaczki pe³zacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_CRAWLERMANDIBLES;
	visual = "ItAt_CrawlerMandibles.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_mandibles;
	description = name;
	text[0] = "Mo¿na je otworzyæ w celu";
	text[1] = "wypicia zawartej w nich wydzieliny,";
	text[2] = "która pozwala zregenerowaæ manê.";
	text[3] = "Efekt z czasem przemija.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_mandibles()
{
	if(MANDIBLES_BONUS <= 9)
	{
		Npc_ChangeAttribute(self,ATR_MANA,self.attribute[ATR_MANA_MAX]);
		MANDIBLES_BONUS = MANDIBLES_BONUS + 1;
	}
	else
	{
		PrintScreen(PRINT_MANDIBLES,-1,YPOS_LEVELUP,FONT_SCREENSMALL,2);
	};
};


instance ITAT_WING(C_ITEM)
{
	name = "Skrzyd³a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WING;
	visual = "ItAt_Wing.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_STING(C_ITEM)
{
	name = "¯¹d³o";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_STING;
	scemename = "FOOD";
	on_state[0] = use_sting;
	visual = "ItAt_Sting.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "Zawiera";
	text[2] = "truj¹c¹ wydzielinê.";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_sting()
{
	if(KNOWS_BLOODFLY == TRUE)
	{
		if(BLOODFLY_BONUS <= 10)
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
			Print(PRINT_FULLYHEALED);
			BLOODFLY_BONUS = BLOODFLY_BONUS + 1;
		}
		else
		{
			Print(PRINT_MANDIBLES);
		};
	}
	else
	{
		Print(PRINT_BLOODFLY);
		if(self.attribute[ATR_HITPOINTS] > 1)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 1;
		};
	};
};


instance ITAT_LURKERSKIN(C_ITEM)
{
	name = "Skóra topielca";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_REPTILESKIN;
	visual = "ItAt_LurkerSkin.3DS";
	material = MAT_LEATHER;
	description = "Skóra topielca";
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_WARGFUR(C_ITEM)
{
	name = "Skóra warga";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WARGFUR;
	visual = "ItAt_WargFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_ADDON_KEILERFUR(C_ITEM)
{
	name = "Skóra dzika";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_KEILERFUR;
	visual = "ItAt_WargFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_DRGSNAPPERHORN(C_ITEM)
{
	name = "Róg smoczego zêbacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DRGSNAPPERHORN;
	visual = "ItAt_DrgSnapperHorn.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_CRAWLERPLATE(C_ITEM)
{
	name = "P³yty pancerza pe³zacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_CRAWLERPLATE;
	visual = "ItAt_CrawlerPlate.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SHADOWFUR(C_ITEM)
{
	name = "Skóra cieniostwora";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHADOWFUR;
	visual = "ItAt_ShadowFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SHARKSKIN(C_ITEM)
{
	name = "Skóra b³otnego wê¿a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHARKSKIN;
	visual = "ItAt_SharkSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TROLLFUR(C_ITEM)
{
	name = "Skóra trolla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TROLLFUR;
	visual = "ItAt_TrollFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TROLLBLACKFUR(C_ITEM)
{
	name = "Skóra czarnego trolla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TROLLBLACKFUR;
	visual = "ItAt_TrollFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_WARANFIRETONGUE(C_ITEM)
{
	name = "Jêzyk ognistego jaszczura";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WARANFIRETONGUE;
	visual = "ItAt_WaranFiretongue.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SHADOWHORN(C_ITEM)
{
	name = "Róg cieniostwora";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHADOWHORN;
	visual = "ItAt_ShadowHorn.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SHARKTEETH(C_ITEM)
{
	name = "K³y b³otnego wê¿a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHARKTEETH;
	visual = "ItAt_SharkTeeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TROLLTOOTH(C_ITEM)
{
	name = "Kie³ trolla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TROLLTOOTH;
	visual = "ItAt_TrollTooth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

instance ITAT_STONEGOLEMHEART(C_ITEM)
{
	name = "Serce kamiennego golema";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_STONEGOLEMHEART;
	visual = "ItAt_StoneGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_FIREGOLEMHEART(C_ITEM)
{
	name = "Serce ognistego golema";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_FIREGOLEMHEART;
	visual = "ItAt_FireGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_ICEGOLEMHEART(C_ITEM)
{
	name = "Serce lodowego golema";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ICEGOLEMHEART;
	visual = "ItAt_IceGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_GOBLINBONE(C_ITEM)
{
	name = "Koœæ goblina";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOBLINBONE;
	visual = "ItAt_GoblinBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SKELETONBONE(C_ITEM)
{
	name = "Koœæ szkieletu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SKELETONBONE;
	visual = "ItAt_SkeletonBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_DEMONHEART(C_ITEM)
{
	name = "Serce demona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DEMONHEART;
	visual = "ItAt_DemonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_UNDEADDRAGONSOULSTONE(C_ITEM)
{
	name = "Kamieñ duszy smoka-o¿ywieñca";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_UNDEADDRAGONSOULSTONE;
	visual = "ItAt_UndeadDragonSoulStone.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITAT_ICEDRAGONHEART(C_ITEM)
{
	name = "Serce lodowego smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ICEDRAGONHEART;
	visual = "ItAt_IcedragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_ROCKDRAGONHEART(C_ITEM)
{
	name = "Serce kamiennego smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ROCKDRAGONHEART;
	visual = "ItAt_RockdragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SWAMPDRAGONHEART(C_ITEM)
{
	name = "Serce b³otnego smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SWAMPDRAGONHEART;
	visual = "ItAt_SwampdragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_FIREDRAGONHEART(C_ITEM)
{
	name = "Serce ognistego smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_FIREDRAGONHEART;
	visual = "ItAt_FiredragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_DRAGONBLOOD(C_ITEM)
{
	name = "Smocza krew";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_DRAGONBLOOD;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITAT_DRAGONSCALE(C_ITEM)
{
	name = "Smocze ³uski";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DRAGONSCALE;
	visual = "ItAt_DragonScale.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

