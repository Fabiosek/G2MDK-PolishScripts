
prototype MST_DEFAULT_FIREGOLEM(C_NPC)
{
	name[0] = "Ognisty golem";
	guild = GIL_FIREGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_FIREGOLEM;
	level = 40;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 150;
	damagetype = DAM_FLY;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_firegolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Firegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Fire_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance FIREGOLEM(MST_DEFAULT_FIREGOLEM)
{
	b_setvisuals_firegolem();
	Npc_SetToFistMode(self);
};

