
instance PIR_1351_ADDON_SAMUEL(NPC_DEFAULT)
{
	name[0] = "Samuel";
	guild = GIL_PIR;
	id = 1351;
	voice = 14;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mace_l_03);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBAld",FACE_B_SATURAS,BODYTEX_B,itar_pir_l_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1351;
};


func void rtn_start_1351()
{
	ta_potion_alchemy(6,0,8,0,"ADW_PIRATECAMP_CAVE1_04");
	ta_stand_drinking(8,0,10,0,"ADW_PIRATECAMP_CAVE1_02");
	ta_potion_alchemy(10,0,12,0,"ADW_PIRATECAMP_CAVE1_04");
	ta_stand_drinking(12,0,14,0,"ADW_PIRATECAMP_CAVE1_02");
	ta_potion_alchemy(14,0,16,0,"ADW_PIRATECAMP_CAVE1_04");
	ta_stand_drinking(16,0,18,0,"ADW_PIRATECAMP_CAVE1_02");
	ta_potion_alchemy(18,0,20,0,"ADW_PIRATECAMP_CAVE1_04");
	ta_stand_drinking(20,0,22,0,"ADW_PIRATECAMP_CAVE1_02");
	ta_potion_alchemy(22,0,6,0,"ADW_PIRATECAMP_CAVE1_04");
};

