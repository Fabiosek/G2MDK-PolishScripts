
instance BDT_10002_ADDON_BANDIT_M(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10002;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART02,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10002;
};


func void rtn_start_10002()
{
	ta_stand_armscrossed(9,0,21,0,"XXX");
	ta_stand_armscrossed(21,0,9,0,"XXX");
};

