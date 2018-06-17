
instance BDT_10022_ADDON_MIGUEL(NPC_DEFAULT)
{
	name[0] = "Miguel";
	guild = GIL_BDT;
	id = 10022;
	voice = 11;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_nagelknueppel);
	b_createambientinv(self);
	CreateInvItems(self,itpo_health_01,20);
	CreateInvItems(self,itpo_health_02,8);
	CreateInvItems(self,itpo_health_03,5);
	CreateInvItems(self,itpo_mana_01,7);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_P_OLDMAN_GRAVO,BODYTEX_P,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_10022;
};


func void rtn_start_10022()
{
	ta_pick_fp(6,0,12,0,"ADW_PATH_TO_VP3_01");
	ta_pick_fp(12,0,18,0,"ADW_PATH_TO_VP3_02");
	ta_pick_fp(18,0,22,0,"ADW_PATH_TO_VP3_03");
	ta_sit_bench(22,0,6,0,"ADW_SWAMP_SIT_BENCH_03");
};

