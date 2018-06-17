
instance BDT_10023_ADDON_WACHE(NPC_DEFAULT)
{
	name[0] = "Stra¿nik niewolników";
	guild = GIL_BDT;
	id = 10023;
	voice = 11;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_TOUGH01,BODYTEX_L,itar_bloodwyn_addon);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10023;
};


func void rtn_start_10023()
{
	ta_stand_guarding(6,0,12,0,"ADW_MINE_LAGER_01");
	ta_stand_guarding(12,0,6,0,"ADW_MINE_LAGER_01");
};

func void rtn_soup_10023()
{
	ta_stand_eating(6,0,12,0,"ADW_MINE_27");
	ta_stand_eating(12,0,6,0,"ADW_MINE_27");
};

