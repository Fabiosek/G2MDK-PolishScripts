
prototype MST_DEFAULT_KEILER(C_NPC)
{
	name[0] = "Dzik";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_KEILER;
	level = 6;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	aivar[AIV_MM_PACKHUNTER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

func void b_setvisuals_keiler()
{
	Mdl_SetVisual(self,"Keiler.mds");
	Mdl_SetVisualBody(self,"Keiler_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance KEILER(MST_DEFAULT_KEILER)
{
	b_setvisuals_keiler();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,1);
};

