
instance BDT_10401_ADDON_DEADBANDIT(NPC_DEFAULT)
{
	name[0] = "Bandyta";
	guild = GIL_BDT;
	id = 10401;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	level = 20;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_sword);
	CreateInvItems(self,itmi_goldchalice,1);
	CreateInvItems(self,itmi_silverring,1);
	CreateInvItems(self,itpo_health_02,2);
	CreateInvItems(self,itpo_mana_01,5);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_NORMALBART01,BODYTEX_P,itar_thorus_addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_10401;
};


func void rtn_start_10401()
{
	ta_stand_wp(8,0,16,0,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
	ta_stand_wp(16,0,8,0,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
};

