
prototype MST_DEFAULT_SCAVENGER(C_NPC)
{
	name[0] = "Œcierwojad";
	guild = GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID] = ID_SCAVENGER;
	level = 7;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_HITPOINTS_MAX] = 70;
	attribute[ATR_HITPOINTS] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 35;
	protection[PROT_EDGE] = 35;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 35;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_SLEEPSTART] = 22;
	aivar[AIV_MM_SLEEPEND] = 6;
	aivar[AIV_MM_EATGROUNDSTART] = 6;
	aivar[AIV_MM_EATGROUNDEND] = 22;
};

func void b_setvisuals_scavenger()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_SetVisualBody(self,"Sca_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SCAVENGER(MST_DEFAULT_SCAVENGER)
{
	b_setvisuals_scavenger();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,1);
};

