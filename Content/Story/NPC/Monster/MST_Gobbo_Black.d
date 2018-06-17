
prototype MST_DEFAULT_GOBBO_BLACK(C_NPC)
{
	name[0] = "Czarny goblin";
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_BLACK;
	level = 8;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
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

func void b_setvisuals_gobbo_black()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance GOBBO_BLACK(MST_DEFAULT_GOBBO_BLACK)
{
	b_setvisuals_gobbo_black();
	Npc_SetToFightMode(self,itmw_1h_bau_mace);
};

instance GOBBO_DARONSSTATUENKLAUER(MST_DEFAULT_GOBBO_BLACK)
{
	b_setvisuals_gobbo_black();
	CreateInvItems(self,itmi_lostinnosstatue_daron,1);
	Npc_SetToFightMode(self,itmw_1h_bau_mace);
};

