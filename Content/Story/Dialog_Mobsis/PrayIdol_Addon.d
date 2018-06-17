
var int prayidolday;
var int recievedmoney;
var int givenhitpoints;
var int givenmana;
const int BELIARSDISPO = 10000;

func void b_hitpointangleich(var int beliarscost)
{
	var int currenthitpoints;
	GIVENHITPOINTS = GIVENHITPOINTS + beliarscost;
	hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] - beliarscost;
	currenthitpoints = hero.attribute[ATR_HITPOINTS] - beliarscost;
	if(currenthitpoints < 2)
	{
		currenthitpoints = 2;
	};
	hero.attribute[ATR_HITPOINTS] = currenthitpoints;
};

func void b_manaangleich(var int beliarscost)
{
	var int currentmana;
	GIVENMANA = GIVENMANA + beliarscost;
	hero.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX] - beliarscost;
	hero.aivar[REAL_MANA_MAX] = hero.aivar[REAL_MANA_MAX] - beliarscost;
	currentmana = hero.attribute[ATR_MANA] - beliarscost;
	if(currentmana < 0)
	{
		currentmana = 0;
	};
	hero.attribute[ATR_MANA] = currentmana;
};

func void b_blitzinarsch()
{
	var int blitzinarsch_hitpoints;
	var int currenthitpoints;
	var int abzug;
	var string concattext1;
	var string concattext2;
	currenthitpoints = hero.attribute[ATR_HITPOINTS];
	blitzinarsch_hitpoints = (currenthitpoints * 4) / 5;
	if(blitzinarsch_hitpoints < 2)
	{
		blitzinarsch_hitpoints = 2;
	};
	abzug = hero.attribute[ATR_HITPOINTS] - blitzinarsch_hitpoints;
	if(abzug > 0)
	{
		concattext1 = ConcatStrings(" ",NAME_DAMAGE);
		concattext2 = ConcatStrings(IntToString(abzug),concattext1);
		AI_PrintScreen(concattext2,-1,YPOS_GOLDTAKEN,FONT_SCREENSMALL,2);
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
	};
	hero.attribute[ATR_HITPOINTS] = blitzinarsch_hitpoints;
};

func void b_getbeliarsgold(var int kohle)
{
	var string concattext1;
	var string concattext2;
	RECIEVEDMONEY = RECIEVEDMONEY + kohle;
	if(RECIEVEDMONEY > BELIARSDISPO)
	{
		kohle = 100;
	};
	CreateInvItems(hero,itmi_gold,kohle);
	concattext1 = ConcatStrings(IntToString(kohle)," ");
	concattext2 = ConcatStrings(concattext1,PRINT_GOLDERHALTEN);
	AI_PrintScreen(concattext2,-1,YPOS_GOLDTAKEN,FONT_SCREENSMALL,2);
};

func void prayidol_s1()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PRAYIDOL;
		AI_ProcessInfos(her);
	};
};


instance PC_PRAYIDOL_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_prayidol_end_condition;
	information = pc_prayidol_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_prayidol_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL)
	{
		return TRUE;
	};
};

func void pc_prayidol_end_info()
{
	b_endproductiondialog();
};


instance PC_PRAYIDOL_PRAYIDOL(C_INFO)
{
	npc = pc_hero;
	nr = 2;
	condition = pc_prayidol_prayidol_condition;
	information = pc_prayidol_prayidol_info;
	permanent = TRUE;
	description = NAME_ADDON_BETEN;
};


func int pc_prayidol_prayidol_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL)
	{
		return TRUE;
	};
};

