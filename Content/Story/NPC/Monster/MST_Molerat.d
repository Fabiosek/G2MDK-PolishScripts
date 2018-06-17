
prototype MST_DEFAULT_MOLERAT(C_NPC)
{
	name[0] = "Kretoszczur";
	guild = GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID] = ID_MOLERAT;
	level = 5;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 25;
	protection[PROT_EDGE] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 25;
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

func void b_setvisuals_molerat()
{
	Mdl_SetVisual(self,"Molerat.mds");
	Mdl_SetVisualBody(self,"Mol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance MOLERAT(MST_DEFAULT_MOLERAT)
{
	b_setvisuals_molerat();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,1);
};

