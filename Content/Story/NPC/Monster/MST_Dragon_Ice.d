
prototype MST_DEFAULT_DRAGON_ICE(C_NPC)
{
	name[0] = "Lodowy smok";
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_ICE;
	level = 600;
	bodystateinterruptableoverride = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 180;
	protection[PROT_EDGE] = 180;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 180;
	protection[PROT_FLY] = 180;
	protection[PROT_MAGIC] = 180;
	damagetype = DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_FIRE] = 159;
	damage[DAM_INDEX_FLY] = 1;
	fight_tactic = FAI_DRAGON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	aivar[AIV_MAXDISTTOWP] = 10000;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_DRAGON;
	start_aistate = zs_mm_rtn_dragonrest;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_dragon_ice()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_Ice_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DRAGON_ICE(MST_DEFAULT_DRAGON_ICE)
{
	name[0] = "Finkregh";
	flags = NPC_FLAG_IMMORTAL;
	b_setvisuals_dragon_ice();
	Npc_SetToFistMode(self);
};

