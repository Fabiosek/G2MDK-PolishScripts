
instance STRF_1121_ADDON_TELBOR(NPC_DEFAULT)
{
	name[0] = "Telbor";
	guild = GIL_STRF;
	id = 1121;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fatbald",FACE_B_NORMAL01,BODYTEX_B,itar_prisoner);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1121;
};


func void rtn_start_1121()
{
	ta_pick_ore(8,0,23,0,"ADW_MINE_LAGER_SIDE_PICK_02");
	ta_pick_ore(23,0,8,0,"ADW_MINE_LAGER_SIDE_PICK_02");
};

func void rtn_flucht_1121()
{
	ta_runtowp(8,0,23,0,"ADW_BL_HOEHLE_03");
	ta_runtowp(23,0,8,0,"ADW_BL_HOEHLE_03");
};

