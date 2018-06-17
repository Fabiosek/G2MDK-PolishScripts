
instance BDT_10030_ADDON_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_BUDDLER;
	guild = GIL_BDT;
	id = 10030;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_P_NORMALBART_CRONOS,BODYTEX_P,itar_prisoner);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_10030;
};


func void rtn_start_10030()
{
	ta_stand_drinking(6,0,12,0,"ADW_MINE_22");
	ta_stand_drinking(12,0,6,0,"ADW_MINE_22");
};

