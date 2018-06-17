
instance PIR_1363_ADDON_PIRAT(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_PIRAT;
	guild = GIL_PIR;
	id = 1363;
	voice = 7;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_FOLLOWDIST] = 600;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_addon_pir2hsword);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_FINGERS,BODYTEX_N,itar_pir_l_addon);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_1363;
};


func void rtn_start_1363()
{
	ta_sit_bench(7,7,16,7,"ADW_PIRATECAMP_BENCH_01");
	ta_smalltalk(16,7,20,3,"ADW_PIRATECAMP_CENTER");
	ta_sit_campfire(20,3,22,7,"WP_PIR_03");
	ta_stand_drinking(20,7,23,7,"WP_PIR_03");
	ta_pee(23,7,23,12,"WP_PIR_03");
	ta_sit_campfire(23,12,2,7,"WP_PIR_03");
	ta_stand_drinking(2,7,3,7,"WP_PIR_03");
	ta_sit_campfire(3,7,7,7,"WP_PIR_03");
};

func void rtn_follow_1363()
{
	ta_follow_player(5,0,20,0,"ADW_CANYON_TELEPORT_PATH_06");
	ta_follow_player(20,0,5,0,"ADW_CANYON_TELEPORT_PATH_06");
};

