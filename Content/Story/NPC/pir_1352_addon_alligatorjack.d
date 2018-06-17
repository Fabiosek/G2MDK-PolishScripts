
instance PIR_1352_ADDON_ALLIGATORJACK(NPC_DEFAULT)
{
	name[0] = "Jack Aligator";
	guild = GIL_PIR;
	id = 1352;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_FOLLOWDIST] = 800;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_piratensaebel);
	CreateInvItems(self,itpo_health_02,4);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_CORANGAR,BODYTEX_B,itar_pir_m_addon);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,90);
	daily_routine = rtn_prestart_1352;
};


func void rtn_prestart_1352()
{
	ta_stand_eating(5,0,20,0,"ADW_ENTRANCE_2_PIRATECAMP_01");
	ta_stand_eating(20,0,5,0,"ADW_ENTRANCE_2_PIRATECAMP_01");
};

func void rtn_start_1352()
{
	ta_sleep(23,0,6,0,"ADW_PIRATECAMP_AJ_04");
	ta_cook_pan(6,0,8,30,"AD_PIRATECAMP_AJ_03");
	ta_sit_campfire(8,30,12,0,"AD_PIRATECAMP_AJ_03");
	ta_stand_armscrossed(12,30,19,0,"ADW_PIRATECAMP_WAY_07");
	ta_cook_pan(19,0,20,30,"AD_PIRATECAMP_AJ_03");
	ta_sit_campfire(20,30,23,0,"AD_PIRATECAMP_AJ_03");
};

func void rtn_hunt1_1352()
{
	ta_guide_player(1,0,13,0,"ADW_PIRATECAMP_WAY_16");
	ta_guide_player(13,0,1,0,"ADW_PIRATECAMP_WAY_16");
};

func void rtn_hunt2_1352()
{
	ta_guide_player(1,0,13,0,"ADW_PIRATECAMP_WATERHOLE_07");
	ta_guide_player(13,0,1,0,"ADW_PIRATECAMP_WATERHOLE_07");
};

func void rtn_hunt3_1352()
{
	ta_guide_player(1,0,13,0,"ADW_PIRATECAMP_WAY_16");
	ta_guide_player(13,0,1,0,"ADW_PIRATECAMP_WAY_16");
};

func void rtn_hunt4_1352()
{
	ta_guide_player(1,0,13,0,"ADW_CANYON_TELEPORT_PATH_06");
	ta_guide_player(13,0,1,0,"ADW_CANYON_TELEPORT_PATH_06");
};

func void rtn_piratecamp_1352()
{
	ta_guide_player(1,0,13,0,"ADW_PIRATECAMP_WAY_07");
	ta_guide_player(13,0,1,0,"ADW_PIRATECAMP_WAY_07");
};

func void rtn_gregisback_1352()
{
	ta_sleep(3,0,6,0,"ADW_PIRATECAMP_AJ_04");
	ta_cook_pan(6,0,7,0,"AD_PIRATECAMP_AJ_03");
	ta_stand_armscrossed(7,0,10,0,"ADW_PIRATECAMP_WAY_07");
	ta_sit_campfire(10,0,11,0,"AD_PIRATECAMP_AJ_03");
	ta_stand_armscrossed(11,30,16,0,"ADW_PIRATECAMP_WAY_07");
	ta_cook_pan(16,0,17,0,"AD_PIRATECAMP_AJ_03");
	ta_stand_armscrossed(17,0,20,0,"ADW_PIRATECAMP_WAY_07");
	ta_sit_campfire(20,0,21,0,"AD_PIRATECAMP_AJ_03");
	ta_stand_armscrossed(21,0,0,0,"ADW_PIRATECAMP_WAY_07");
	ta_sit_campfire(0,0,1,0,"AD_PIRATECAMP_AJ_03");
	ta_stand_armscrossed(1,0,3,0,"ADW_PIRATECAMP_WAY_07");
};

func void rtn_follow_1352()
{
	ta_follow_player(5,0,20,0,"ADW_CANYON_TELEPORT_PATH_06");
	ta_follow_player(20,0,5,0,"ADW_CANYON_TELEPORT_PATH_06");
};

