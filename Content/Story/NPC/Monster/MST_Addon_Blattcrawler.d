
prototype MST_DEFAULT_BLATTCRAWLER(C_NPC)
{
	name[0] = "Polny pe³zacz";
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_BLATTCRAWLER;
	level = 15;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 75;
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

func void b_setvisuals_blattcrawler()
{
	Mdl_SetVisual(self,"Blattcrawler.mds");
	Mdl_SetVisualBody(self,"BlattCrawler_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance BLATTCRAWLER(MST_DEFAULT_BLATTCRAWLER)
{
	b_setvisuals_blattcrawler();
	Npc_SetToFistMode(self);
};

