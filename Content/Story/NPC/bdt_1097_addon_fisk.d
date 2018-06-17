
instance BDT_1097_ADDON_FISK(NPC_DEFAULT)
{
	name[0] = "Fisk";
	guild = GIL_BDT;
	id = 1097;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_CAVALORN,BODYTEX_B,itar_diego);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_prestart_1097;
};


func void rtn_prestart_1097()
{
	ta_stand_wp(8,0,20,0,"BL_MID_05");
	ta_stand_wp(20,0,8,0,"BL_MID_05");
};

func void rtn_start_1097()
{
	ta_stand_guarding(8,0,20,0,"BL_MERCHANT_01");
	ta_stand_guarding(20,0,8,0,"BL_MERCHANT_01");
};

func void rtn_meeting_1097()
{
	ta_stand_guarding(8,0,20,0,"BL_INN_UP_06");
	ta_stand_guarding(20,0,8,0,"BL_INN_UP_06");
};

func void rtn_ambush_1097()
{
	ta_stand_wp(8,0,20,0,"BL_INN_07");
	ta_stand_wp(20,0,8,0,"BL_INN_07");
};

