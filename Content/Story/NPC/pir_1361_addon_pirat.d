
instance PIR_1361_ADDON_PIRAT(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_PIRAT;
	guild = GIL_PIR;
	id = 1361;
	voice = 9;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_addon_pir2haxe);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_TOUGHBART01,BODYTEX_N,itar_pir_l_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_prestart_1361;
};


func void rtn_prestart_1361()
{
	ta_saw(8,0,20,0,"ADW_PIRATECAMP_ENTRANCE_SAW");
	ta_saw(20,0,8,0,"ADW_PIRATECAMP_ENTRANCE_SAW");
};

func void rtn_start_1361()
{
	ta_saw(6,15,19,15,"ADW_PIRATECAMP_ENTRANCE_SAW");
	ta_sit_campfire(19,15,21,15,"WP_PIR_02");
	ta_stand_drinking(21,15,22,15,"WP_PIR_02");
	ta_pee(22,15,22,20,"WP_PIR_02");
	ta_sit_campfire(22,20,2,15,"WP_PIR_02");
	ta_stand_drinking(2,15,3,15,"WP_PIR_02");
	ta_sit_campfire(3,15,6,15,"WP_PIR_02");
};

func void rtn_follow_1361()
{
	ta_follow_player(8,0,20,0,"ADW_PIRATECAMP_ENTRANCE_SAW");
	ta_follow_player(20,0,8,0,"ADW_PIRATECAMP_ENTRANCE_SAW");
};

