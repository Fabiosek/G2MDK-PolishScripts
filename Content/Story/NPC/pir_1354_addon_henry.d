
instance PIR_1354_ADDON_HENRY(NPC_DEFAULT)
{
	name[0] = "Henry";
	guild = GIL_PIR;
	id = 1354;
	voice = 4;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_krummschwert);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_NORMAL01,BODYTEX_P,itar_pir_m_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,90);
	daily_routine = rtn_start_1354;
};


func void rtn_start_1354()
{
	ta_guard_passage(5,0,20,0,"ADW_PIRATECAMP_WAY_04");
	ta_guard_passage(20,0,5,0,"ADW_PIRATECAMP_WAY_04");
};

