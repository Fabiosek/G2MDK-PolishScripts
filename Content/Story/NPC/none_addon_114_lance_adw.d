
instance NONE_ADDON_114_LANCE_ADW(NPC_DEFAULT)
{
	name[0] = "Lance";
	guild = GIL_NONE;
	id = 114;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NPCISRANGER] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	EquipItem(self,itrw_sld_bow);
	CreateInvItems(self,itri_lancering,1);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL02,BODYTEX_N,itar_ranger_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,25);
	daily_routine = rtn_prestart_114;
};


func void rtn_prestart_114()
{
	ta_stand_armscrossed(8,0,22,0,"ADW_PATH_TO_LOCH_00");
	ta_stand_armscrossed(22,0,8,0,"ADW_PATH_TO_LOCH_00");
};

