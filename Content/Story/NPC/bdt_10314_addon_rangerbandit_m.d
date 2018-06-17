
instance BDT_10314_ADDON_RANGERBANDIT_M(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10314;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_bau_mace);
	EquipItem(self,itrw_sld_bow);
	CreateInvItems(self,itmi_bromorsgeld_addon,1);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL03,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	start_aistate = zs_bandit;
};

