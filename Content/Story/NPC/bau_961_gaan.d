
instance BAU_961_GAAN(NPC_DEFAULT)
{
	name[0] = "Gaan";
	guild = GIL_NONE;
	id = 961;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NPCISRANGER] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL02,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,25);
	daily_routine = rtn_prestart_961;
};


func void rtn_prestart_961()
{
	ta_stand_armscrossed(8,0,22,0,"NW_FARM3_PATH_LEVELCHANGE_02");
	ta_stand_armscrossed(22,0,8,0,"NW_FARM3_PATH_LEVELCHANGE_02");
};

func void rtn_start_961()
{
	ta_stand_armscrossed(8,0,22,0,"NW_FARM3_GAAN");
	ta_stand_armscrossed(22,0,8,0,"NW_FARM3_STABLE_REST_01");
};

func void rtn_prerangermeeting_961()
{
	ta_rangermeeting(5,0,20,0,"NW_TAVERNE_03");
	ta_rangermeeting(20,0,5,0,"NW_TAVERNE_03");
};

func void rtn_rangermeeting_961()
{
	ta_rangermeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	ta_rangermeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void rtn_parking_961()
{
	ta_stand_armscrossed(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	ta_stand_armscrossed(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

