
instance PIR_1367_ADDON_OWEN(NPC_DEFAULT)
{
	name[0] = "Owen";
	guild = GIL_PIR;
	id = 1367;
	voice = 13;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_addon_pir1haxe);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL16,BODYTEX_N,itar_pir_l_addon);
	Mdl_SetModelFatness(self,1.1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_poststart_1367;
};


func void rtn_prestart_1367()
{
	ta_saw(6,0,10,0,"ADW_PIRATECAMP_WAY_15");
	ta_sit_campfire(10,0,14,0,"ADW_PIRATECAMP_LUMBER_SIT");
	ta_saw(14,0,18,0,"ADW_PIRATECAMP_WAY_15");
	ta_sit_campfire(18,0,22,0,"ADW_PIRATECAMP_LUMBER_SIT");
	ta_sit_campfire(22,0,2,0,"ADW_PIRATECAMP_LUMBER_SIT");
	ta_sit_campfire(2,0,6,0,"ADW_PIRATECAMP_LUMBER_SIT");
};

func void rtn_start_1367()
{
	ta_sit_campfire(7,0,22,0,"ADW_PIRATECAMP_LUMBERCAMP_04");
	ta_sit_campfire(22,0,7,0,"ADW_PIRATECAMP_LUMBERCAMP_04");
};

func void rtn_poststart_1367()
{
	ta_stand_drinking(7,0,22,0,"ADW_PIRATECAMP_BEACH_19");
	ta_stand_drinking(22,0,7,0,"ADW_PIRATECAMP_BEACH_25");
};

