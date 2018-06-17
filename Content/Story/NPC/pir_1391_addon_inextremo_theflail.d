
instance PIR_1391_ADDON_INEXTREMO_THEFLAIL(NPC_DEFAULT)
{
	name[0] = "Korbacz";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	flags = 0;
	voice = 3;
	id = 1391;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	CreateInvItem(self,itmi_iedrum);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_FLAIL_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_FLAIL",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_start_1391;
};


func void rtn_start_1391()
{
	ta_stand_eating(5,0,20,0,"WP_WASH");
	ta_stand_eating(20,0,5,0,"WP_WASH");
};

func void rtn_concert_1391()
{
	ta_concert(5,0,20,0,"WP_WASH");
	ta_concert(20,0,5,0,"WP_WASH");
};

