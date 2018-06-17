
instance STRF_1125_ADDON_TONAK_NW(NPC_DEFAULT)
{
	name[0] = "Tonak";
	guild = GIL_OUT;
	id = 1125;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_B_NORMAL01,BODYTEX_B,itar_prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1125;
};


func void rtn_start_1125()
{
	ta_rake_fp(0,0,12,0,"NW_FARM2_FIELD_TANOK");
	ta_rake_fp(12,0,0,0,"NW_FARM2_FIELD_TANOK");
};