func void pc_prayidol_prayidol_info()
{
	Info_ClearChoices(pc_prayidol_prayidol);
	Info_AddChoice(pc_prayidol_prayidol,DIALOG_BACK,pc_prayidol_prayidol_back);
	Info_AddChoice(pc_prayidol_prayidol,NAME_ADDON_PRAYIDOL_GIVENOTHING,pc_prayidol_prayidol_nopay);
	if(GIVENHITPOINTS <= 50)
	{
		if(hero.attribute[ATR_HITPOINTS_MAX] >= 40)
		{
			Info_AddChoice(pc_prayidol_prayidol,NAME_ADDON_PRAYIDOL_GIVEHITPOINT1,pc_prayidol_prayidol_smallpay);
		};
		if(hero.attribute[ATR_HITPOINTS_MAX] >= 40)
		{
			Info_AddChoice(pc_prayidol_prayidol,NAME_ADDON_PRAYIDOL_GIVEHITPOINT2,pc_prayidol_prayidol_mediumpay);
		};
		if(hero.attribute[ATR_HITPOINTS_MAX] >= 40)
		{
			Info_AddChoice(pc_prayidol_prayidol,NAME_ADDON_PRAYIDOL_GIVEHITPOINT3,pc_prayidol_prayidol_bigpay);
		};
	};
	if(GIVENMANA <= 10)
	{
		if(hero.attribute[ATR_MANA_MAX] > 10)
		{
			Info_AddChoice(pc_prayidol_prayidol,NAME_ADDON_PRAYIDOL_GIVEMANA,pc_prayidol_prayidol_manapay);
		};
	};
};

func void pc_prayidol_prayidol_back()
{
	Info_ClearChoices(pc_prayidol_prayidol);
};

func void pc_prayidol_prayidol_nopay()
{
	b_blitzinarsch();
	Info_ClearChoices(pc_prayidol_prayidol);
};

func void pc_prayidol_prayidol_smallpay()
{
	b_hitpointangleich(1);
	if((PRAYIDOLDAY == Wld_GetDay()) || (RECIEVEDMONEY >= BELIARSDISPO))
	{
		b_blitzinarsch();
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		b_getbeliarsgold(25);
	}
	else
	{
		b_getbeliarsgold(50);
	};
	PRAYIDOLDAY = Wld_GetDay();
	Info_ClearChoices(pc_prayidol_prayidol);
};

func void pc_prayidol_prayidol_mediumpay()
{
	b_hitpointangleich(5);
	if((PRAYIDOLDAY == Wld_GetDay()) || (RECIEVEDMONEY >= BELIARSDISPO))
	{
		b_blitzinarsch();
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		b_getbeliarsgold(125);
	}
	else
	{
		b_getbeliarsgold(250);
	};
	PRAYIDOLDAY = Wld_GetDay();
	Info_ClearChoices(pc_prayidol_prayidol);
};

func void pc_prayidol_prayidol_bigpaymanapay()
{
	if((PRAYIDOLDAY == Wld_GetDay()) || (RECIEVEDMONEY >= BELIARSDISPO))
	{
		b_blitzinarsch();
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		b_getbeliarsgold(250);
	}
	else
	{
		b_getbeliarsgold(500);
	};
	PRAYIDOLDAY = Wld_GetDay();
	Info_ClearChoices(pc_prayidol_prayidol);
};

func void pc_prayidol_prayidol_bigpay()
{
	b_hitpointangleich(10);
	pc_prayidol_prayidol_bigpaymanapay();
};

func void pc_prayidol_prayidol_manapay()
{
	b_manaangleich(1);
	pc_prayidol_prayidol_bigpaymanapay();
};


instance PC_PRAYSHRINE_UPGRATEBELIARSWEAPON(C_INFO)
{
	npc = pc_hero;
	nr = 2;
	condition = pc_prayshrine_upgratebeliarsweapon_condition;
	information = pc_prayshrine_upgratebeliarsweapon_info;
	permanent = TRUE;
	description = NAME_ADDON_UPGRATEBELIARSWEAPON;
};


func int pc_prayshrine_upgratebeliarsweapon_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (c_sccanupgratebeliarsweapon() == TRUE) && (c_schasbeliarsweapon() == TRUE))
	{
		return TRUE;
	};
};

func void pc_prayshrine_upgratebeliarsweapon_info()
{
	b_clearbeliarsweapon();
	b_upgratebeliarsweapon();
};

