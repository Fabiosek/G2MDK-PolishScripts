
instance PIR_1350_ADDON_FRANCIS(NPC_DEFAULT)
{
	name[0] = "Francis";
	guild = GIL_PIR;
	id = 1350;
	voice = 13;
	flags = FALSE;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_schwert1);
	CreateInvItems(self,itke_greg_addon_mis,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_CIPHER_NEU,BODYTEX_N,itar_pir_m_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_1350;
};


func void rtn_start_1350()
{
	ta_sit_bench(5,0,20,0,"ADW_PIRATECAMP_HUT4_01");
	ta_sit_bench(20,0,5,0,"ADW_PIRATECAMP_HUT4_01");
};

func void rtn_gregisback_1350()
{
	ta_saw(5,0,20,0,"ADW_PIRATECAMP_BEACH_19");
	ta_saw(20,0,5,0,"ADW_PIRATECAMP_BEACH_19");
};

