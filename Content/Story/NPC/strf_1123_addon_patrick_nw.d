
instance STRF_1123_ADDON_PATRICK_NW(NPC_DEFAULT)
{
	name[0] = "Patrick";
	guild = GIL_SLD;
	id = 1123;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_NORMALBART02,BODYTEX_L,itar_sld_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1123;
};


func void rtn_start_1123()
{
	ta_stand_drinking(0,0,12,0,"NW_BIGFARM_PATRICK");
	ta_stand_drinking(12,0,0,0,"NW_BIGFARM_PATRICK");
};

