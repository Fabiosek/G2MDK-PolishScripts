
instance BDT_10014_ADDON_THORUS(NPC_DEFAULT)
{
	name[0] = "Thorus";
	guild = GIL_BDT;
	id = 10014;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_sld_sword);
	b_createambientinv(self);
	CreateInvItems(self,itke_addon_thorus,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_THORUS,BODYTEX_B,itar_thorus_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_prestart_10014;
};


func void rtn_prestart_10014()
{
	ta_stand_guarding(0,0,12,0,"BL_STAIRS_03");
	ta_stand_guarding(12,0,0,0,"BL_STAIRS_03");
};

func void rtn_start_10014()
{
	ta_read_bookstand(0,0,12,0,"BL_BLOODWYN_BOOK");
	ta_stand_guarding(12,0,20,0,"BL_BLOODWYN_04");
	ta_stand_guarding(20,0,0,0,"BL_STAIRS_03");
};

func void rtn_talk_10014()
{
	ta_stand_wp(0,0,12,0,"BL_UP_PLACE_03");
	ta_stand_wp(12,0,0,0,"BL_UP_PLACE_03");
};

