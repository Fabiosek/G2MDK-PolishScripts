
instance NOV_653_TOTERNOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_TOTERNOVIZE;
	guild = GIL_NOV;
	id = 653;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_MORDRAG,BODYTEX_N,itar_nov_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_653;
};


func void rtn_start_653()
{
	ta_sleep(8,0,22,0,"NW_TROLLAREA_RITUALPATH_04");
	ta_sleep(22,0,8,0,"NW_TROLLAREA_RITUALPATH_04");
};

