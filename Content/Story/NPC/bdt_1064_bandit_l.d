
instance BDT_1064_BANDIT_L(NPC_DEFAULT)
{
	name[0] = "Stra¿nik";
	guild = GIL_BDT;
	id = 1064;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_NORMAL_ORIK,BODYTEX_B,itar_leather_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1064;
};


func void rtn_start_1064()
{
	ta_guard_passage(0,0,12,0,"NW_CASTLEMINE_TOWER_BEYOND");
	ta_guard_passage(12,0,0,0,"NW_CASTLEMINE_TOWER_BEYOND");
};

