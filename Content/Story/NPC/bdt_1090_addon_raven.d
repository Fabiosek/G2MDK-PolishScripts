
instance BDT_1090_ADDON_RAVEN(NPC_DEFAULT)
{
	name[0] = "Kruk";
	guild = GIL_BDT;
	id = 1090;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	level = 50;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	aivar[AIV_IGNORESARMOR] = TRUE;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	attribute[ATR_MANA_MAX] = 666666;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_beliarweapon_raven);
	b_createambientinv(self);
	CreateInvItems(self,itmi_addon_stone_01,1);
	CreateInvItems(self,itmi_addon_stone_02,1);
	CreateInvItems(self,itmi_addon_stone_03,1);
	CreateInvItems(self,itmi_addon_stone_04,1);
	CreateInvItems(self,itmi_addon_stone_05,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_RAVEN,BODYTEX_N,itar_raven_addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,90);
	daily_routine = rtn_start_1090;
};


func void rtn_start_1090()
{
	ta_pray_innos_fp(9,0,21,0,"ADW_ADANOSTEMPEL_RAVEN_11");
	ta_pray_innos_fp(21,0,9,0,"ADW_ADANOSTEMPEL_RAVEN_11");
};

func void rtn_waitforplayer_1090()
{
	ta_stand_wp(9,0,21,0,"ADW_ADANOSTEMPEL_RAVEN_11");
	ta_stand_wp(21,0,9,0,"ADW_ADANOSTEMPEL_RAVEN_11");
};

