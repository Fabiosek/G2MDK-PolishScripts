
func int b_goldmob_bestimmung()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_01") && (GOLDMOB_01_AMOUNT_MAX > GOLDMOB_01_AMOUNT))
	{
		GOLDMOB_01_AMOUNT = GOLDMOB_01_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_02") && (GOLDMOB_02_AMOUNT_MAX > GOLDMOB_02_AMOUNT))
	{
		GOLDMOB_02_AMOUNT = GOLDMOB_02_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_03") && (GOLDMOB_03_AMOUNT_MAX > GOLDMOB_03_AMOUNT))
	{
		GOLDMOB_03_AMOUNT = GOLDMOB_03_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_04") && (GOLDMOB_04_AMOUNT_MAX > GOLDMOB_04_AMOUNT))
	{
		GOLDMOB_04_AMOUNT = GOLDMOB_04_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_SIDE_PICK_01") && (GOLDMOB_05_AMOUNT_MAX > GOLDMOB_05_AMOUNT))
	{
		GOLDMOB_05_AMOUNT = GOLDMOB_05_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_SIDE_PICK_02") && (GOLDMOB_06_AMOUNT_MAX > GOLDMOB_06_AMOUNT))
	{
		GOLDMOB_06_AMOUNT = GOLDMOB_06_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_06") && (GOLDMOB_07_AMOUNT_MAX > GOLDMOB_07_AMOUNT))
	{
		GOLDMOB_07_AMOUNT = GOLDMOB_07_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_MC_PICK_01") && (GOLDMOB_08_AMOUNT_MAX > GOLDMOB_08_AMOUNT))
	{
		GOLDMOB_08_AMOUNT = GOLDMOB_08_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_MC_PICK_02") && (GOLDMOB_09_AMOUNT_MAX > GOLDMOB_09_AMOUNT))
	{
		GOLDMOB_09_AMOUNT = GOLDMOB_09_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_MC_PICK_03") && (GOLDMOB_10_AMOUNT_MAX > GOLDMOB_10_AMOUNT))
	{
		GOLDMOB_10_AMOUNT = GOLDMOB_10_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_MC_PICK_04") && (GOLDMOB_11_AMOUNT_MAX > GOLDMOB_11_AMOUNT))
	{
		GOLDMOB_11_AMOUNT = GOLDMOB_11_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_09_PICK") && (GOLDMOB_12_AMOUNT_MAX > GOLDMOB_12_AMOUNT))
	{
		GOLDMOB_12_AMOUNT = GOLDMOB_12_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_TO_MC_04_B") && (GOLDMOB_13_AMOUNT_MAX > GOLDMOB_13_AMOUNT))
	{
		GOLDMOB_13_AMOUNT = GOLDMOB_13_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_06") && (GOLDMOB_14_AMOUNT_MAX > GOLDMOB_14_AMOUNT))
	{
		GOLDMOB_14_AMOUNT = GOLDMOB_14_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_07") && (GOLDMOB_15_AMOUNT_MAX > GOLDMOB_15_AMOUNT))
	{
		GOLDMOB_15_AMOUNT = GOLDMOB_15_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_08") && (GOLDMOB_16_AMOUNT_MAX > GOLDMOB_16_AMOUNT))
	{
		GOLDMOB_16_AMOUNT = GOLDMOB_16_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_09") && (GOLDMOB_17_AMOUNT_MAX > GOLDMOB_17_AMOUNT))
	{
		GOLDMOB_17_AMOUNT = GOLDMOB_17_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_19") && (GOLDMOB_18_AMOUNT_MAX > GOLDMOB_18_AMOUNT))
	{
		GOLDMOB_18_AMOUNT = GOLDMOB_18_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_SLAVE_01") && (GOLDMOB_19_AMOUNT_MAX > GOLDMOB_19_AMOUNT))
	{
		GOLDMOB_19_AMOUNT = GOLDMOB_19_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_05") && (GOLDMOB_20_AMOUNT_MAX > GOLDMOB_20_AMOUNT))
	{
		GOLDMOB_20_AMOUNT = GOLDMOB_20_AMOUNT + 1;
		return TRUE;
	};
	return FALSE;
};

func void goldhacken_s1()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_GOLDHACKEN;
		AI_ProcessInfos(her);
	};
};


instance PC_GOLDHACKEN_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_goldhacken_end_condition;
	information = pc_goldhacken_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_goldhacken_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	{
		return TRUE;
	};
};

func void pc_goldhacken_end_info()
{
	TRUEMMER_COUNT = 0;
	b_endproductiondialog();
};


instance PC_GOLDHACKEN_ADDON_HOUR(C_INFO)
{
	npc = pc_hero;
	nr = 2;
	condition = pc_goldhacken_addon_hour_condition;
	information = pc_goldhacken_addon_hour_info;
	permanent = TRUE;
	description = "Od³up trochê.";
};


func int pc_goldhacken_addon_hour_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	{
		return TRUE;
	};
};


var int goldcounter;

func void pc_goldhacken_addon_hour_info()
{
	var int currentchance;
	var int multinugget;
	LEARN_BY_DOING = LEARN_BY_DOING + 1;
	if(LEARN_BY_DOING == 10)
	{
		b_upgrade_hero_hackchance(2);
	}
	else if(LEARN_BY_DOING == 15)
	{
		b_upgrade_hero_hackchance(3);
	}
	else if(LEARN_BY_DOING == 20)
	{
		b_upgrade_hero_hackchance(5);
	};
	currentchance = Hlp_Random(100);
	multinugget = Hlp_Random(10);
	if(b_goldmob_bestimmung() == TRUE)
	{
		if(currentchance <= HERO_HACKCHANCE)
		{
			if((GOLDCOUNTER >= 20) && (multinugget >= 8))
			{
				CreateInvItems(hero,itmi_goldnugget_addon,3);
				PrintScreen("Odpad³y 3 samorodki z³ota!",-1,-1,FONT_SCREENSMALL,2);
				TRUEMMER_COUNT = 0;
			}
			else if((GOLDCOUNTER >= 7) && (multinugget >= 5))
			{
				CreateInvItems(hero,itmi_goldnugget_addon,2);
				PrintScreen("Odpad³y 2 samorodki z³ota!",-1,-1,FONT_SCREENSMALL,2);
				TRUEMMER_COUNT = 0;
				GOLDCOUNTER = GOLDCOUNTER + 1;
			}
			else
			{
				CreateInvItems(hero,itmi_goldnugget_addon,1);
				PrintScreen("Odpad³ 1 samorodek z³ota!",-1,-1,FONT_SCREENSMALL,2);
				TRUEMMER_COUNT = 0;
				GOLDCOUNTER = GOLDCOUNTER + 1;
			};
		}
		else
		{
			PrintScreen("Kawa³ki z³ota zasypuj¹ okolicê...",-1,-1,FONT_SCREENSMALL,2);
			TRUEMMER_COUNT = TRUEMMER_COUNT + 1;
		};
	}
	else
	{
		PrintScreen("Nic nie zosta³o.",-1,-1,FONT_SCREENSMALL,2);
		b_endproductiondialog();
	};
};


instance PC_GOLDHACKEN_ADDON_TSCHLAG(C_INFO)
{
	npc = pc_hero;
	nr = 997;
	condition = pc_goldhacken_addon_tschlag_condition;
	information = pc_goldhacken_addon_tschlag_info;
	permanent = TRUE;
	description = "Mocno uderz.";
};


func int pc_goldhacken_addon_tschlag_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN) && (TRUEMMER_COUNT >= 2) && (KNOWS_TRUEMMERSCHLAG == TRUE))
	{
		return TRUE;
	};
};

func void pc_goldhacken_addon_tschlag_info()
{
	var int truemmerchance;
	truemmerchance = Hlp_Random(100);
	if(truemmerchance < 5)
	{
		PrintScreen("Nic...",-1,-1,FONT_SCREENSMALL,2);
	}
	else
	{
		Snd_Play("RAVENS_EARTHQUAKE3");
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		if(truemmerchance >= 85)
		{
			CreateInvItems(hero,itmi_goldnugget_addon,3);
			PrintScreen("Odpad³y 3 samorodki z³ota!",-1,-1,FONT_SCREENSMALL,2);
		}
		else if(truemmerchance >= 50)
		{
			CreateInvItems(hero,itmi_goldnugget_addon,2);
			PrintScreen("Odpad³y 2 samorodki z³ota!",-1,-1,FONT_SCREENSMALL,2);
		}
		else
		{
			CreateInvItems(hero,itmi_goldnugget_addon,1);
			PrintScreen("Odpad³ 1 samorodek z³ota!",-1,-1,FONT_SCREENSMALL,2);
		};
	};
	TRUEMMER_COUNT = 0;
};


instance PC_GOLDHACKEN_ADDON_CHANCE(C_INFO)
{
	npc = pc_hero;
	nr = 998;
	condition = pc_goldhacken_addon_chance_condition;
	information = pc_goldhacken_addon_chance_info;
	permanent = TRUE;
	description = "(Ocena zdolnoœci)";
};


func int pc_goldhacken_addon_chance_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	{
		return TRUE;
	};
};

func void pc_goldhacken_addon_chance_info()
{
	var string concattext;
	if(HERO_HACKCHANCE < 20)
	{
		concattext = ConcatStrings("nieopierzony ¿ó³todziób (",IntToString(HERO_HACKCHANCE));
	}
	else if(HERO_HACKCHANCE < 40)
	{
		concattext = ConcatStrings("przeciêtny kopacz (",IntToString(HERO_HACKCHANCE));
	}
	else if(HERO_HACKCHANCE < 55)
	{
		concattext = ConcatStrings("doœwiadczony kopacz (",IntToString(HERO_HACKCHANCE));
	}
	else if(HERO_HACKCHANCE < 75)
	{
		concattext = ConcatStrings("urodzony kopacz (",IntToString(HERO_HACKCHANCE));
	}
	else if(HERO_HACKCHANCE < 90)
	{
		concattext = ConcatStrings("piekielnie dobry kopacz (",IntToString(HERO_HACKCHANCE));
	}
	else if(HERO_HACKCHANCE < 98)
	{
		concattext = ConcatStrings("mistrz kopania (",IntToString(HERO_HACKCHANCE));
	}
	else
	{
		concattext = ConcatStrings("guru kopaczy ( ",IntToString(HERO_HACKCHANCE));
	};
	concattext = ConcatStrings(concattext," procent)");
	PrintScreen(concattext,-1,-1,FONT_SCREENSMALL,2);
};

