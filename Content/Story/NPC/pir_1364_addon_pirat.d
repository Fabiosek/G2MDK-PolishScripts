
instance PIR_1364_ADDON_PIRAT(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_PIRAT;
	guild = GIL_PIR;
	id = 1364;
	voice = 6;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_FOLLOWDIST] = 700;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_addon_pir1hsword);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART_DUSTY,BODYTEX_N,itar_pir_l_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_prestart_1364;
};


func void rtn_prestart_1364()
{
	ta_roast_scavenger(8,0,20,0,"ADW_PIRATECAMP_SCAVENGER");
	ta_roast_scavenger(20,0,8,0,"ADW_PIRATECAMP_SCAVENGER");
};

func void rtn_start_1364()
{
	ta_roast_scavenger(7,35,16,35,"ADW_PIRATECAMP_SCAVENGER");
	ta_stand_drinking(16,35,17,35,"ADW_PIRATECAMP_BEACH_07");
	ta_roast_scavenger(17,35,20,35,"ADW_PIRATECAMP_SCAVENGER");
	ta_stand_drinking(20,35,7,35,"ADW_PIRATECAMP_BEACH_07");
};

func void rtn_follow_1364()
{
	ta_follow_player(8,0,20,0,"ADW_CANYON_TELEPORT_PATH_06");
	ta_follow_player(20,0,8,0,"ADW_CANYON_TELEPORT_PATH_06");
};

