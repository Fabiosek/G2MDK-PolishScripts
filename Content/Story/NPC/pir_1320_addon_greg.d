
instance PIR_1320_ADDON_GREG(NPC_DEFAULT)
{
	name[0] = "Greg";
	guild = GIL_PIR;
	id = 1320;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_piratensaebel);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_P_GREG,BODYTEX_P,itar_pir_h_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_1320;
};


func void rtn_start_1320()
{
	ta_stand_wp(5,0,20,0,"ADW_PIRATECAMP_GREG");
	ta_stand_wp(20,0,5,0,"ADW_PIRATECAMP_GREG");
};

func void rtn_home_1320()
{
	ta_sit_bench(22,0,12,0,"ADW_PIRATECAMP_HUT4_01");
	ta_sit_bench(12,0,22,0,"ADW_PIRATECAMP_HUT4_01");
};

