
instance VLK_4302_ADDON_ELVRICH(NPC_DEFAULT)
{
	name[0] = "Elvrich";
	guild = GIL_NONE;
	id = 4302;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_axe);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_B_NORMAL01,BODYTEX_B,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4302;
};


func void rtn_start_4302()
{
	ta_sit_campfire(8,0,23,0,"NW_BIGMILL_FARM3_RANGERBANDITS_ELVRICH");
	ta_sit_campfire(23,0,8,0,"NW_BIGMILL_FARM3_RANGERBANDITS_ELVRICH");
};

func void rtn_backinthecity_4302()
{
	ta_repair_hut(6,0,9,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_saw(9,0,13,5,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_repair_hut(13,5,14,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_saw(14,0,16,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_repair_hut(16,0,17,5,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_repair_hut(17,5,18,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_repair_hut(18,0,19,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_saw(19,0,20,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_repair_hut(20,0,0,0,"NW_CITY_MERCHANT_HUT_01_FRONT");
	ta_sit_bench(0,0,6,0,"NW_CITY_MERCHANT_HUT_01_FRONT");
};

