
instance PIR_1395_ADDON_INEXTREMO_LUTTER(NPC_DEFAULT)
{
	name[0] = "Lutter";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	voice = 7;
	id = 1395;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	CreateInvItem(self,itmi_iedrumscheit);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Lutter_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Lutter",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_start_1395;
};


func void rtn_start_1395()
{
	ta_stand_eating(5,0,20,0,"WP_STAND");
	ta_stand_eating(20,0,5,0,"WP_STAND");
};

func void rtn_concert_1395()
{
	ta_concert(5,0,20,0,"WP_STAND");
	ta_concert(20,0,5,0,"WP_STAND");
};

