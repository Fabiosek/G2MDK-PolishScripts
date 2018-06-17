
instance PIR_1365_ADDON_MATT(NPC_DEFAULT)
{
	name[0] = "Matt";
	guild = GIL_PIR;
	id = 1365;
	voice = 10;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_FOLLOWDIST] = 500;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_addon_pir2haxe);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL14,BODYTEX_N,itar_pir_l_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_1365;
};


func void rtn_start_1365()
{
	ta_smalltalk(7,5,16,5,"ADW_PIRATECAMP_BEACH_11");
	ta_stand_drinking(16,5,20,5,"ADW_PIRATECAMP_BEACH_11");
	ta_smalltalk(20,5,21,5,"ADW_PIRATECAMP_BEACH_11");
	ta_stand_drinking(21,5,7,5,"ADW_PIRATECAMP_BEACH_11");
};

func void rtn_follow_1365()
{
	ta_follow_player(8,0,20,0,"ADW_CANYON_TELEPORT_PATH_06");
	ta_follow_player(20,0,8,0,"ADW_CANYON_TELEPORT_PATH_06");
};

