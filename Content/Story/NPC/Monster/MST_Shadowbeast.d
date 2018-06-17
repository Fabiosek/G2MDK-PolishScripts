
prototype MST_DEFAULT_SHADOWBEAST(C_NPC)
{
	name[0] = "Cieniostwór";
	guild = GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID] = ID_SHADOWBEAST;
	level = 30;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 125;
	protection[PROT_FLY] = 125;
	protection[PROT_MAGIC] = 20;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
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

func void b_setvisuals_shadowbeast()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Sha_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SHADOWBEAST(MST_DEFAULT_SHADOWBEAST)
{
	b_setvisuals_shadowbeast();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,2);
};

instance BEACHSHADOWBEAST1(MST_DEFAULT_SHADOWBEAST)
{
	b_setvisuals_shadowbeast();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,2);
};

