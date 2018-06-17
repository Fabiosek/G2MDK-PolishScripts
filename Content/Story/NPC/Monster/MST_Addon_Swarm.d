
prototype MST_DEFAULT_SWARM(C_NPC)
{
	name[0] = "Lataj¹cy rój";
	guild = GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID] = ID_BLOODFLY;
	level = 6;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 60;
	attribute[ATR_HITPOINTS] = 60;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_FLY;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	aivar[AIV_MAXDISTTOWP] = 700;
	aivar[AIV_MM_PACKHUNTER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_WUSELSTART] = ONLYROUTINE;
};

func void b_setvisuals_swarm()
{
	Mdl_SetVisual(self,"Swarm.mds");
	Mdl_SetVisualBody(self,"Irrlicht_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SWARM(MST_DEFAULT_SWARM)
{
	fight_tactic = FAI_BLOODFLY;
	b_setvisuals_swarm();
	Npc_SetToFistMode(self);
};

instance SWARM_DETECTOR(MST_DEFAULT_SWARM)
{
	level = 0;
	npctype = NPCTYPE_MAIN;
	b_setvisuals_swarm();
	senses_range = 3000;
	aivar[AIV_PARTYMEMBER] = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
	Npc_SetToFistMode(self);
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	start_aistate = zs_mm_rtn_summoned;
};

