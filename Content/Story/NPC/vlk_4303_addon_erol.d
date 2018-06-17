
instance VLK_4303_ADDON_EROL(NPC_DEFAULT)
{
	name[0] = "Erol";
	guild = GIL_NONE;
	id = 4303;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_vlk_sword);
	CreateInvItems(self,itpo_health_01,3);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_CORRISTO,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_prestart_4303;
};


func void rtn_prestart_4303()
{
	ta_sit_bench(8,0,22,0,"NW_TAVERN_TO_FOREST_03");
	ta_sit_bench(22,0,8,0,"NW_TAVERN_TO_FOREST_03");
};

func void rtn_start_4303()
{
	ta_rangermeeting(8,0,22,0,"NW_BIGFARM_HUT_02");
	ta_rangermeeting(22,0,8,0,"NW_BIGFARM_HUT_02");
};

func void rtn_home_4303()
{
	ta_sit_chair(8,0,22,0,"NW_BIGFARM_HUT_IN_01");
	ta_sleep(22,0,8,0,"NW_BIGFARM_HUTINSIDE_BED");
};

