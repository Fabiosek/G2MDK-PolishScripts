
instance KDW_14030_ADDON_MYXIR_ADW(NPC_DEFAULT)
{
	name[0] = "Myxir";
	guild = GIL_KDW;
	id = 14030;
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
	daily_routine = rtn_start_14030;
};


func void rtn_start_14030()
{
	ta_study_wp(6,50,7,15,"ADW_ENTRANCE_PLATEAU_12C");
	ta_study_wp(7,15,8,40,"ADW_ENTRANCE_PLATEAU_07A");
	ta_study_wp(8,40,9,50,"ADW_ENTRANCE_PLATEAU_03");
	ta_study_wp(9,50,10,45,"ADW_ENTRANCE_PLATEAU_12C");
	ta_study_wp(10,45,11,55,"ADW_ENTRANCE_PLATEAU_07A");
	ta_study_wp(11,55,12,50,"ADW_ENTRANCE_PLATEAU_03");
	ta_study_wp(12,50,13,15,"ADW_ENTRANCE_PLATEAU_12C");
	ta_study_wp(13,15,14,40,"ADW_ENTRANCE_PLATEAU_07A");
	ta_study_wp(14,40,15,50,"ADW_ENTRANCE_PLATEAU_03");
	ta_study_wp(15,50,16,45,"ADW_ENTRANCE_PLATEAU_12C");
	ta_study_wp(16,45,17,55,"ADW_ENTRANCE_PLATEAU_07A");
	ta_study_wp(17,55,18,50,"ADW_ENTRANCE_PLATEAU_03");
	ta_study_wp(18,50,19,15,"ADW_ENTRANCE_PLATEAU_12C");
	ta_study_wp(19,15,20,40,"ADW_ENTRANCE_PLATEAU_07A");
	ta_study_wp(20,40,21,50,"ADW_ENTRANCE_PLATEAU_03");
	ta_study_wp(21,50,22,0,"ADW_ENTRANCE_PLATEAU_12C");
	ta_smalltalk(22,0,6,50,"ADW_ENTRANCE_BUILDING2_03");
};

func void rtn_tot_14030()
{
	ta_stand_armscrossed(8,0,23,0,"TOT");
	ta_stand_armscrossed(23,0,8,0,"TOT");
};

