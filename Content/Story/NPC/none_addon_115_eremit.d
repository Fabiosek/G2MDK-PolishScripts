
instance NONE_ADDON_115_EREMIT(NPC_DEFAULT)
{
	name[0] = "Eremita";
	guild = GIL_NONE;
	id = 115;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_bau_mace);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_WEAK_BAALNETBEK,BODYTEX_N,NO_ARMOR);
	Mdl_SetModelFatness(self,1);
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_115;
};


func void rtn_start_115()
{
	ta_sit_bench(7,0,9,0,"ADW_VALLEY_BENCH");
	ta_cook_pan(9,0,11,0,"ADW_VALLEY_BENCH");
	ta_stand_eating(11,0,13,0,"ADW_VALLEY_BENCH");
	ta_sit_bench(13,0,15,0,"ADW_VALLEY_BENCH");
	ta_cook_pan(15,0,17,0,"ADW_VALLEY_BENCH");
	ta_stand_eating(17,0,19,0,"ADW_VALLEY_BENCH");
	ta_sit_bench(19,0,1,0,"ADW_VALLEY_BENCH");
	ta_sleep(1,0,7,0,"ADW_VALLEY_PATH_031_HUT");
};

