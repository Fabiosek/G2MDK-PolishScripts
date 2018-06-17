
instance BDT_1087_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1087;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_TAL_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_TOUGHBALD,BODYTEX_P,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,90);
	daily_routine = rtn_start_1087;
};


func void rtn_start_1087()
{
	ta_sit_campfire(9,0,21,0,"ADW_BANDIT_VP1_02");
	ta_sit_campfire(21,0,9,0,"ADW_BANDIT_VP1_02");
};

