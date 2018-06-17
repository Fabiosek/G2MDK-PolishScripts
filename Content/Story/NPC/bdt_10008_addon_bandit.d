
instance BDT_10008_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10008;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_orcaxe_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_TOUGH_SILAS,BODYTEX_B,itar_prisoner);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10008;
};


func void rtn_start_10008()
{
	ta_cook_cauldron(8,0,12,0,"BL_DOWN_CENTER_07");
	ta_pee(12,0,12,5,"BL_DOWN_CENTER_07_C");
	ta_cook_cauldron(12,5,16,0,"BL_DOWN_CENTER_07");
	ta_pee(16,0,16,5,"BL_DOWN_CENTER_07_C");
	ta_cook_cauldron(16,5,0,0,"BL_DOWN_CENTER_07");
	ta_pee(0,0,0,5,"BL_DOWN_CENTER_07_C");
	ta_sit_bench(0,5,8,0,"BL_DOWN_RING_05");
};

