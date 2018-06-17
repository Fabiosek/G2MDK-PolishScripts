
prototype MST_DEFAULT_SWAMPSHARK(C_NPC)
{
	name[0] = "W¹¿ b³otny";
	guild = GIL_SWAMPSHARK;
	aivar[AIV_MM_REAL_ID] = ID_SWAMPSHARK;
	level = 24;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 240;
	attribute[ATR_HITPOINTS] = 240;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SWAMPSHARK;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

func void b_setvisuals_swampshark()
{
	Mdl_SetVisual(self,"Swampshark.mds");
	Mdl_SetVisualBody(self,"Swa_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SWAMPSHARK(MST_DEFAULT_SWAMPSHARK)
{
	b_setvisuals_swampshark();
	Npc_SetToFistMode(self);
};

instance MIS_ADDON_SWAMPSHARK_01(MST_DEFAULT_SWAMPSHARK)
{
	level = 20;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	b_setvisuals_swampshark();
	Npc_SetToFistMode(self);
};

instance MIS_ADDON_SWAMPSHARK_02(MST_DEFAULT_SWAMPSHARK)
{
	level = 20;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	b_setvisuals_swampshark();
	Npc_SetToFistMode(self);
};

instance MIS_ADDON_SWAMPSHARK_03(MST_DEFAULT_SWAMPSHARK)
{
	level = 20;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	b_setvisuals_swampshark();
	Npc_SetToFistMode(self);
};

instance MIS_ADDON_SWAMPSHARK_LOU(MST_DEFAULT_SWAMPSHARK)
{
	b_setvisuals_swampshark();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itke_addon_tavern_01,1);
};

