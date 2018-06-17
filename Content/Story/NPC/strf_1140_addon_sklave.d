
instance STRF_1140_ADDON_SKLAVE(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_SKLAVE;
	guild = GIL_STRF;
	id = 1140;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_NORMALBART01,BODYTEX_P,itar_prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_1140;
};


func void rtn_start_1140()
{
	ta_pick_ore(8,0,23,0,"ADW_MINE_PICK_01");
	ta_pick_ore(23,0,8,0,"ADW_MINE_PICK_01");
};

