
prototype MST_DEFAULT_SHADOWBEAST_ADDON_FIRE(C_NPC)
{
	name[0] = "Ognisty demon";
	guild = GIL_GARGOYLE;
	aivar[AIV_MM_REAL_ID] = ID_GARGOYLE;
	level = 30;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 75;
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

func void b_setvisuals_shadowbeast_fire()
{
	Mdl_SetVisual(self,"FireShadow.mds");
	Mdl_SetVisualBody(self,"Shadowbeast_Skeleton_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SHADOWBEAST_ADDON_FIRE(MST_DEFAULT_SHADOWBEAST_ADDON_FIRE)
{
	b_setvisuals_shadowbeast_fire();
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_FIREARMOR";
};

instance SHADOWBEAST_ADDON_FIRE_CANYONLIB(MST_DEFAULT_SHADOWBEAST_ADDON_FIRE)
{
	b_setvisuals_shadowbeast_fire();
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_GHOST;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	aivar[AIV_MAXDISTTOWP] = 900;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_GARGOYLE;
	effect = "SPELLFX_FIREARMOR";
};

