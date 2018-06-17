
instance PIR_1371_ADDON_HANK(NPC_DEFAULT)
{
	name[0] = "Hank";
	guild = GIL_PIR;
	id = 1371;
	voice = 6;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_addon_pir1hsword);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_LEFTY,BODYTEX_N,itar_pir_l_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1370;
};


func void rtn_start_1371()
{
	ta_smalltalk(5,0,20,0,"ADW_PIRATECAMP_WATERHOLE_CAVE");
	ta_smalltalk(20,0,5,0,"ADW_PIRATECAMP_WATERHOLE_CAVE");
};

