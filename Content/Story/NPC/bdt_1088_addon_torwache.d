
instance BDT_1088_ADDON_TORWACHE(NPC_DEFAULT)
{
	name[0] = NAME_TORWACHE;
	guild = GIL_BDT;
	id = 1088;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMALBART_HUNO,BODYTEX_N,itar_thorus_addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,85);
	daily_routine = rtn_start_1088;
};


func void rtn_start_1088()
{
	ta_guard_passage(9,0,21,0,"BL_UP_GUARD");
	ta_guard_passage(21,0,9,0,"BL_UP_GUARD");
};

