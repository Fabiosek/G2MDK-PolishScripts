
instance STRF_1127_ADDON_PARDOS_NW(NPC_DEFAULT)
{
	name[0] = "Pardos";
	guild = GIL_OUT;
	id = 1127;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_ASGHAN,BODYTEX_N,itar_prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1127;
};


func void rtn_start_1127()
{
	ta_sit_throne(0,0,12,0,"NW_FARM3_HOUSE_IN_NAVI_2");
	ta_sit_throne(12,0,0,0,"NW_FARM3_HOUSE_IN_NAVI_2");
};

