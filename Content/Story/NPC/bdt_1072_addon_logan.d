
instance BDT_1072_ADDON_LOGAN(NPC_DEFAULT)
{
	name[0] = "Logan";
	guild = GIL_BDT;
	id = 1072;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_bow_m_02);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_CIPHER_NEU,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,-0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_1072;
};


func void rtn_start_1072()
{
	ta_stand_guarding(9,0,21,0,"ADW_BANDIT_VP3_03");
	ta_stand_guarding(21,0,9,0,"ADW_BANDIT_VP3_03");
};

func void rtn_jagd_1072()
{
	ta_stand_guarding(9,0,21,0,"ADW_BANDIT_VP3_05");
	ta_stand_guarding(21,0,9,0,"ADW_BANDIT_VP3_05");
};

func void rtn_lager_1072()
{
	ta_stand_drinking(9,0,21,0,"BL_INN_03_C");
	ta_stand_drinking(21,0,9,0,"BL_INN_03_C");
};

func void rtn_mine_1072()
{
	ta_pick_ore(10,0,20,0,"ADW_MINE_PICK_08");
	ta_pick_ore(20,0,10,0,"ADW_MINE_PICK_08");
};

