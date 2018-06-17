
instance PIR_1353_ADDON_MORGAN(NPC_DEFAULT)
{
	name[0] = "Morgan";
	guild = GIL_PIR;
	id = 1353;
	voice = 7;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_doppelaxt);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_TOUGH_SANTINO,BODYTEX_L,itar_pir_m_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_1353;
};


func void rtn_start_1353()
{
	ta_sleep(5,0,20,0,"ADW_PIRATECAMP_CAVE_BED");
	ta_sleep(20,0,5,0,"ADW_PIRATECAMP_CAVE_BED");
};

func void rtn_gregisback_1353()
{
	ta_saw(23,0,9,0,"ADW_PIRATECAMP_SAW_01");
	ta_saw(9,0,23,0,"ADW_PIRATECAMP_SAW_01");
};

