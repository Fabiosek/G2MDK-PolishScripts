
instance BAU_4300_ADDON_CAVALORN(NPC_DEFAULT)
{
	name[0] = "Cavalorn";
	guild = GIL_NONE;
	id = 4300;
	voice = 8;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_NPCISRANGER] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_shortsword2);
	EquipItem(self,itrw_sld_bow);
	CreateInvItems(self,itar_bau_l,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_B_CAVALORN,BODYTEX_B,itar_ranger_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_4300;
};


func void rtn_start_4300()
{
	ta_stand_eating(5,0,20,0,"NW_XARDAS_GOBBO_01");
	ta_stand_eating(20,0,5,0,"NW_XARDAS_GOBBO_01");
};

func void rtn_killbandits_4300()
{
	ta_runtowp(5,0,20,0,"NW_XARDAS_BANDITS_LEFT");
	ta_runtowp(20,0,5,0,"NW_XARDAS_BANDITS_LEFT");
};

func void rtn_ornamentsteinring_4300()
{
	ta_stand_wp(5,0,20,0,"NW_LITTLESTONEHENDGE");
	ta_stand_wp(20,0,5,0,"NW_LITTLESTONEHENDGE");
};

func void rtn_prerangermeeting_4300()
{
	ta_rangermeeting(5,0,20,0,"NW_TAVERNE_06");
	ta_rangermeeting(20,0,5,0,"NW_TAVERNE_06");
};

func void rtn_rangermeeting_4300()
{
	ta_rangermeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	ta_rangermeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void rtn_parking_4300()
{
	ta_stand_armscrossed(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	ta_stand_armscrossed(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void rtn_stadt_4300()
{
	ta_sit_bench(5,0,20,0,"NW_CITY_MERCHANT_PATH_15");
	ta_sit_bench(20,0,5,0,"NW_CITY_MERCHANT_PATH_15");
};

