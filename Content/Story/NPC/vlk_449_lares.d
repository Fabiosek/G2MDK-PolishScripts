
instance VLK_449_LARES(NPC_DEFAULT)
{
	name[0] = "Lares";
	guild = GIL_NONE;
	id = 449;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_NPCISRANGER] = TRUE;
	aivar[AIV_IGNORESFAKEGUILD] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_schwert3);
	CreateInvItems(self,itmw_schwert3,1);
	CreateInvItems(self,itmi_gold,100);
	CreateInvItems(self,itmi_oldcoin,1);
	CreateInvItems(self,itpo_health_02,5);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_LARES,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_prestart_449;
};


func void rtn_prestart_449()
{
	ta_stand_guarding(8,0,20,0,"NW_CITY_HABOUR_02_B");
	ta_stand_guarding(20,0,8,0,"NW_CITY_HABOUR_02_B");
};

func void rtn_start_449()
{
	ta_stand_guarding(4,35,20,5,"NW_CITY_HABOUR_02_B");
	ta_sit_chair(20,5,4,35,"NW_CITY_HABOUR_TAVERN01_08");
};

func void rtn_guide_449()
{
	ta_guide_player(8,0,20,0,"NW_TAVERNE_BIGFARM_05");
	ta_guide_player(20,0,8,0,"NW_TAVERNE_BIGFARM_05");
};

func void rtn_guideportaltempel1_449()
{
	ta_guide_player(8,0,20,0,"NW_CITY_TO_FOREST_11");
	ta_guide_player(20,0,8,0,"NW_CITY_TO_FOREST_11");
};

func void rtn_guideportaltempel2_449()
{
	ta_guide_player(8,0,20,0,"NW_TAVERN_TO_FOREST_02");
	ta_guide_player(20,0,8,0,"NW_TAVERN_TO_FOREST_02");
};

func void rtn_guideportaltempel3_449()
{
	ta_guide_player(8,0,20,0,"NW_TAVERNE_TROLLAREA_14");
	ta_guide_player(20,0,8,0,"NW_TAVERNE_TROLLAREA_14");
};

func void rtn_guideportaltempel4_449()
{
	ta_guide_player(8,0,20,0,"NW_TROLLAREA_PATH_58");
	ta_guide_player(20,0,8,0,"NW_TROLLAREA_PATH_58");
};

func void rtn_guideportaltempel5_449()
{
	ta_guide_player(8,0,20,0,"NW_TROLLAREA_PATH_47");
	ta_guide_player(20,0,8,0,"NW_TROLLAREA_PATH_47");
};

func void rtn_guideportaltempel6_449()
{
	ta_guide_player(8,0,20,0,"NW_TROLLAREA_RUINS_02");
	ta_guide_player(20,0,8,0,"NW_TROLLAREA_RUINS_02");
};

func void rtn_guideportaltempelend_449()
{
	ta_guide_player(8,0,20,0,"NW_TROLLAREA_RUINS_41");
	ta_guide_player(20,0,8,0,"NW_TROLLAREA_RUINS_41");
};

func void rtn_guidemediumwald1_449()
{
	ta_guide_player(8,0,20,0,"NW_CITY_TO_FARM2_04");
	ta_guide_player(20,0,8,0,"NW_CITY_TO_FARM2_04");
};

func void rtn_guidemediumwald2_449()
{
	ta_guide_player(8,0,20,0,"NW_FOREST_PATH_62");
	ta_guide_player(20,0,8,0,"NW_FOREST_PATH_62");
};

func void rtn_prerangermeeting_449()
{
	ta_rangermeeting(5,0,20,0,"NW_TAVERNE_03");
	ta_rangermeeting(20,0,5,0,"NW_TAVERNE_03");
};

func void rtn_rangermeeting_449()
{
	ta_rangermeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
	ta_rangermeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
};

func void rtn_parking_449()
{
	ta_stand_wp(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
	ta_stand_wp(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
};

func void rtn_waitforship_449()
{
	ta_smalltalk(8,0,20,0,"NW_WAITFOR_SHIP_05");
	ta_smalltalk(20,0,8,0,"NW_WAITFOR_SHIP_05");
};

func void rtn_shipoff_449()
{
	ta_stand_guarding(4,35,20,5,"NW_CITY_HABOUR_02_B");
	ta_sit_chair(20,5,4,35,"NW_CITY_HABOUR_TAVERN01_08");
};

func void rtn_ship_449()
{
	ta_smalltalk(8,0,23,0,"SHIP_CREW_05");
	ta_smalltalk(23,0,8,0,"SHIP_CREW_05");
};

