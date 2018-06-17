
instance PIR_1389_ADDON_TOM(NPC_DEFAULT)
{
	name[0] = "Tom";
	guild = GIL_PIR;
	id = 1389;
	voice = 11;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_elbastardo);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FIGHTER",FACE_N_NORMAL19,BODYTEX_N,itar_pir_l_addon);
	Mdl_SetModelFatness(self,0.75);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1389;
};


func void rtn_start_1389()
{
	ta_stand_wp(9,0,21,0,"ADW_PIRATECAMP_BEACH_15");
	ta_stand_wp(21,0,9,0,"ADW_PIRATECAMP_BEACH_15");
};

