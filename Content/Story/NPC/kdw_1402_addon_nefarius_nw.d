
instance KDW_1402_ADDON_NEFARIUS_NW(NPC_DEFAULT)
{
	name[0] = "Nefarius";
	guild = GIL_KDW;
	id = 1402;
	voice = 5;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	aivar[AIV_IGNORESFAKEGUILD] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_P_NORMALBART_NEFARIUS,BODYTEX_P,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_1402;
};


func void rtn_start_1402()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTAL_09");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTAL_09");
};

func void rtn_ringritual_1402()
{
	ta_circle(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_02");
	ta_circle(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_02");
};

func void rtn_preringritual_1402()
{
	ta_stand_wp(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_42");
	ta_stand_wp(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_42");
};

func void rtn_openportal_1402()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTAL_KDWWAIT_03");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTAL_KDWWAIT_03");
};

func void rtn_tot_1402()
{
	ta_sleep(8,0,20,0,"TOT");
	ta_sleep(20,0,8,0,"TOT");
};

