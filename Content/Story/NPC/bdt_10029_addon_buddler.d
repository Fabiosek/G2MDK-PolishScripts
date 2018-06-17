
instance BDT_10029_ADDON_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_BUDDLER;
	guild = GIL_BDT;
	id = 10029;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_JACKAL,BODYTEX_L,itar_prisoner);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_10029;
};


func void rtn_start_10029()
{
	ta_stand_drinking(6,0,12,0,"ADW_MINE_25");
	ta_stand_drinking(12,0,6,0,"ADW_MINE_25");
};

func void rtn_work_10029()
{
	ta_pick_ore(8,0,23,0,"ADW_MINE_PICK_01");
	ta_pick_ore(23,0,8,0,"ADW_MINE_PICK_01");
};

