
prototype MST_DEFAULT_UNDEADORCWARRIOR(C_NPC)
{
	name[0] = "Ork-o¿ywieniec";
	guild = GIL_UNDEADORC;
	aivar[AIV_MM_REAL_ID] = ID_UNDEADORCWARRIOR;
	level = 40;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 0;
	hitchance[NPC_TALENT_1H] = 80;
	hitchance[NPC_TALENT_2H] = 80;
	hitchance[NPC_TALENT_BOW] = 80;
	hitchance[NPC_TALENT_CROSSBOW] = 80;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
};

func void b_setvisuals_undeadorcwarrior()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOW_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance UNDEADORCWARRIOR(MST_DEFAULT_UNDEADORCWARRIOR)
{
	b_setvisuals_undeadorcwarrior();
	EquipItem(self,itmw_2h_orcaxe_02);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

