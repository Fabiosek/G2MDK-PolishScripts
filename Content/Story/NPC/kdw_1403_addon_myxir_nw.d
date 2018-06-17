
instance KDW_1403_ADDON_MYXIR_NW(NPC_DEFAULT)
{
	name[0] = "Myxir";
	guild = GIL_KDW;
	id = 1403;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	aivar[AIV_IGNORESFAKEGUILD] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_P_NORMALBART_CRONOS,BODYTEX_P,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_1403;
};


func void rtn_start_1403()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_03");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_03");
};

func void rtn_ringritual_1403()
{
	ta_circle(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_04");
	ta_circle(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_04");
};

func void rtn_preringritual_1403()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_04");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_04");
};

func void rtn_openportal_1403()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTAL_KDWWAIT_04");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTAL_KDWWAIT_04");
};

func void rtn_tot_1403()
{
	ta_sleep(8,0,20,0,"TOT");
	ta_sleep(20,0,8,0,"TOT");
};

