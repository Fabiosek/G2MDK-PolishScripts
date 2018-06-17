
instance BDT_1084_ADDON_SENYAN(NPC_DEFAULT)
{
	name[0] = "Senyan";
	guild = GIL_BDT;
	id = 1084;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	aivar[AIV_STORYBANDIT] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_TOUGH_PACHO,BODYTEX_B,itar_bdt_m);
	Mdl_SetModelFatness(self,0.75);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1084;
};


func void rtn_start_1084()
{
	ta_stand_guarding(10,0,12,0,"BL_DOWN_CENTER_03");
	ta_stand_guarding(12,0,10,0,"BL_DOWN_CENTER_03");
};

