
instance BDT_1074_ADDON_EDGOR(NPC_DEFAULT)
{
	name[0] = "Edgor";
	guild = GIL_BDT;
	id = 1074;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMALBART20,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_1074;
};


func void rtn_start_1074()
{
	ta_sit_campfire(9,0,12,0,"ADW_BANDIT_VP1_09");
	ta_sit_campfire(12,0,9,0,"ADW_BANDIT_VP1_09");
};

