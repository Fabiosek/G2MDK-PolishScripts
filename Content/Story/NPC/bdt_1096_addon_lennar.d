
instance BDT_1096_ADDON_LENNAR(NPC_DEFAULT)
{
	name[0] = "Lennar";
	guild = GIL_BDT;
	id = 1096;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_nagelknueppel);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL20,BODYTEX_N,itar_prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_1096;
};


func void rtn_start_1096()
{
	ta_stand_drinking(1,50,19,30,"BL_DOWN_RING_03");
	ta_roast_scavenger(19,30,1,50,"BL_DOWN_RING_ROAST");
};

func void rtn_ruhe_1096()
{
	ta_stand_drinking(10,0,20,0,"ADW_MINE_22");
	ta_stand_drinking(20,0,10,0,"ADW_MINE_22");
};

func void rtn_mine_1096()
{
	ta_pick_ore(10,0,20,0,"ADW_MINE_PICK_09");
	ta_pick_ore(20,0,10,0,"ADW_MINE_PICK_09");
};

