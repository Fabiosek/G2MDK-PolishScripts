
instance BDT_10018_ADDON_TORWACHE(NPC_DEFAULT)
{
	name[0] = NAME_TORWACHE;
	guild = GIL_BDT;
	id = 10018;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_L_JACKAL,BODYTEX_L,itar_thorus_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10018;
};


func void rtn_start_10018()
{
	ta_guard_passage(0,0,12,0,"BL_RAVEN_GUARD_01");
	ta_guard_passage(12,0,0,0,"BL_RAVEN_GUARD_01");
};

