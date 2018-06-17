
instance MIL_350_ADDON_MARTIN(NPC_DEFAULT)
{
	name[0] = "Martin";
	guild = GIL_NONE;
	id = 350;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NPCISRANGER] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_P_OLDMAN_GRAVO,BODYTEX_P,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_prestart_350;
};


func void rtn_prestart_350()
{
	ta_study_wp(4,0,23,0,"NW_CITY_PALCAMP_15");
	ta_study_wp(23,0,4,0,"NW_CITY_PALCAMP_15");
};

func void rtn_start_350()
{
	ta_study_wp(4,0,23,0,"NW_CITY_PALCAMP_15");
	ta_sit_chair(23,0,4,0,"NW_CITY_HABOUR_TAVERN01_04");
};

func void rtn_prerangermeeting_350()
{
	ta_rangermeeting(5,0,20,0,"NW_TAVERNE_07");
	ta_rangermeeting(20,0,5,0,"NW_TAVERNE_07");
};

func void rtn_rangermeeting_350()
{
	ta_rangermeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	ta_rangermeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void rtn_parking_350()
{
	ta_stand_guarding(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	ta_stand_guarding(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

