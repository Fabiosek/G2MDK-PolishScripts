
instance BDT_1078_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1078;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_TAL_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_mace_l_01);
	EquipItem(self,itrw_bow_m_02);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_RICHTER,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,-0.75);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1078;
};


func void rtn_start_1078()
{
	ta_sit_campfire(20,0,12,5,"ADW_BANDIT_VP1_08_B");
	ta_stand_guarding(12,5,20,0,"ADW_BANDIT_VP1_07_B");
};

