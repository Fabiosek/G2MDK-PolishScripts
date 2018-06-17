
instance BDT_1082_ADDON_SKINNER(NPC_DEFAULT)
{
	name[0] = "Skinner";
	guild = GIL_BDT;
	id = 1082;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	aivar[AIV_STORYBANDIT] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_addon_betty);
	b_createambientinv(self);
	CreateInvItems(self,itke_addon_skinner,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_TOUGH01,BODYTEX_L,itar_bdt_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1082;
};


func void rtn_start_1082()
{
	ta_sleep(9,0,21,0,"BL_DOWN_HUT_02_SLEEP");
	ta_sleep(21,0,9,0,"BL_DOWN_HUT_02_SLEEP");
};

