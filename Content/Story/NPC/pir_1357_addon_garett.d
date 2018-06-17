
instance PIR_1357_ADDON_GARETT(NPC_DEFAULT)
{
	name[0] = "Garett";
	guild = GIL_PIR;
	id = 1357;
	voice = 9;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_piratensaebel);
	CreateInvItems(self,itbe_addon_prot_edgpoi,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_NORMALBART05,BODYTEX_N,itar_pir_l_addon);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_1357;
};


func void rtn_start_1357()
{
	ta_stand_wp(8,0,20,0,"ADW_PIRATECAMP_HUT1_01");
	ta_stand_drinking(20,0,8,0,"ADW_PIRATECAMP_BEACH_10");
};

