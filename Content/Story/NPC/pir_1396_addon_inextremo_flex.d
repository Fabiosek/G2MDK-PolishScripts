
instance PIR_1396_ADDON_INEXTREMO_FLEX(NPC_DEFAULT)
{
	name[0] = "Flex";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	flags = 0;
	voice = 13;
	id = 1396;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	CreateInvItem(self,itmi_iedudelblau);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Flex_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Flex",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_start_1396;
};


func void rtn_start_1396()
{
	ta_stand_eating(5,0,20,0,"WP_POTION_ALCHEMY");
	ta_stand_eating(20,0,5,0,"WP_POTION_ALCHEMY");
};

func void rtn_concert_1396()
{
	ta_concert(5,0,20,0,"WP_POTION_ALCHEMY");
	ta_concert(20,0,5,0,"WP_POTION_ALCHEMY");
};

