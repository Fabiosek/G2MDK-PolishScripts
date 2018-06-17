
instance PIR_1393_ADDON_INEXTREMO_UNICORN(NPC_DEFAULT)
{
	name[0] = "Jednoro¿ec";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	flags = 0;
	voice = 4;
	id = 1393;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	CreateInvItem(self,itmi_ielaute);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_UNICORN_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_UNICORN",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_start_1393;
};


func void rtn_start_1393()
{
	ta_stand_eating(5,0,20,0,"WP_PICK");
	ta_stand_eating(20,0,5,0,"WP_PICK");
};

func void rtn_concert_1393()
{
	ta_concert(5,0,20,0,"WP_PICK");
	ta_concert(20,0,5,0,"WP_PICK");
};

