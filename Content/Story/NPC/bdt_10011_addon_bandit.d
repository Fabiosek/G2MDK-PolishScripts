
instance BDT_10011_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10011;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_TAL_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_L_NORMALBART_RUFUS,BODYTEX_L,itar_prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_10011;
};


func void rtn_start_10011()
{
	ta_sit_bench(22,2,6,0,"ADW_SWAMP_SIT_BENCH_02");
	ta_smalltalk(6,0,22,2,"BL_FIGHT_03");
};

