
instance PIR_1368_ADDON_MALCOM(NPC_DEFAULT)
{
	name[0] = "Malcolm";
	guild = GIL_PIR;
	id = 1368;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_addon_pir1haxe);
	CreateInvItems(self,itwr_twohstoneplate3_addon,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_NORMAL_SLY,BODYTEX_N,itar_pir_l_addon);
	Mdl_SetModelFatness(self,1.1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_prestart_1368;
};


func void rtn_prestart_1368()
{
	ta_sit_campfire(6,0,10,0,"ADW_PIRATECAMP_LUMBER_SIT");
	ta_saw(10,0,14,0,"ADW_PIRATECAMP_WAY_15");
	ta_sit_campfire(14,0,18,0,"ADW_PIRATECAMP_LUMBER_SIT");
	ta_saw(18,0,22,0,"ADW_PIRATECAMP_WAY_15");
	ta_sit_campfire(22,0,2,0,"ADW_PIRATECAMP_LUMBER_SIT");
	ta_sit_campfire(2,0,6,0,"ADW_PIRATECAMP_LUMBER_SIT");
};

func void rtn_start_1368()
{
	ta_sleep(6,0,18,0,"ADW_PIRATECAMP_SECRETCAVE_02");
	ta_sleep(18,0,6,0,"ADW_PIRATECAMP_SECRETCAVE_02");
};

