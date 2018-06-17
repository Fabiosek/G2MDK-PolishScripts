
instance STRF_1124_ADDON_MONTY_NW(NPC_DEFAULT)
{
	name[0] = "Monty";
	guild = GIL_VLK;
	id = 1124;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_IGNORESARMOR] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMALBART04,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1124;
};


func void rtn_start_1124()
{
	ta_read_bookstand(0,0,12,0,"NW_CITY_HABOUR_WERFT_IN_01");
	ta_read_bookstand(12,0,0,0,"NW_CITY_HABOUR_WERFT_IN_01");
};

