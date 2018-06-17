
instance BDT_1070_ADDON_PAUL(NPC_DEFAULT)
{
	name[0] = "Paul";
	guild = GIL_BDT;
	id = 1070;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_sld_axe);
	b_createambientinv(self);
	CreateInvItems(self,itmi_nugget,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_DRAX,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,45);
	daily_routine = rtn_prestart_1070;
};


func void rtn_prestart_1070()
{
	ta_saw(6,0,13,0,"BL_SMITH_YARD_SAW");
	ta_saw(13,0,6,0,"BL_SMITH_YARD_SAW");
};

func void rtn_away_1070()
{
	ta_stand_drinking(10,0,20,0,"BL_SMITH_STAIRS");
	ta_stand_drinking(20,0,10,0,"BL_SMITH_STAIRS");
};

func void rtn_start_1070()
{
	ta_saw(6,0,13,0,"BL_SMITH_YARD_SAW");
	ta_smith_anvil(13,0,17,0,"BL_UP_02");
	ta_saw(17,0,19,0,"BL_SMITH_YARD_SAW");
	ta_smith_sharp(19,0,23,0,"BL_SMITH_YARD_02");
	ta_stand_drinking(23,0,6,0,"BL_UP_10");
};

func void rtn_mine_1070()
{
	ta_pick_ore(10,0,20,0,"ADW_MINE_PICK_07");
	ta_pick_ore(20,0,10,0,"ADW_MINE_PICK_07");
};

