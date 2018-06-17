
instance BDT_10007_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10007;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_NORMAL01,BODYTEX_P,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10007;
};


func void rtn_start_10007()
{
	ta_stand_drinking(9,0,21,0,"BL_ENTRANCE_SIDE_03");
	ta_stand_drinking(21,0,9,0,"BL_ENTRANCE_SIDE_03");
};

