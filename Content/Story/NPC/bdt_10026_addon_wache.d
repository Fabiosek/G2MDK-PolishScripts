
instance BDT_10026_ADDON_WACHE(NPC_DEFAULT)
{
	name[0] = NAME_WACHE;
	guild = GIL_BDT;
	id = 10026;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL_ERPRESSER,BODYTEX_N,itar_bloodwyn_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10026;
};


func void rtn_start_10026()
{
	ta_stand_eating(6,0,12,0,"ADW_MINE_18");
	ta_stand_eating(12,0,6,0,"ADW_MINE_18");
};

