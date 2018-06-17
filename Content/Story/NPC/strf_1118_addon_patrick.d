
instance STRF_1118_ADDON_PATRICK(NPC_DEFAULT)
{
	name[0] = "Patrick";
	guild = GIL_STRF;
	id = 1118;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_NORMALBART02,BODYTEX_L,itar_prisoner);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1118;
};


func void rtn_start_1118()
{
	ta_pick_ore(8,0,23,0,"ADW_MINE_LAGER_05");
	ta_pick_ore(23,0,8,0,"ADW_MINE_LAGER_05");
};

func void rtn_flucht_1118()
{
	ta_runtowp(8,0,23,0,"ADW_BL_HOEHLE_04");
	ta_runtowp(23,0,8,0,"ADW_BL_HOEHLE_04");
};

