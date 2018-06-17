
instance BDT_1073_ADDON_SANCHO(NPC_DEFAULT)
{
	name[0] = "Sancho";
	guild = GIL_BDT;
	id = 1073;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_MORDRAG,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1073;
};


func void rtn_start_1073()
{
	ta_stand_drinking(9,0,21,0,"ADW_BANDIT_VP1_01");
	ta_stand_drinking(21,0,9,0,"ADW_BANDIT_VP1_01");
};

