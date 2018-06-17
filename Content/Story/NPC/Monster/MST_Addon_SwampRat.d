
prototype MST_DEFAULT_SWAMPRAT(C_NPC)
{
	name[0] = "Bagienny szczur";
	guild = GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID] = ID_SWAMPRAT;
	level = 12;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 60;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MOLERAT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

func void b_setvisuals_swamprat()
{
	Mdl_SetVisual(self,"Swamprat.mds");
	Mdl_SetVisualBody(self,"Swamprat_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SWAMPRAT(MST_DEFAULT_SWAMPRAT)
{
	b_setvisuals_swamprat();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,2);
};

