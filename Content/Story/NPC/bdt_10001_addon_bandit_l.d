
instance BDT_10001_ADDON_BANDIT_L(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10001;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_IMPORTANT_ARTO,BODYTEX_N,itar_bloodwyn_addon);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_10001;
};


func void rtn_start_10001()
{
	ta_smalltalk(10,0,12,0,"BL_UP_RING_02");
	ta_smalltalk(12,0,10,0,"BL_UP_RING_02");
};

