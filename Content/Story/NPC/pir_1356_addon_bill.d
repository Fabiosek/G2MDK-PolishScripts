
instance PIR_1356_ADDON_BILL(NPC_DEFAULT)
{
	name[0] = "Bill";
	guild = GIL_PIR;
	id = 1356;
	voice = 3;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_addon_pir1haxe);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_DRAX,BODYTEX_N,itar_pir_l_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_prestart_1356;
};


func void rtn_prestart_1356()
{
	ta_saw(8,0,20,0,"ADW_PIRATECAMP_SAW_01");
	ta_saw(20,0,8,0,"ADW_PIRATECAMP_SAW_01");
};

func void rtn_start_1356()
{
	ta_saw(8,0,20,0,"ADW_PIRATECAMP_SAW_01");
	ta_stand_eating(20,0,21,0,"WP_PIR_01");
	ta_sit_campfire(21,0,8,0,"WP_PIR_01");
};

func void rtn_gregisback_1356()
{
	ta_sit_campfire(8,0,20,0,"WP_PIR_01");
	ta_stand_eating(20,0,21,0,"WP_PIR_01");
	ta_sit_campfire(21,0,8,0,"WP_PIR_01");
};

