
instance PIR_1360_ADDON_PIRAT(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_PIRAT;
	guild = GIL_PIR;
	id = 1360;
	voice = 7;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_L_RATFORD,BODYTEX_L,itar_pir_l_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_prestart_1360;
};


func void rtn_prestart_1360()
{
	ta_repair_hut(8,0,20,0,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
	ta_repair_hut(20,0,8,0,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
};

func void rtn_start_1360()
{
	ta_repair_hut(6,10,19,10,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
	ta_sit_campfire(19,10,20,10,"WP_PIR_06");
	ta_stand_drinking(20,10,21,10,"WP_PIR_06");
	ta_sit_campfire(21,10,3,10,"WP_PIR_06");
	ta_pee(3,10,3,15,"WP_PIR_06");
	ta_sit_campfire(3,15,6,10,"WP_PIR_06");
};

func void rtn_follow_1360()
{
	ta_follow_player(8,0,20,0,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
	ta_follow_player(20,0,8,0,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
};

