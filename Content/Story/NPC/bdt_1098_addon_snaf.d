
instance BDT_1098_ADDON_SNAF(NPC_DEFAULT)
{
	name[0] = "Snaf";
	guild = GIL_BDT;
	id = 1098;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	CreateInvItems(self,itfo_addon_loushammer,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_SNAF,BODYTEX_N,itar_barkeeper);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_1098;
};


func void rtn_start_1098()
{
	ta_stand_sweeping(7,0,10,0,"BL_INN_BAR_02");
	ta_stand_wp(10,0,15,0,"BL_INN_BAR_05");
	ta_cook_cauldron(15,0,21,0,"BL_INN_BAR_05");
	ta_stand_wp(21,0,7,0,"BL_INN_BAR_05");
};

