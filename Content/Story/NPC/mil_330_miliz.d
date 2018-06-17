
instance MIL_330_MILIZ(NPC_DEFAULT)
{
	name[0] = NAME_MILIZ;
	guild = GIL_MIL;
	id = 330;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_MORDRAG,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_330;
};


func void rtn_start_330()
{
	ta_practice_sword(7,0,21,1,"NW_CITY_HABOUR_KASERN_CENTRE_03");
	ta_smalltalk(21,1,0,0,"NW_CITY_KASERN_BARRACK02_02");
	ta_sleep(0,0,7,0,"NW_CITY_BARRACK01_BED_06");
};

