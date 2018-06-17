
instance STRF_1110_STRAEFLING(NPC_DEFAULT)
{
	name[0] = NAME_STRAEFLING;
	guild = GIL_STRF;
	id = 1110;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_ORRY,BODYTEX_N,itar_prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_1110;
};


func void rtn_start_1110()
{
	ta_pick_ore(8,0,23,0,"OW_NEWMINE_06_B");
	ta_pick_ore(23,0,8,0,"OW_NEWMINE_06_B");
};

