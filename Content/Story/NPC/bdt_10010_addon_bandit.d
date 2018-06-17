
instance BDT_10010_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10010;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_BL_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_nagelknueppel);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_NORMALBART_RUFUS,BODYTEX_L,itar_bdt_m);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_10010;
};


func void rtn_start_10010()
{
	ta_sit_bench(10,0,12,0,"BL_MID_09");
	ta_sit_bench(12,0,10,0,"BL_MID_09");
};

