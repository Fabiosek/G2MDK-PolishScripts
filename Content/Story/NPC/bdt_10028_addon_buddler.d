
instance BDT_10028_ADDON_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_ADDON_BUDDLER;
	guild = GIL_BDT;
	id = 10028;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_TOUGHBALD,BODYTEX_B,itar_prisoner);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_10028;
};


func void rtn_start_10028()
{
	ta_smalltalk(6,0,12,0,"ADW_MINE_22");
	ta_smalltalk(12,0,6,0,"ADW_MINE_22");
};

func void rtn_work_10028()
{
	ta_pick_ore(8,0,23,0,"ADW_MINE_PICK_03");
	ta_pick_ore(23,0,8,0,"ADW_MINE_PICK_03");
};

