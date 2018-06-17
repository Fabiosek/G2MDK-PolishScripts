
instance BDT_10005_ADDON_WACHE_02(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_ESTEBAN_GUARD;
	guild = GIL_BDT;
	id = 10005;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	aivar[AIV_STORYBANDIT_ESTEBAN] = TRUE;
	aivar[AIV_STORYBANDIT] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_axe);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_NORMAL_ORIK,BODYTEX_B,itar_bloodwyn_addon);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,45);
	daily_routine = rtn_start_10005;
};


func void rtn_start_10005()
{
	ta_stand_guarding(9,0,21,0,"BL_MID_07_SHARP");
	ta_stand_guarding(21,0,9,0,"BL_MID_07_SHARP");
};

func void rtn_ambush_10005()
{
	ta_stand_guarding(9,0,21,0,"BL_INN_OUTSIDE_02");
	ta_stand_guarding(21,0,9,0,"BL_INN_OUTSIDE_02");
};

