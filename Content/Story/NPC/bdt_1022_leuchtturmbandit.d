
instance BDT_1022_LEUCHTTURMBANDIT(NPC_DEFAULT)
{
	name[0] = "Bandyta";
	guild = GIL_BDT;
	id = 1022;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_axe);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_NORMALBART04,BODYTEX_N,itar_bdt_h);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	start_aistate = zs_bandit;
};

