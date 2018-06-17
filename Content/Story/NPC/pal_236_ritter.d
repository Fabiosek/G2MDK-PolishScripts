
instance PAL_236_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 236;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMAL06,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_236;
};


func void rtn_start_236()
{
	ta_stand_guarding(8,0,23,0,"NW_CITY_PALCAMP_GUARD_01");
	ta_stand_guarding(23,0,8,0,"NW_CITY_PALCAMP_GUARD_01");
};

