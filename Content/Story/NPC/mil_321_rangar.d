
instance MIL_321_RANGAR(NPC_DEFAULT)
{
	name[0] = "Rangar";
	guild = GIL_MIL;
	id = 321;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	CreateInvItems(self,itke_city_tower_02,1);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_TOUGH_SKIP,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_321;
};


func void rtn_start_321()
{
	ta_stand_drinking(8,0,20,0,"NW_CITY_BEER_06");
	ta_stand_drinking(20,0,8,0,"NW_CITY_BEER_06");
};

func void rtn_prepalcampklau_321()
{
	ta_sit_bench(3,0,24,0,"NW_CITY_WAY_TO_SHIP_03");
	ta_sit_bench(24,0,3,0,"NW_CITY_WAY_TO_SHIP_03");
};

func void rtn_palcampklau_321()
{
	ta_stand_drinking(4,0,23,0,"NW_CITY_BEER_06");
	ta_pick_fp(23,0,4,0,"NW_CITY_PALCAMP_15");
};

