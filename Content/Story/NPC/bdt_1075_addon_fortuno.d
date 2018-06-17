
instance BDT_1075_ADDON_FORTUNO(NPC_DEFAULT)
{
	name[0] = "Fortuno";
	guild = GIL_BDT;
	id = 1075;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_sword_l_03);
	CreateInvItems(self,itmi_joint,5);
	CreateInvItems(self,itpl_swampherb,3);
	CreateInvItems(self,itpl_mushroom_01,5);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_FORTUNO,BODYTEX_T,itar_lester);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,75);
	daily_routine = rtn_prestart_1075;
};


func void rtn_prestart_1075()
{
	ta_stand_armscrossed(8,0,18,0,"BL_DOWN_SIDE_HERB");
	ta_stand_armscrossed(18,0,8,0,"BL_DOWN_SIDE_HERB");
};

func void rtn_start_1075()
{
	ta_smoke_joint(8,0,8,10,"BL_DOWN_SIDE_HERB");
	ta_stomp_herb(8,10,12,0,"BL_DOWN_SIDE_HERB");
	ta_smalltalk(12,0,15,0,"BL_DOWN_RING_02");
	ta_sit_bench(15,0,17,0,"BL_DOWN_04_BENCH");
	ta_smoke_waterpipe(17,0,19,0,"BL_DOWN_SIDE_03");
	ta_smalltalk(19,0,22,0,"BL_DOWN_RING_02");
	ta_smoke_joint(22,0,0,0,"BL_DOWN_RING_04");
	ta_sleep(0,0,8,0,"BL_DOWN_SIDE_HERB");
};

