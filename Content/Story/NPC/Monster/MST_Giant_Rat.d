
prototype MST_DEFAULT_GIANT_RAT(C_NPC)
{
	name[0] = "Olbrzymi szczur";
	guild = GIL_GIANT_RAT;
	aivar[AIV_MM_REAL_ID] = ID_GIANT_RAT;
	level = 3;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_HITPOINTS_MAX] = 30;
	attribute[ATR_HITPOINTS] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 15;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 15;
	protection[PROT_FLY] = 15;
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

func void b_setvisuals_giant_rat()
{
	Mdl_SetVisual(self,"Giant_Rat.mds");
	Mdl_SetVisualBody(self,"Giant_Rat_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance GIANT_RAT(MST_DEFAULT_GIANT_RAT)
{
	b_setvisuals_giant_rat();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,1);
};

instance YGIANT_RAT(MST_DEFAULT_GIANT_RAT)
{
	name[0] = "M³ody olbrzymi szczur";
	level = 3;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 5;
	protection[PROT_EDGE] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_FLY] = 5;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_MONSTER_COWARD;
	b_setvisuals_giant_rat();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,1);
};

