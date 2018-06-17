
instance BDT_10015_ADDON_EMILIO(NPC_DEFAULT)
{
	name[0] = "Emilio";
	guild = GIL_BDT;
	id = 10015;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_P_NORMALBART01,BODYTEX_P,itar_prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_10015;
};


func void rtn_start_10015()
{
	ta_sit_bench(2,0,11,0,"BL_INN_01_BENCH");
	ta_sit_bench(11,0,2,0,"BL_INN_01_BENCH");
};

func void rtn_mine_10015()
{
	ta_pick_ore(10,0,20,0,"ADW_MINE_09_PICK");
	ta_pick_ore(20,0,10,0,"ADW_MINE_09_PICK");
};

