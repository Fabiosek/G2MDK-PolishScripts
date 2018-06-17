
instance PIR_1392_ADDON_INEXTREMO_THOMASTHEFORGER(NPC_DEFAULT)
{
	name[0] = "Kowal Tomasz";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	flags = 0;
	voice = 8;
	id = 1392;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	CreateInvItem(self,itmi_iecello);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_THOMAS_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_THOMAS",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_start_1392;
};


func void rtn_start_1392()
{
	ta_stand_eating(5,0,20,0,"WP_COOK_PAN");
	ta_stand_eating(20,0,5,0,"WP_COOK_PAN");
};

func void rtn_concert_1392()
{
	ta_concert(5,0,20,0,"WP_COOK_PAN");
	ta_concert(20,0,5,0,"WP_COOK_PAN");
};

