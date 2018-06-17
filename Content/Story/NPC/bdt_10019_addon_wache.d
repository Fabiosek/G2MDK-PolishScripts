
instance BDT_10019_ADDON_WACHE(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_GUARD;
	guild = GIL_BDT;
	id = 10019;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_krummschwert);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_NORMAL_SPASSVOGEL,BODYTEX_N,itar_thorus_addon);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10019;
};


func void rtn_start_10019()
{
	ta_stand_wp(0,0,12,0,"BL_UP_PLACE_04 ");
	ta_stand_wp(12,0,0,0,"BL_UP_PLACE_04");
};

