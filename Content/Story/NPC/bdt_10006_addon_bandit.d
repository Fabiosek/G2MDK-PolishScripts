
instance BDT_10006_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10006;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_NORMAL02,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_10006;
};


func void rtn_start_10006()
{
	ta_sit_bench(2,0,16,0,"BL_MID_10_C");
	ta_cook_pan(16,0,20,0,"BL_DOWN_RING_05");
	ta_stand_eating(20,0,2,0,"BL_DOWN_RING_01");
};

