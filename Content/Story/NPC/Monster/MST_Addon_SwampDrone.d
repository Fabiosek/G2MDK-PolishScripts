
prototype MST_DEFAULT_SWAMPDRONE(C_NPC)
{
	name[0] = "Bagienny truteñ";
	guild = GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID] = ID_SWAMPDRONE;
	level = 10;
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
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	aivar[AIV_MM_PACKHUNTER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_WUSELSTART] = ONLYROUTINE;
};

func void b_setvisuals_swampdrone()
{
	Mdl_SetVisual(self,"SwampDrone.mds");
	Mdl_SetVisualBody(self,"SwampDrone_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SWAMPDRONE(MST_DEFAULT_SWAMPDRONE)
{
	b_setvisuals_swampdrone();
	Npc_SetToFistMode(self);
};

