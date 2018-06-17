
instance BDT_1071_ADDON_RAMON(NPC_DEFAULT)
{
	name[0] = "Ramon";
	guild = GIL_BDT;
	id = 1071;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_TOUGHBALD01,BODYTEX_L,itar_bloodwyn_addon);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_1071;
};


func void rtn_start_1071()
{
	ta_guard_passage(9,0,21,0,"BL_ENTRANCE_04");
	ta_guard_passage(21,0,9,0,"BL_ENTRANCE_04");
};

