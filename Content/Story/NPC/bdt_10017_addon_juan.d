
instance BDT_10017_ADDON_JUAN(NPC_DEFAULT)
{
	name[0] = "Juan";
	guild = GIL_BDT;
	id = 10017;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_2h_sld_axe);
	CreateInvItems(self,itmi_addon_steel_paket,1);
	CreateInvItems(self,itmi_addon_lennar_paket,1);
	CreateInvItems(self,itfo_addon_grog,20);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_L_NORMALBART01,BODYTEX_L,itar_bdt_h);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10017;
};


func void rtn_start_10017()
{
	ta_sit_campfire(2,0,10,0,"ADW_SENAT_CAVE_SIT");
	ta_sit_campfire(10,0,2,0,"ADW_SENAT_CAVE_SIT");
};

