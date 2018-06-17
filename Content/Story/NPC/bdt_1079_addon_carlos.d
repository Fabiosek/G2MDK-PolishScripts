
instance BDT_1079_ADDON_CARLOS(NPC_DEFAULT)
{
	name[0] = "Carlos";
	guild = GIL_BDT;
	id = 1079;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FIGHTER",FACE_L_IAN,BODYTEX_L,itar_bloodwyn_addon);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_prestart_1079;
};


func void rtn_prestart_1079()
{
	ta_stand_guarding(0,0,12,0,"BL_WAIT_CARLOS");
	ta_stand_guarding(12,0,0,0,"BL_WAIT_CARLOS");
};

func void rtn_start_1079()
{
	ta_stand_guarding(6,0,20,0,"ADW_PATH_TO_BL_02");
	ta_stand_guarding(20,0,0,0,"BANDIT_FIGHT");
	ta_stand_eating(0,0,3,0,"BANDIT_FIGHT");
	ta_stand_drinking(3,0,6,0,"BANDIT_FIGHT");
};

