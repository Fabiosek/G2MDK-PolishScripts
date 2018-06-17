
instance BDT_10024_ADDON_GARAZ(NPC_DEFAULT)
{
	name[0] = "Garaz";
	guild = GIL_BDT;
	id = 10024;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMAL16,BODYTEX_N,itar_bloodwyn_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10024;
};


func void rtn_start_10024()
{
	ta_stand_guarding(6,0,12,0,"ADW_MINE_TO_MC_04");
	ta_stand_guarding(12,0,6,0,"ADW_MINE_TO_MC_04");
};

func void rtn_attack_10024()
{
	ta_guide_player(6,0,12,0,"ADW_MINE_MC_07");
	ta_guide_player(12,0,6,0,"ADW_MINE_MC_07");
};

func void rtn_gold_10024()
{
	ta_stand_guarding(6,0,12,0,"ADW_MINE_MC_GARAZ");
	ta_stand_guarding(12,0,6,0,"ADW_MINE_MC_GARAZ");
};

