
instance PIR_1362_ADDON_BONES(NPC_DEFAULT)
{
	name[0] = "Bones";
	guild = GIL_PIR;
	id = 1362;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_addon_pir2haxe);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMALBART10,BODYTEX_N,itar_pir_m_addon);
	Mdl_SetModelFatness(self,1.3);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_prestart_1362;
};


func void rtn_prestart_1362()
{
	ta_practice_sword(8,0,20,0,"ADW_PIRATECAMP_TRAIN_01");
	ta_practice_sword(20,0,8,0,"ADW_PIRATECAMP_TRAIN_01");
};

func void rtn_start_1362()
{
	ta_practice_sword(6,55,19,55,"ADW_PIRATECAMP_TRAIN_01");
	ta_stand_drinking(19,55,20,55,"WP_PIR_04");
	ta_sit_campfire(20,55,0,55,"WP_PIR_04");
	ta_stand_drinking(0,55,1,55,"WP_PIR_04");
	ta_sit_campfire(1,55,6,55,"WP_PIR_04");
};

