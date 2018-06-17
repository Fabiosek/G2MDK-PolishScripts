
prototype MST_DEFAULT_GIANT_DESERTRAT(C_NPC)
{
	name[0] = "Pustynny szczur";
	guild = GIL_GIANT_RAT;
	aivar[AIV_MM_REAL_ID] = ID_GIANT_RAT;
	level = 10;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 75;
	attribute[ATR_HITPOINTS] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GIANT_RAT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	aivar[AIV_MM_PACKHUNTER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

func void b_setvisuals_giant_desertrat()
{
	Mdl_SetVisual(self,"Giant_Rat.mds");
	Mdl_SetVisualBody(self,"Giant_DesertRat_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,1.3,1.3,1);
};


instance GIANT_DESERTRAT(MST_DEFAULT_GIANT_DESERTRAT)
{
	b_setvisuals_giant_desertrat();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,1);
};

