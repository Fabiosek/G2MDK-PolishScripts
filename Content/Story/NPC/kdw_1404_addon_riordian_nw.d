
instance KDW_1404_ADDON_RIORDIAN_NW(NPC_DEFAULT)
{
	name[0] = "Riordian";
	guild = GIL_KDW;
	id = 1404;
	voice = 10;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	aivar[AIV_IGNORESFAKEGUILD] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_NORMALBART_RIORDIAN,BODYTEX_P,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_1404;
};


func void rtn_start_1404()
{
	ta_stand_guarding(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_34");
	ta_stand_guarding(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_34");
};

func void rtn_saturas_1404()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_04");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_04");
};

func void rtn_ringritual_1404()
{
	ta_circle(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_05");
	ta_circle(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_05");
};

func void rtn_preringritual_1404()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_05");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_05");
};

func void rtn_openportal_1404()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTAL_KDWWAIT_05");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTAL_KDWWAIT_05");
};

func void rtn_tot_1404()
{
	ta_sleep(8,0,20,0,"TOT");
	ta_sleep(20,0,8,0,"TOT");
};

