
instance BDT_1093_ADDON_FRANCO(NPC_DEFAULT)
{
	name[0] = "Franko";
	guild = GIL_BDT;
	id = 1093;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	aivar[AIV_STORYBANDIT] = TRUE;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	CreateInvItems(self,itmi_goldnugget_addon,7);
	CreateInvItems(self,itam_addon_franco,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_TOUGH01,BODYTEX_L,itar_bdt_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1093;
};


func void rtn_start_1093()
{
	ta_stand_guarding(6,0,20,0,"ADW_PATH_TO_BL_02");
	ta_stand_guarding(20,0,0,0,"BANDIT_FIGHT");
	ta_stand_eating(0,0,3,0,"BANDIT_FIGHT");
	ta_stand_drinking(3,0,6,0,"BANDIT_FIGHT");
};

