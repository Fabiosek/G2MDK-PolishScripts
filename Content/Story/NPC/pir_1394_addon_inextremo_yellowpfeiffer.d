
instance PIR_1394_ADDON_INEXTREMO_YELLOWPFEIFFER(NPC_DEFAULT)
{
	name[0] = "¯ó³ty Pfeiffer";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	flags = 0;
	voice = 9;
	id = 1394;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	CreateInvItem(self,itmi_iedudelgelb);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Pfeiffer_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Pfeiffer",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_start_1394;
};


func void rtn_start_1394()
{
	ta_stand_guarding(5,0,20,0,"WP_COOK_CAULDRON");
	ta_stand_guarding(20,0,5,0,"WP_COOK_CAULDRON");
};

func void rtn_concert_1394()
{
	ta_concert(5,0,20,0,"WP_COOK_CAULDRON");
	ta_concert(20,0,5,0,"WP_COOK_CAULDRON");
};

