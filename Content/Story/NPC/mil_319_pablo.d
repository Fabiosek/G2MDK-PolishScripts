
instance MIL_319_PABLO(NPC_DEFAULT)
{
	name[0] = "Pablo";
	guild = GIL_MIL;
	id = 319;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	CreateInvItems(self,itke_city_tower_01,1);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART_DUSTY,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_319;
};


func void rtn_start_319()
{
	ta_stand_guarding(1,0,3,0,"NW_CITY_MAINSTREET_07");
	ta_stand_guarding(3,0,5,0,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	ta_stand_guarding(5,0,7,0,"NW_CITY_MERCHANT_PATH_22");
	ta_stand_guarding(7,0,9,0,"NW_CITY_MAINSTREET_07");
	ta_stand_guarding(9,0,11,0,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	ta_stand_guarding(11,0,13,0,"NW_CITY_MERCHANT_PATH_22");
	ta_stand_guarding(13,0,15,0,"NW_CITY_MAINSTREET_07");
	ta_stand_guarding(15,0,17,0,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	ta_stand_guarding(17,0,19,0,"NW_CITY_MERCHANT_PATH_22");
	ta_stand_guarding(19,0,21,0,"NW_CITY_MAINSTREET_07");
	ta_stand_guarding(21,0,23,0,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	ta_stand_guarding(23,0,1,0,"NW_CITY_MERCHANT_PATH_22");
};

