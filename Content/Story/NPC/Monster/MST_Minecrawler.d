
prototype MST_DEFAULT_MINECRAWLER(C_NPC)
{
	name[0] = "Pe³zacz";
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_MINECRAWLER;
	level = 12;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 60;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_WUSELSTART] = ONLYROUTINE;
};

func void b_setvisuals_minecrawler()
{
	Mdl_SetVisual(self,"Crawler.mds");
	Mdl_SetVisualBody(self,"Crw_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance MINECRAWLER(MST_DEFAULT_MINECRAWLER)
{
	b_setvisuals_minecrawler();
	Npc_SetToFistMode(self);
};

instance MINECRAWLER_PRIEST(MST_DEFAULT_MINECRAWLER)
{
	b_setvisuals_minecrawler();
	Npc_SetToFistMode(self);
};

instance GOLDMINECRAWLER(MST_DEFAULT_MINECRAWLER)
{
	b_setvisuals_minecrawler();
	Npc_SetToFistMode(self);
};

