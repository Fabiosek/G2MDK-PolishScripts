
prototype MST_DEFAULT_ORCSHAMAN(C_NPC)
{
	name[0] = "Ork-szaman";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	voice = 18;
	level = 35;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 350;
	attribute[ATR_HITPOINTS] = 350;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 130;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 65;
	hitchance[NPC_TALENT_1H] = 60;
	hitchance[NPC_TALENT_2H] = 60;
	hitchance[NPC_TALENT_BOW] = 60;
	hitchance[NPC_TALENT_CROSSBOW] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
};

func void b_setvisuals_orcshaman()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,-1);
};


instance ORCSHAMAN_SIT(MST_DEFAULT_ORCSHAMAN)
{
	b_setvisuals_orcshaman();
	EquipItem(self,itmw_2h_orcaxe_01);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ORCSITSTART] = ONLYROUTINE;
};

instance ORCSHAMAN_HOSH_PAK(MST_DEFAULT_ORCSHAMAN)
{
	name[0] = "Hosh-Pak";
	b_setvisuals_orcshaman();
	EquipItem(self,itmw_2h_orcaxe_01);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ORCSITSTART] = ONLYROUTINE;
};

instance ORCSHAMAN_SIT_CANYONLIBRARYKEY(MST_DEFAULT_ORCSHAMAN)
{
	name[0] = "Wódz Hordy";
	b_setvisuals_orcshaman();
	EquipItem(self,itmw_2h_orcaxe_01);
	CreateInvItems(self,itke_canyonlibrary_hierarchy_books_addon,1);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ORCSITSTART] = ONLYROUTINE;
};

