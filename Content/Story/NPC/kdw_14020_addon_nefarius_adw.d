
instance KDW_14020_ADDON_NEFARIUS_ADW(NPC_DEFAULT)
{
	name[0] = "Nefarius";
	guild = GIL_KDW;
	id = 14020;
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
	daily_routine = rtn_start_14020;
};


func void rtn_start_14020()
{
	ta_study_wp(6,50,7,50,"ADW_ENTRANCE_PLATEAU_11A");
	ta_study_wp(7,50,8,35,"PORTALTEMPEL");
	ta_study_wp(8,35,9,50,"ADW_ENTRANCE_PLATEAU_11A");
	ta_study_wp(9,50,10,45,"PORTALTEMPEL");
	ta_study_wp(10,45,11,15,"ADW_ENTRANCE_PLATEAU_11A");
	ta_study_wp(11,15,12,50,"PORTALTEMPEL");
	ta_study_wp(12,50,13,50,"ADW_ENTRANCE_PLATEAU_11A");
	ta_study_wp(13,50,14,35,"PORTALTEMPEL");
	ta_study_wp(14,35,15,50,"ADW_ENTRANCE_PLATEAU_11A");
	ta_study_wp(15,50,16,45,"PORTALTEMPEL");
	ta_study_wp(16,45,17,15,"ADW_ENTRANCE_PLATEAU_11A");
	ta_study_wp(17,15,18,50,"PORTALTEMPEL");
	ta_study_wp(18,50,19,50,"ADW_ENTRANCE_PLATEAU_11A");
	ta_study_wp(19,50,20,35,"PORTALTEMPEL");
	ta_study_wp(20,35,21,50,"ADW_ENTRANCE_PLATEAU_11A");
	ta_study_wp(21,50,22,0,"PORTALTEMPEL");
	ta_smalltalk(22,0,6,50,"ADW_ENTRANCE_BUILDING2_03");
};

