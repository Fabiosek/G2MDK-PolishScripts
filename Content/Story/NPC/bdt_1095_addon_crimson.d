
instance BDT_1095_ADDON_CRIMSON(NPC_DEFAULT)
{
	name[0] = "Crimson";
	guild = GIL_BDT;
	id = 1095;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_sense);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_NORMALBART10,BODYTEX_N,itar_smith);
	Mdl_SetModelFatness(self,-2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,75);
	daily_routine = rtn_start_1095;
};


func void rtn_start_1095()
{
	ta_smith_fire(11,0,14,0,"ADW_MINE_HOEHLE_03");
	ta_smith_fire(14,0,11,0,"ADW_MINE_HOEHLE_03");
};

