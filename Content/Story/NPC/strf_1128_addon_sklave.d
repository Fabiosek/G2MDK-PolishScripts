
instance STRF_1128_ADDON_SKLAVE(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_SKLAVE;
	guild = GIL_STRF;
	id = 1128;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_B_NORMAL_ORIK,BODYTEX_B,itar_prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1128;
};


func void rtn_start_1128()
{
	ta_pick_ore(8,0,23,0,"ADW_MINE_19");
	ta_pick_ore(23,0,8,0,"ADW_MINE_19");
};

func void rtn_flucht_1128()
{
	ta_runtowp(8,0,23,0,"ADW_BL_HOEHLE_02");
	ta_runtowp(23,0,8,0,"ADW_BL_HOEHLE_02");
};

