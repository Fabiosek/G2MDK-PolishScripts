
instance PIR_1370_ADDON_ANGUS(NPC_DEFAULT)
{
	name[0] = "Angus";
	guild = GIL_PIR;
	id = 1370;
	voice = 6;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_addon_pir2haxe);
	CreateInvItems(self,itri_addon_morgansring_mission,1);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART21,BODYTEX_N,itar_pir_m_addon);
	Mdl_SetModelFatness(self,1.3);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1370;
};


func void rtn_start_1370()
{
	ta_smalltalk(5,0,20,0,"ADW_PIRATECAMP_WATERHOLE_CAVE");
	ta_smalltalk(20,0,5,0,"ADW_PIRATECAMP_WATERHOLE_CAVE");
};

