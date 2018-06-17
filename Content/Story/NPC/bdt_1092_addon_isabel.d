
instance BDT_1092_ADDON_ISABEL(NPC_DEFAULT)
{
	name[0] = "Izabela";
	guild = GIL_BDT;
	id = 1092;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_N_BLACKHAIR,BODYTEXBABE_S,NO_ARMOR);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,25);
	daily_routine = rtn_start_1092;
};


func void rtn_start_1092()
{
	ta_smalltalk(7,1,12,0,"BL_INN_UP_07");
	ta_stand_drinking(12,0,1,5,"BL_INN_UP_05");
	ta_sleep(1,5,7,1,"BL_INN_UPSIDE_SLEEP_02");
};

