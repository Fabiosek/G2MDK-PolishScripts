
instance BDT_10025_ADDON_WACHE(NPC_DEFAULT)
{
	name[0] = "Kucharz";
	guild = GIL_BDT;
	id = 10025;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fatbald",FACE_B_NORMAL_KHARIM,BODYTEX_B,itar_barkeeper);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_10025;
};


func void rtn_start_10025()
{
	ta_cook_cauldron(6,0,12,0,"ADW_MINE_CAULDRON");
	ta_cook_cauldron(12,0,6,0,"ADW_MINE_CAULDRON");
};

