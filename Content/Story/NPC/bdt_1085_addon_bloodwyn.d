
instance BDT_1085_ADDON_BLOODWYN(NPC_DEFAULT)
{
	name[0] = "Bloodwyn";
	guild = GIL_BDT;
	id = 1085;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	aivar[AIV_STORYBANDIT] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_sword);
	CreateInvItems(self,itke_addon_bloodwyn_01,1);
	CreateInvItems(self,itmi_addon_bloodwyn_kopf,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_BLOODWYN,BODYTEX_N,itar_thorus_addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_1085;
};


func void rtn_start_1085()
{
	ta_stand_wp(8,0,16,0,"BL_RAVEN_09");
	ta_stand_wp(16,0,8,0,"BL_RAVEN_09");
};

func void rtn_mine_1085()
{
	ta_stand_wp(8,0,16,0,"ADW_MINE_TO_MC_01");
	ta_stand_wp(16,0,8,0,"ADW_MINE_TO_MC_01");
};

func void rtn_gold_1085()
{
	ta_stand_wp(8,0,16,0,"ADW_MINE_MC_07");
	ta_stand_wp(16,0,8,0,"ADW_MINE_MC_07");
};

