
instance BDT_1080_ADDON_TOM(NPC_DEFAULT)
{
	name[0] = "Tom";
	guild = GIL_BDT;
	id = 1080;
	voice = 11;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_elbastardo);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_OLDMAN_GRAVO,BODYTEX_P,itar_bdt_m);
	Mdl_SetModelFatness(self,0.75);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1080;
};


func void rtn_start_1080()
{
	ta_sit_campfire(9,0,21,0,"ADW_BL_HOEHLE_04");
	ta_sit_campfire(21,0,9,0,"ADW_BL_HOEHLE_04");
};

func void rtn_lager_1080()
{
	ta_stand_drinking(9,0,21,0,"BL_INN_03_C");
	ta_stand_drinking(21,0,9,0,"BL_INN_03_C");
};

