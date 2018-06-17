
instance STRF_1122_ADDON_PARDOS(NPC_DEFAULT)
{
	name[0] = "Pardos";
	guild = GIL_STRF;
	id = 1122;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 70;
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_ASGHAN,BODYTEX_N,itar_prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1122;
};


func void rtn_start_1122()
{
	ta_sit_campfire(8,0,23,0,"ADW_MINE_LAGER_SIDE_04");
	ta_sit_campfire(23,0,8,0,"ADW_MINE_LAGER_SIDE_04");
};

func void rtn_flucht_1122()
{
	ta_runtowp(8,0,23,0,"ADW_BL_HOEHLE_03");
	ta_runtowp(23,0,8,0,"ADW_BL_HOEHLE_03");
};

