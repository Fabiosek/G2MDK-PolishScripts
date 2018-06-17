
instance BDT_10004_ADDON_FINN(NPC_DEFAULT)
{
	name[0] = "Finn";
	guild = GIL_BDT;
	id = 10004;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART02,BODYTEX_N,itar_prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10004;
};


func void rtn_start_10004()
{
	ta_stand_eating(10,0,20,0,"BL_DOWN_RING_04");
	ta_smalltalk(20,0,2,0,"BL_DOWN_RING_02");
	ta_sit_bench(2,0,10,0,"BL_DOWN_04_BENCH");
};

func void rtn_mine_10004()
{
	ta_pick_ore(10,0,20,0,"ADW_MINE_PICK_06");
	ta_pick_ore(20,0,10,0,"ADW_MINE_PICK_06");
};

