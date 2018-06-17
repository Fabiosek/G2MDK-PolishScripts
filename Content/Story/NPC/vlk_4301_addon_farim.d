
instance VLK_4301_ADDON_FARIM(NPC_DEFAULT)
{
	name[0] = "Farim";
	guild = GIL_VLK;
	id = 4301;
	voice = 11;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	CreateInvItems(self,itmi_aquamarine,1);
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMALBART08,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4301;
};


func void rtn_start_4301()
{
	ta_repair_hut(8,0,12,0,"NW_CITY_WAY_TO_SHIP_FISCHER_05");
	ta_stand_guarding(12,0,16,0,"NW_CITY_WAY_TO_SHIP_FISCHER_06");
	ta_repair_hut(16,0,20,0,"NW_CITY_WAY_TO_SHIP_FISCHER_05");
	ta_stand_guarding(20,0,1,30,"NW_CITY_WAY_TO_SHIP_FISCHER_06");
	ta_sleep(1,30,8,0,"NW_CITY_WAY_TO_SHIP_FISCHER_04");
};

