
instance VLK_4304_ADDON_WILLIAM(NPC_DEFAULT)
{
	name[0] = "William";
	guild = GIL_VLK;
	id = 4304;
	voice = 6;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	CreateInvItems(self,itwr_addon_william_01,1);
	CreateInvItems(self,itke_lockpick,2);
	CreateInvItems(self,itfo_apple,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_HOMER,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4304;
};


func void rtn_start_4304()
{
	ta_smalltalk(5,0,20,0,"ADW_ENTRANCE_RUIN2_02");
	ta_smalltalk(20,0,5,0,"ADW_ENTRANCE_RUIN2_02");
};

