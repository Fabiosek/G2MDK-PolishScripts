
prototype MST_DEFAULT_WARAN(C_NPC)
{
	name[0] = "Jaszczur";
	guild = GIL_WARAN;
	aivar[AIV_MM_REAL_ID] = ID_WARAN;
	level = 12;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WARAN;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

func void b_setvisuals_waran()
{
	Mdl_SetVisual(self,"Waran.mds");
	Mdl_SetVisualBody(self,"War_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance WARAN(MST_DEFAULT_WARAN)
{
	b_setvisuals_waran();
	Npc_SetToFistMode(self);
};

instance BEACHWARAN1(MST_DEFAULT_WARAN)
{
	b_setvisuals_waran();
	Npc_SetToFistMode(self);
};

instance BEACHWARAN2(MST_DEFAULT_WARAN)
{
	b_setvisuals_waran();
	Npc_SetToFistMode(self);
};

