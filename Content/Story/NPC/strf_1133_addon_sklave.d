
instance STRF_1133_ADDON_SKLAVE(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_SKLAVE;
	guild = GIL_STRF;
	id = 1133;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_NORMALBART01,BODYTEX_L,itar_prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_1133;
};


func void rtn_start_1133()
{
	ta_stand_wp(8,0,23,0,"ADW_MINE_SKLAVENTOD_03");
	ta_stand_wp(23,0,8,0,"ADW_MINE_SKLAVENTOD_03");
};

