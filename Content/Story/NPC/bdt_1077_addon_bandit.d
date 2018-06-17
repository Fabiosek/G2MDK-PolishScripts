
instance BDT_1077_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1077;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_TAL_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_P_NORMAL01,BODYTEX_P,itar_bdt_m);
	Mdl_SetModelFatness(self,-0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,90);
	daily_routine = rtn_start_1077;
};


func void rtn_start_1077()
{
	ta_smalltalk(6,0,12,0,"BL_SMALLTALK_01");
	ta_smith_sharp(12,0,22,4,"ADW_PATH_TO_BL_SHARP");
	ta_roast_scavenger(22,4,6,0,"ADW_SWAMP_ROAST");
};

