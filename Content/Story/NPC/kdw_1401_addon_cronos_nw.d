
instance KDW_1401_ADDON_CRONOS_NW(NPC_DEFAULT)
{
	name[0] = "Cronos";
	guild = GIL_KDW;
	id = 1401;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	aivar[AIV_IGNORESFAKEGUILD] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_P_NORMALBART_CRONOS,BODYTEX_P,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_prestart_1401;
};


func void rtn_prestart_1401()
{
	ta_smalltalk(8,0,20,0,"PORTAL");
	ta_smalltalk(20,0,8,0,"PORTAL");
};

func void rtn_start_1401()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02");
};

func void rtn_ringritual_1401()
{
	ta_circle(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
	ta_circle(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
};

func void rtn_preringritual_1401()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
};

func void rtn_openportal_1401()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTAL_KDWWAIT_02");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTAL_KDWWAIT_02");
};

func void rtn_tot_1401()
{
	ta_sleep(8,0,20,0,"TOT");
	ta_sleep(20,0,8,0,"TOT");
};

