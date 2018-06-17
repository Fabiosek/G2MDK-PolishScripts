
instance BDT_10009_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10009;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_nagelknueppel);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_WEAK_CUTTER,BODYTEX_P,itar_prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_10009;
};


func void rtn_start_10009()
{
	ta_smalltalk(8,0,10,0,"BL_UP_RING_04");
	ta_smalltalk(10,0,8,0,"BL_UP_RING_04");
};

