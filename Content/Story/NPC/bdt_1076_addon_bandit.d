
instance BDT_1076_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1076;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_TAL_AMBIENT;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mace_l_04);
	EquipItem(self,itrw_bow_m_02);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART06,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,90);
	daily_routine = rtn_start_1076;
};


func void rtn_start_1076()
{
	ta_smalltalk(6,0,12,0,"BL_SMALLTALK_01");
	ta_cook_cauldron(12,0,22,0,"ADW_PATH_TO_BL_COOK");
	ta_stand_eating(22,0,6,0,"BL_FIGHT_04");
};

