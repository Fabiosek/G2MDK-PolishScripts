
instance BDT_10102_ADDON_TOWERBANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10102;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_L_NORMAL_GORNABAR,BODYTEX_L,itar_bdt_m);
	Mdl_SetModelFatness(self,0.7);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10102;
};


func void rtn_start_10102()
{
	ta_stand_drinking(9,0,21,0,"ADW_PIRATECAMP_2_TOWER_05");
	ta_stand_drinking(21,0,9,0,"ADW_PIRATECAMP_2_TOWER_05");
};

