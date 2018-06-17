
instance STRF_1119_ADDON_MONTY(NPC_DEFAULT)
{
	name[0] = "Monty";
	guild = GIL_STRF;
	id = 1119;
	voice = 8;
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
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMALBART04,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1119;
};


func void rtn_start_1119()
{
	ta_pick_ore(8,0,23,0,"ADW_MINE_LAGER_06");
	ta_pick_ore(23,0,8,0,"ADW_MINE_LAGER_06");
};

func void rtn_flucht_1119()
{
	ta_runtowp(8,0,23,0,"ADW_BL_HOEHLE_03");
	ta_runtowp(23,0,8,0,"ADW_BL_HOEHLE_03");
};

