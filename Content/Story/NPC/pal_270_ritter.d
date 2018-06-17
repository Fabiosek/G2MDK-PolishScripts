
instance PAL_270_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 270;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_L_TOUGHBART_QUENTIN,BODYTEX_L,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_270;
};


func void rtn_start_270()
{
	ta_stand_guarding(8,0,23,0,"OC_EBR_STAND_THRONE_02");
	ta_stand_guarding(23,0,8,0,"OC_EBR_BASE_TO_FLOOR");
};

