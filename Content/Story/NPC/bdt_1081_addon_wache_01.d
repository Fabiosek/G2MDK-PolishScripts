
instance BDT_1081_ADDON_WACHE_01(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_ESTEBAN_GUARD;
	guild = GIL_BDT;
	id = 1081;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	aivar[AIV_STORYBANDIT_ESTEBAN] = TRUE;
	aivar[AIV_STORYBANDIT] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_2h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMAL14,BODYTEX_N,itar_bloodwyn_addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1081;
};


func void rtn_start_1081()
{
	ta_stand_guarding(0,0,0,0,"BL_MID_07_B");
	ta_stand_guarding(0,0,0,0,"BL_MID_07_B");
};

func void rtn_ambush_1081()
{
	ta_stand_guarding(0,0,0,0,"BL_INN_OUTSIDE_01");
	ta_stand_guarding(0,0,0,0,"BL_INN_OUTSIDE_01");
};

