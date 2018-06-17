
instance KDW_14010_ADDON_CRONOS_ADW(NPC_DEFAULT)
{
	name[0] = "Cronos";
	guild = GIL_KDW;
	id = 14010;
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
	daily_routine = rtn_start_14010;
};


func void rtn_start_14010()
{
	ta_study_wp(6,35,7,35,"ADW_ENTRANCE_PLATEAU_13A");
	ta_study_wp(7,35,8,35,"ADW_ENTRANCE_PLATEAU_04A");
	ta_study_wp(8,35,9,35,"ADW_ENTRANCE_PLATEAU_05A");
	ta_study_wp(9,35,10,10,"ADW_ENTRANCE_PLATEAU_13A");
	ta_study_wp(10,10,11,15,"ADW_ENTRANCE_PLATEAU_05A");
	ta_study_wp(11,15,12,35,"ADW_ENTRANCE_PLATEAU_04A");
	ta_study_wp(12,35,13,35,"ADW_ENTRANCE_PLATEAU_13A");
	ta_study_wp(13,35,14,35,"ADW_ENTRANCE_PLATEAU_04A");
	ta_study_wp(14,35,15,35,"ADW_ENTRANCE_PLATEAU_05A");
	ta_study_wp(15,35,16,10,"ADW_ENTRANCE_PLATEAU_13A");
	ta_study_wp(16,10,17,15,"ADW_ENTRANCE_PLATEAU_04A");
	ta_study_wp(17,15,18,35,"ADW_ENTRANCE_PLATEAU_05A");
	ta_study_wp(18,35,19,35,"ADW_ENTRANCE_PLATEAU_13A");
	ta_study_wp(19,35,20,35,"ADW_ENTRANCE_PLATEAU_05A");
	ta_study_wp(20,35,21,35,"ADW_ENTRANCE_PLATEAU_04A");
	ta_study_wp(21,35,22,0,"ADW_ENTRANCE_PLATEAU_13A");
	ta_sit_chair(22,0,6,35,"ADW_ENTRANCE_BUILDING2_03");
};

