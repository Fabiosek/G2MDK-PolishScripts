
prototype MST_DEFAULT_ICEWOLF(C_NPC)
{
	name[0] = "Lodowy wilk";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_ICEWOLF;
	level = 15;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	aivar[AIV_MM_PACKHUNTER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

func void b_setvisuals_icewolf()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"SnoWol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance ICEWOLF(MST_DEFAULT_ICEWOLF)
{
	b_setvisuals_icewolf();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,1);
};

