
instance PC_THIEFOW(NPC_DEFAULT)
{
	name[0] = "Diego";
	guild = GIL_NONE;
	id = 1;
	voice = 11;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_FOLLOWDIST] = 300;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_bow_m_03);
	b_createambientinv(self);
	CreateInvItems(self,itpo_health_03,10);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_L_DIEGO,BODYTEX_L,itar_diego);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_1;
};


func void rtn_start_1()
{
	ta_sit_bench(8,0,23,0,"LOCATION_02_05");
	ta_sit_bench(23,0,8,0,"LOCATION_02_05");
};

func void rtn_follow_1()
{
	ta_follow_player(8,0,23,0,"LOCATION_02_05");
	ta_follow_player(23,0,8,0,"LOCATION_02_05");
};

func void rtn_tot_1()
{
	ta_sit_bench(8,0,23,0,"TOT");
	ta_sit_bench(23,0,8,0,"TOT");
};

func void rtn_xardas_1()
{
	ta_stand_eating(8,0,23,0,"OW_PATH_129");
	ta_stand_eating(23,0,8,0,"OW_PATH_129");
};

func void rtn_fajeth_1()
{
	ta_stand_eating(8,0,23,0,"OW_ORC_LOOKOUT_2_03");
	ta_stand_eating(23,0,8,0,"OW_ORC_LOOKOUT_2_03");
};

func void rtn_silvestro_1()
{
	ta_stand_eating(8,0,23,0,"SPAWN_OW_SCAVENGER_01_DEMONT5");
	ta_stand_eating(23,0,8,0,"SPAWN_OW_SCAVENGER_01_DEMONT5");
};

func void rtn_grimes_1()
{
	ta_smoke_joint(8,0,23,0,"OW_PATH_155");
	ta_smoke_joint(23,0,8,0,"OW_PATH_155");
};

func void rtn_pass_1()
{
	ta_sit_campfire(8,0,23,0,"START");
	ta_sit_campfire(23,0,8,0,"START");
};

