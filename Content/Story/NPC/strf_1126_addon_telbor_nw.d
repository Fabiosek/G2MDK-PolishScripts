
instance STRF_1126_ADDON_TELBOR_NW(NPC_DEFAULT)
{
	name[0] = "Telbor";
	guild = GIL_BAU;
	id = 1126;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fatbald",FACE_B_NORMAL01,BODYTEX_B,itar_prisoner);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1126;
};


func void rtn_start_1126()
{
	ta_rake_fp(0,0,12,0,"NW_FARM2_FIELD_TELBOR");
	ta_rake_fp(12,0,0,0,"NW_FARM2_FIELD_TELBOR");
};

