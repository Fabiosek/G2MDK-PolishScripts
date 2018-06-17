
instance BDT_10302_ADDON_RANGERBANDIT_L(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10302;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_addon_bandittrader);
	CreateInvItems(self,itwr_stoneplatecommon_addon,1);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL04,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_10302;
};


func void rtn_start_10302()
{
	ta_stand_armscrossed(8,0,23,0,"NW_FARM2_TO_TAVERN_RANGERBANDITS_01");
	ta_stand_armscrossed(23,0,8,0,"NW_FARM2_TO_TAVERN_RANGERBANDITS_01");
};

