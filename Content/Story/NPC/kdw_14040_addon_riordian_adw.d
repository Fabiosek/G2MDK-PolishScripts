
instance KDW_14040_ADDON_RIORDIAN_ADW(NPC_DEFAULT)
{
	name[0] = "Riordian";
	guild = GIL_KDW;
	id = 14040;
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
	daily_routine = rtn_start_14040;
};


func void rtn_start_14040()
{
	ta_study_wp(7,5,7,20,"ADW_ENTRANCE_PLATEAU_06A");
	ta_study_wp(7,20,8,25,"ADW_ENTRANCE_PLATEAU_10A");
	ta_study_wp(8,25,9,5,"ADW_ENTRANCE_PLATEAU_14A");
	ta_study_wp(9,5,10,45,"ADW_ENTRANCE_PLATEAU_06A");
	ta_study_wp(10,45,11,55,"ADW_ENTRANCE_PLATEAU_14A");
	ta_study_wp(11,55,12,5,"ADW_ENTRANCE_PLATEAU_10A");
	ta_study_wp(12,5,13,20,"ADW_ENTRANCE_PLATEAU_06A");
	ta_study_wp(13,20,14,25,"ADW_ENTRANCE_PLATEAU_14A");
	ta_study_wp(14,25,15,5,"ADW_ENTRANCE_PLATEAU_10A");
	ta_study_wp(15,5,16,45,"ADW_ENTRANCE_PLATEAU_06A");
	ta_study_wp(16,45,17,55,"ADW_ENTRANCE_PLATEAU_14A");
	ta_study_wp(17,55,18,5,"ADW_ENTRANCE_PLATEAU_10A");
	ta_study_wp(18,5,19,20,"ADW_ENTRANCE_PLATEAU_06A");
	ta_study_wp(19,20,20,25,"ADW_ENTRANCE_PLATEAU_10A");
	ta_study_wp(20,25,21,5,"ADW_ENTRANCE_PLATEAU_06A");
	ta_study_wp(21,5,22,0,"ADW_ENTRANCE_PLATEAU_10A");
	ta_sleep(22,0,7,5,"ADW_ENTRANCE_BUILDING2_05");
};

