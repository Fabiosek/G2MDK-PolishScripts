
prototype MST_DEFAULT_STONEPUMA(C_NPC)
{
	name[0] = "Pantera";
	guild = GIL_GARGOYLE;
	aivar[AIV_MM_REAL_ID] = ID_GARGOYLE;
	level = 20;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GARGOYLE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_SLEEPSTART] = 6;
	aivar[AIV_MM_SLEEPEND] = 20;
	aivar[AIV_MM_ROAMSTART] = 20;
	aivar[AIV_MM_ROAMEND] = 6;
};

func void b_setvisuals_stonepuma()
{
	Mdl_SetVisual(self,"StonePuma.mds");
	Mdl_SetVisualBody(self,"StonePuma_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance STONEPUMA(MST_DEFAULT_STONEPUMA)
{
	b_setvisuals_stonepuma();
	Npc_SetToFistMode(self);
};

