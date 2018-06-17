
instance BDT_10021_ADDON_WACHE(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_GUARD;
	guild = GIL_BDT;
	id = 10021;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_zweihaender4);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_P_NORMAL02,BODYTEX_P,itar_thorus_addon);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10021;
};


func void rtn_start_10021()
{
	ta_stand_guarding(0,0,12,0,"BL_RAVEN_GUARD_04");
	ta_stand_guarding(12,0,0,0,"BL_RAVEN_GUARD_04");
};

