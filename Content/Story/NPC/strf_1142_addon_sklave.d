
instance STRF_1142_ADDON_SKLAVE(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_SKLAVE;
	guild = GIL_STRF;
	id = 1142;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_OLDBALD_JEREMIAH,BODYTEX_N,itar_prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_1142;
};


func void rtn_start_1142()
{
	ta_stand_wp(8,0,23,0,"BL_UP_PLACE_04_SIDE_02");
	ta_stand_wp(23,0,8,0,"BL_UP_PLACE_04_SIDE_02");
};

