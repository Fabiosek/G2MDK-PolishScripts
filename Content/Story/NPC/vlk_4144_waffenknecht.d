
instance VLK_4144_WAFFENKNECHT(NPC_DEFAULT)
{
	name[0] = NAME_WAFFENKNECHT;
	guild = GIL_MIL;
	id = 4144;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_OCAMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL07,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4144;
};


func void rtn_start_4144()
{
	ta_smalltalk(8,0,23,0,"OC_CENTER_02");
	ta_play_lute(23,0,8,0,"OC_KNECHTCAMP_01");
};

