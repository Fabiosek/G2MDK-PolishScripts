
instance KDW_1400_ADDON_SATURAS_NW(NPC_DEFAULT)
{
	name[0] = "Saturas";
	guild = GIL_KDW;
	id = 1400;
	voice = 14;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	aivar[AIV_IGNORESFAKEGUILD] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_SATURAS,BODYTEX_B,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_1400;
};


func void rtn_start_1400()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
};

func void rtn_ringritual_1400()
{
	ta_circle(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");
	ta_circle(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");
};

func void rtn_preringritual_1400()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");
};

func void rtn_openportal_1400()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTAL_KDWWAIT_01");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTAL_KDWWAIT_01");
};

func void rtn_tot_1400()
{
	ta_sleep(8,0,20,0,"TOT");
	ta_sleep(20,0,8,0,"TOT");
};

