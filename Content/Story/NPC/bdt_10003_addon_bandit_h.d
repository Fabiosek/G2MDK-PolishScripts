
instance BDT_10003_ADDON_BANDIT_H(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10003;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART10,BODYTEX_N,itar_bdt_h);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,90);
	daily_routine = rtn_start_10003;
};


func void rtn_start_10003()
{
	ta_stand_armscrossed(9,0,21,0,"XXX");
	ta_stand_armscrossed(21,0,9,0,"XXX");
};

