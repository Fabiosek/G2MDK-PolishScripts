
instance PIR_1300_ADDON_GREG_NW(NPC_DEFAULT)
{
	name[0] = "Greg";
	guild = GIL_NONE;
	id = 1300;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_piratensaebel);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_P_GREG,BODYTEX_P,itar_pir_h_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_1300;
};


func void rtn_start_1300()
{
	ta_stand_armscrossed(8,0,22,0,"NW_FARM1_PATH_SPAWN_05");
	ta_stand_armscrossed(22,0,8,0,"NW_FARM1_PATH_SPAWN_05");
};

func void rtn_markt_1300()
{
	ta_stand_eating(8,0,23,0,"MARKT");
	ta_stand_eating(23,0,8,0,"MARKT");
};

func void rtn_taverne_1300()
{
	ta_sit_bench(8,0,23,0,"NW_TAVERNE_GREGSBENCH");
	ta_sit_bench(23,0,8,0,"NW_TAVERNE_GREGSBENCH");
};

func void rtn_rakecave_1300()
{
	ta_rangermeeting(8,0,23,0,"NW_BIGFARM_LAKE_CAVE_01");
	ta_rangermeeting(23,0,8,0,"NW_BIGFARM_LAKE_CAVE_01");
};

func void rtn_bigcross_1300()
{
	ta_stand_eating(8,0,23,0,"BIGCROSS");
	ta_stand_eating(23,0,8,0,"BIGCROSS");
};

func void rtn_dexter_1300()
{
	ta_stand_wp(8,0,23,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_03");
	ta_stand_wp(23,0,8,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_03");
};

func void rtn_dexterhouserun_1300()
{
	ta_runtowp(0,0,12,0,"NW_CASTLEMINE_HUT_10");
	ta_runtowp(12,0,0,0,"NW_CASTLEMINE_HUT_10");
};

func void rtn_dexterhousewalk_1300()
{
	ta_stand_wp(0,0,12,0,"NW_CASTLEMINE_HUT_10");
	ta_stand_wp(12,0,0,0,"NW_CASTLEMINE_HUT_10");
};

func void rtn_dexterthrone_1300()
{
	ta_sit_throne(0,0,12,0,"NW_CASTLEMINE_HUT_10");
	ta_sit_throne(12,0,0,0,"NW_CASTLEMINE_HUT_10");
};

func void rtn_tot_1300()
{
	ta_sleep(8,0,23,0,"TOT");
	ta_sleep(23,0,8,0,"TOT");
};

