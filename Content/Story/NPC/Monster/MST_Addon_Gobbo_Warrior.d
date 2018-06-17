
prototype MST_DEFAULT_GOBBO_WARRIOR(C_NPC)
{
	name[0] = "Gobliñski wojownik";
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_BLACK;
	level = 15;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 75;
	attribute[ATR_HITPOINTS] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	aivar[AIV_MM_PACKHUNTER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_gobbo_warrior()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",2,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_gobbo_warrior_visir()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",3,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance GOBBO_WARRIOR(MST_DEFAULT_GOBBO_WARRIOR)
{
	b_setvisuals_gobbo_warrior();
	Npc_SetToFightMode(self,itmw_1h_misc_sword);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};

instance GOBBO_WARRIOR_VISIR(MST_DEFAULT_GOBBO_WARRIOR)
{
	b_setvisuals_gobbo_warrior_visir();
	Npc_SetToFightMode(self,itmw_1h_misc_axe);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};

