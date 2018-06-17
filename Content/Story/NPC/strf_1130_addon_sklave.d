
instance STRF_1130_ADDON_SKLAVE(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_SKLAVE;
	guild = GIL_STRF;
	id = 1130;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_L_TOUGHBART_QUENTIN,BODYTEX_L,itar_prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_1130;
};


func void rtn_start_1130()
{
	ta_pick_ore(8,0,23,0,"ADW_MINE_SLAVE_01");
	ta_pick_ore(23,0,8,0,"ADW_MINE_SLAVE_01");
};

func void rtn_flucht_1130()
{
	ta_runtowp(8,0,23,0,"ADW_BL_HOEHLE_02");
	ta_runtowp(23,0,8,0,"ADW_BL_HOEHLE_02");
};

