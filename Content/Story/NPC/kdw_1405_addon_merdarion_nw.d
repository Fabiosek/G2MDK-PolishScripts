
instance KDW_1405_ADDON_MERDARION_NW(NPC_DEFAULT)
{
	name[0] = "Merdarion";
	guild = GIL_KDW;
	id = 1405;
	voice = 6;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	aivar[AIV_IGNORESFAKEGUILD] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_P_NORMALBART_NEFARIUS,BODYTEX_P,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_prestart_1405;
};


func void rtn_prestart_1405()
{
	ta_smalltalk(8,0,20,0,"NW_TROLLAREA_PORTAL_03");
	ta_smalltalk(20,0,8,0,"NW_TROLLAREA_PORTAL_03");
};

func void rtn_start_1405()
{
	ta_stand_armscrossed(6,5,6,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(6,15,6,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(6,25,6,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(6,35,6,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(6,45,6,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(6,55,7,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(7,5,7,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(7,15,7,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(7,25,7,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(7,35,7,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(7,45,7,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(7,55,8,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(8,5,8,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(8,15,8,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(8,25,8,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(8,35,8,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(8,45,8,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(8,55,9,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(9,5,9,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(9,15,9,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(9,25,9,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(9,35,9,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(9,45,9,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(9,55,10,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(10,5,10,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(10,15,10,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(10,25,10,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(10,35,10,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(10,45,10,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(10,55,11,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(11,5,11,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(11,15,11,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(11,25,11,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(11,35,11,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(11,45,11,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(11,55,12,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(12,5,12,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(12,15,12,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(12,25,12,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(12,35,12,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(12,45,12,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(12,55,13,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(13,5,13,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(13,15,13,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(13,25,13,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(13,35,13,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(13,45,13,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(13,55,14,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(14,5,14,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(14,15,14,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(14,25,14,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(14,35,14,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(14,45,14,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(14,55,15,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(15,5,15,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(15,15,15,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(15,25,15,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(15,35,15,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(15,45,15,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(15,55,16,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(16,5,16,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(16,15,16,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(16,25,16,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(16,35,16,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(16,45,16,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(16,55,17,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(17,5,17,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(17,15,17,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(17,25,17,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(17,35,17,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(17,45,17,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(17,55,18,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(18,5,18,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(18,15,18,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(18,25,18,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(18,35,18,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(18,45,18,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(18,55,19,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(19,5,19,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(19,15,19,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(19,25,19,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(19,35,19,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(19,45,19,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(19,55,20,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(20,5,20,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(20,15,20,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(20,25,20,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(20,35,20,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(20,45,20,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(20,55,21,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(21,5,21,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(21,15,21,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(21,25,21,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(21,35,21,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(21,45,21,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(21,55,22,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(22,5,22,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(22,15,22,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(22,25,22,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(22,35,22,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(22,45,22,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(22,55,23,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(23,5,23,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(23,15,23,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(23,25,23,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(23,35,23,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(23,45,23,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(23,55,0,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(0,5,0,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(0,15,0,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(0,25,0,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(0,35,0,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(0,45,0,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(0,55,1,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(1,5,1,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(1,15,1,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(1,25,1,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(1,35,1,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(1,45,1,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(1,55,2,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(2,5,2,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(2,15,2,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(2,25,2,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(2,35,2,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(2,45,2,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(2,55,3,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(3,5,3,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(3,15,3,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(3,25,3,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(3,35,3,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(3,45,3,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(3,55,4,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(4,5,4,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(4,15,4,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(4,25,4,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(4,35,4,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(4,45,4,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(4,55,5,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(5,5,5,15,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(5,15,5,25,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(5,25,5,35,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(5,35,5,45,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	ta_stand_armscrossed(5,45,5,55,"NW_TROLLAREA_PORTAL_02");
	ta_stand_armscrossed(5,55,6,5,"NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
};

func void rtn_ringritual_1405()
{
	ta_circle(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_06");
	ta_circle(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_06");
};

func void rtn_preringritual_1405()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_06");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_06");
};

func void rtn_openportal_1405()
{
	ta_study_wp(8,0,20,0,"NW_TROLLAREA_PORTAL_KDWWAIT_06");
	ta_study_wp(20,0,8,0,"NW_TROLLAREA_PORTAL_KDWWAIT_06");
};

func void rtn_tot_1405()
{
	ta_sleep(8,0,20,0,"TOT");
	ta_sleep(20,0,8,0,"TOT");
};

