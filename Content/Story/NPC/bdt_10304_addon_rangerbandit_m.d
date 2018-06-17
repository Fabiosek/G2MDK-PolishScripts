
instance BDT_10304_ADDON_RANGERBANDIT_M(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10304;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_addon_bandittrader);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_TOUGH02,BODYTEX_L,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_10304;
};


func void rtn_start_10304()
{
	ta_smalltalk(8,0,23,0,"NW_FARM2_TO_TAVERN_07");
	ta_smalltalk(23,0,8,0,"NW_FARM2_TO_TAVERN_07");
};

