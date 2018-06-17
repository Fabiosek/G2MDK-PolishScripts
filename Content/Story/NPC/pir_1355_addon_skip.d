
instance PIR_1355_ADDON_SKIP(NPC_DEFAULT)
{
	name[0] = "Skip";
	guild = GIL_PIR;
	id = 1355;
	voice = 8;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_FOLLOWDIST] = 300;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_shortsword2);
	EquipItem(self,itrw_sld_bow);
	CreateInvItems(self,itpo_health_03,2);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_PIRAT01,BODYTEX_N,itar_pir_l_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_prestart_1355;
};


func void rtn_prestart_1355()
{
	ta_stand_wp(8,0,21,0,"ADW_PIRATECAMP_HUT3_01");
	ta_stand_wp(21,0,8,0,"ADW_PIRATECAMP_HUT3_01");
};

func void rtn_start_1355()
{
	ta_stand_wp(7,30,11,30,"ADW_PIRATECAMP_HUT3_01");
	ta_sit_bench(11,30,20,30,"ADW_PIRATECAMP_HUT3_BENCH");
	ta_sit_campfire(20,30,1,30,"ADW_PIRATECAMP_BEACH_17");
	ta_stand_drinking(1,30,2,30,"ADW_PIRATECAMP_BEACH_17");
	ta_sleep(2,30,7,30,"ADW_PIRATECAMP_HUT3_02");
};

func void rtn_follow_1355()
{
	ta_follow_player(8,0,20,0,"ADW_CANYON_TELEPORT_PATH_06");
	ta_follow_player(20,0,8,0,"ADW_CANYON_TELEPORT_PATH_06");
};

