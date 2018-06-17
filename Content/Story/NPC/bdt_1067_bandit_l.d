
instance BDT_1067_BANDIT_L(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1067;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL20,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1067;
};


func void rtn_start_1067()
{
	ta_sleep(0,0,12,0,"NW_CASTLEMINE_TOWER_08");
	ta_sleep(12,0,0,0,"NW_CASTLEMINE_TOWER_08");
};

