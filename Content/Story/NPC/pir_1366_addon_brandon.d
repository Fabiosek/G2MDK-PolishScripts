
instance PIR_1366_ADDON_BRANDON(NPC_DEFAULT)
{
	name[0] = "Brandon";
	guild = GIL_PIR;
	id = 1366;
	voice = 4;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_FOLLOWDIST] = 400;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_addon_pir1haxe);
	CreateInvItems(self,itpo_health_03,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_TOUGH_OKYL,BODYTEX_N,itar_pir_m_addon);
	Mdl_SetModelFatness(self,1.1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_1366;
};


func void rtn_start_1366()
{
	ta_smalltalk(7,3,21,3,"ADW_PIRATECAMP_BEACH_06");
	ta_stand_drinking(21,3,22,3,"ADW_PIRATECAMP_BEACH_18");
	ta_sit_campfire(22,3,1,3,"ADW_PIRATECAMP_BEACH_18");
	ta_stand_drinking(1,3,3,3,"ADW_PIRATECAMP_BEACH_18");
	ta_sit_campfire(3,3,4,3,"ADW_PIRATECAMP_BEACH_18");
	ta_pee(4,3,4,9,"ADW_PIRATECAMP_BEACH_18");
	ta_stand_drinking(4,9,4,14,"ADW_PIRATECAMP_BEACH_18");
	ta_sit_campfire(4,14,7,3,"ADW_PIRATECAMP_BEACH_18");
};

func void rtn_follow_1366()
{
	ta_follow_player(8,0,20,0,"ADW_CANYON_TELEPORT_PATH_06");
	ta_follow_player(20,0,8,0,"ADW_CANYON_TELEPORT_PATH_06");
};

