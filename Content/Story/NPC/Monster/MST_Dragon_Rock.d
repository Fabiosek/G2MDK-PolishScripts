
prototype MST_DEFAULT_DRAGON_ROCK(C_NPC)
{
	name[0] = "Kamienny smok";
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_ROCK;
	level = 400;
	bodystateinterruptableoverride = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 160;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 160;
	protection[PROT_FLY] = 160;
	protection[PROT_MAGIC] = 160;
	damagetype = DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_FIRE] = 139;
	damage[DAM_INDEX_FLY] = 1;
	fight_tactic = FAI_DRAGON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	aivar[AIV_MAXDISTTOWP] = 1000;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_DRAGON;
	start_aistate = zs_mm_rtn_dragonrest;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_dragon_rock()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_Rock_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DRAGON_ROCK(MST_DEFAULT_DRAGON_ROCK)
{
	name[0] = "Pedrakhan";
	flags = NPC_FLAG_IMMORTAL;
	b_setvisuals_dragon_rock();
	Npc_SetToFistMode(self);
};

