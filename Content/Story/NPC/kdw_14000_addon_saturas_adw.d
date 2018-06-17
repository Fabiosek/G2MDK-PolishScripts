
instance KDW_14000_ADDON_SATURAS_ADW(NPC_DEFAULT)
{
	name[0] = "Saturas";
	guild = GIL_KDW;
	id = 14000;
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
	daily_routine = rtn_prestart_14000;
};


func void rtn_prestart_14000()
{
	ta_study_wp(8,25,21,35,"ADW_SATURAS_START");
	ta_study_wp(21,35,8,25,"ADW_SATURAS_START");
};

func void rtn_start_14000()
{
	ta_study_wp(8,25,9,35,"ADW_ENTRANCE_BUILDING2_01A");
	ta_study_wp(9,35,10,45,"ADW_ENTRANCE_BUILDING2_04");
	ta_study_wp(10,45,11,55,"ADW_ENTRANCE_PLATEAU_21");
	ta_study_wp(11,55,12,5,"ADW_ENTRANCE_BUILDING2_01A");
	ta_study_wp(12,5,13,15,"ADW_ENTRANCE_BUILDING2_04");
	ta_study_wp(13,15,14,25,"ADW_ENTRANCE_PLATEAU_21");
	ta_study_wp(14,25,15,35,"ADW_ENTRANCE_BUILDING2_01A");
	ta_study_wp(15,35,16,45,"ADW_ENTRANCE_BUILDING2_04");
	ta_study_wp(16,45,17,55,"ADW_ENTRANCE_PLATEAU_21");
	ta_study_wp(17,55,18,5,"ADW_ENTRANCE_BUILDING2_01A");
	ta_sit_bench(18,5,19,15,"ADW_ENTRANCE_BUILDING2_02A");
	ta_study_wp(19,15,20,25,"ADW_ENTRANCE_BUILDING2_04");
	ta_sit_bench(20,25,21,35,"ADW_ENTRANCE_BUILDING2_02A");
	ta_study_wp(21,35,22,45,"ADW_ENTRANCE_BUILDING2_04");
	ta_sit_bench(22,45,1,15,"ADW_ENTRANCE_BUILDING2_02A");
	ta_study_wp(1,15,3,25,"ADW_ENTRANCE_BUILDING2_04");
	ta_sit_bench(3,25,5,35,"ADW_ENTRANCE_BUILDING2_02A");
	ta_study_wp(5,35,7,45,"ADW_ENTRANCE_BUILDING2_04");
	ta_sit_bench(7,45,8,25,"ADW_ENTRANCE_BUILDING2_02A");
};

