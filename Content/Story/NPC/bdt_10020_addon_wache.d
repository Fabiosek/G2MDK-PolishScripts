
instance BDT_10020_ADDON_WACHE(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_GUARD;
	guild = GIL_BDT;
	id = 10020;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART21,BODYTEX_N,itar_thorus_addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10020;
};


func void rtn_start_10020()
{
	ta_stand_guarding(0,0,1,0,"BL_RAVEN_GUARD_03");
	ta_stand_guarding(1,0,2,0,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	ta_stand_wp(2,0,3,0,"BL_UP_PLACE_06");
	ta_stand_wp(3,0,4,0,"BL_UP_CHECK");
	ta_stand_guarding(4,0,5,0,"BL_RAVEN_GUARD_03");
	ta_stand_guarding(5,0,6,0,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	ta_stand_wp(6,0,7,0,"BL_UP_PLACE_06");
	ta_stand_wp(7,0,8,0,"BL_UP_CHECK");
	ta_stand_guarding(8,0,9,0,"BL_RAVEN_GUARD_03");
	ta_stand_guarding(9,0,10,0,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	ta_stand_wp(10,0,11,0,"BL_UP_PLACE_06");
	ta_stand_wp(11,0,12,0,"BL_UP_CHECK");
	ta_stand_guarding(12,0,13,0,"BL_RAVEN_GUARD_03");
	ta_stand_guarding(13,0,14,0,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	ta_stand_wp(14,0,15,0,"BL_UP_PLACE_06");
	ta_stand_wp(15,0,16,0,"BL_UP_CHECK");
	ta_stand_guarding(16,0,17,0,"BL_RAVEN_GUARD_03");
	ta_stand_guarding(17,0,18,0,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	ta_stand_wp(18,0,19,0,"BL_UP_PLACE_06");
	ta_stand_wp(19,0,20,0,"BL_UP_CHECK");
	ta_stand_guarding(20,0,21,0,"BL_RAVEN_GUARD_03");
	ta_stand_guarding(21,0,22,0,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	ta_stand_wp(22,0,23,0,"BL_UP_PLACE_06");
	ta_stand_wp(23,0,0,0,"BL_UP_CHECK");
};

