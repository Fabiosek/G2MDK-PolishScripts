
instance BDT_1083_ADDON_ESTEBAN(NPC_DEFAULT)
{
	name[0] = "Esteban";
	guild = GIL_BDT;
	id = 1083;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	aivar[AIV_STORYBANDIT_ESTEBAN] = TRUE;
	aivar[AIV_STORYBANDIT] = TRUE;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_axe);
	b_createambientinv(self);
	CreateInvItems(self,itmi_addon_stone_01,5);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_L_TOUGHBART_QUENTIN,BODYTEX_L,itar_bdt_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_1083;
};


func void rtn_start_1083()
{
	ta_stand_armscrossed(9,0,10,0,"BL_MID_07");
	ta_stand_armscrossed(10,0,9,0,"BL_MID_07");
};

