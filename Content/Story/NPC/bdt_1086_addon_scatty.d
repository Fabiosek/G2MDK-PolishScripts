
instance BDT_1086_ADDON_SCATTY(NPC_DEFAULT)
{
	name[0] = "Scatty";
	guild = GIL_BDT;
	id = 1086;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_schwert5);
	CreateInvItems(self,itmi_goldnugget_addon,5);
	CreateInvItems(self,itpo_health_03,2);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_SCATTY,BODYTEX_L,itar_diego);
	Mdl_SetModelFatness(self,1.6);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,75);
	daily_routine = rtn_start_1086;
};


func void rtn_start_1086()
{
	ta_stand_guarding(19,0,20,0,"BL_MINELAGER_06");
	ta_stand_guarding(20,0,9,0,"BL_MINELAGER_06");
};

