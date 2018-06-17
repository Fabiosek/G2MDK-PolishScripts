
func int c_schasbeliarsrune()
{
	if((Npc_HasItems(hero,itru_beliarsrage) == TRUE) || (Npc_HasItems(hero,itru_suckenergy) == TRUE) || (Npc_HasItems(hero,itru_greententacle) == TRUE) || (Npc_HasItems(hero,itru_swarm) == TRUE) || (Npc_HasItems(hero,itru_skull) == TRUE) || (Npc_HasItems(hero,itru_summonzombie) == TRUE) || (Npc_HasItems(hero,itru_summonguardian) == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func int c_schasbeliarsweapon()
{
	if(Npc_HasItems(hero,itmw_beliarweapon_raven) || Npc_HasItems(hero,itmw_beliarweapon_1h_01) || Npc_HasItems(hero,itmw_beliarweapon_1h_02) || Npc_HasItems(hero,itmw_beliarweapon_1h_03) || Npc_HasItems(hero,itmw_beliarweapon_1h_04) || Npc_HasItems(hero,itmw_beliarweapon_1h_05) || Npc_HasItems(hero,itmw_beliarweapon_1h_06) || Npc_HasItems(hero,itmw_beliarweapon_1h_07) || Npc_HasItems(hero,itmw_beliarweapon_1h_08) || Npc_HasItems(hero,itmw_beliarweapon_1h_09) || Npc_HasItems(hero,itmw_beliarweapon_1h_10) || Npc_HasItems(hero,itmw_beliarweapon_1h_11) || Npc_HasItems(hero,itmw_beliarweapon_1h_12) || Npc_HasItems(hero,itmw_beliarweapon_1h_13) || Npc_HasItems(hero,itmw_beliarweapon_1h_14) || Npc_HasItems(hero,itmw_beliarweapon_1h_15) || Npc_HasItems(hero,itmw_beliarweapon_1h_16) || Npc_HasItems(hero,itmw_beliarweapon_1h_17) || Npc_HasItems(hero,itmw_beliarweapon_1h_18) || Npc_HasItems(hero,itmw_beliarweapon_1h_19) || Npc_HasItems(hero,itmw_beliarweapon_1h_20) || Npc_HasItems(hero,itmw_beliarweapon_2h_01) || Npc_HasItems(hero,itmw_beliarweapon_2h_02) || Npc_HasItems(hero,itmw_beliarweapon_2h_03) || Npc_HasItems(hero,itmw_beliarweapon_2h_04) || Npc_HasItems(hero,itmw_beliarweapon_2h_05) || Npc_HasItems(hero,itmw_beliarweapon_2h_06) || Npc_HasItems(hero,itmw_beliarweapon_2h_07) || Npc_HasItems(hero,itmw_beliarweapon_2h_08) || Npc_HasItems(hero,itmw_beliarweapon_2h_09) || Npc_HasItems(hero,itmw_beliarweapon_2h_10) || Npc_HasItems(hero,itmw_beliarweapon_2h_11) || Npc_HasItems(hero,itmw_beliarweapon_2h_12) || Npc_HasItems(hero,itmw_beliarweapon_2h_13) || Npc_HasItems(hero,itmw_beliarweapon_2h_14) || Npc_HasItems(hero,itmw_beliarweapon_2h_15) || Npc_HasItems(hero,itmw_beliarweapon_2h_16) || Npc_HasItems(hero,itmw_beliarweapon_2h_17) || Npc_HasItems(hero,itmw_beliarweapon_2h_18) || Npc_HasItems(hero,itmw_beliarweapon_2h_19) || Npc_HasItems(hero,itmw_beliarweapon_2h_20) || c_schasbeliarsrune())
	{
		return TRUE;
	};
	return FALSE;
};

func int c_isitembeliarsweapon(var C_ITEM weap)
{
	if((Hlp_IsItem(weap,itmw_beliarweapon_raven) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_01) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_02) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_03) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_04) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_05) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_06) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_07) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_08) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_09) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_10) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_11) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_12) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_13) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_14) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_15) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_16) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_17) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_18) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_19) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_1h_20) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_01) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_02) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_03) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_04) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_05) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_06) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_07) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_08) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_09) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_10) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_11) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_12) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_13) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_14) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_15) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_16) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_17) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_18) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_19) == TRUE) || (Hlp_IsItem(weap,itmw_beliarweapon_2h_20) == TRUE) || (Hlp_IsItem(weap,itru_beliarsrage) == TRUE) || (Hlp_IsItem(weap,itru_suckenergy) == TRUE) || (Hlp_IsItem(weap,itru_greententacle) == TRUE) || (Hlp_IsItem(weap,itru_swarm) == TRUE) || (Hlp_IsItem(weap,itru_skull) == TRUE) || (Hlp_IsItem(weap,itru_summonzombie) == TRUE) || (Hlp_IsItem(weap,itru_summonguardian) == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func int c_schasreadiedbeliarsweapon()
{
	var C_ITEM readyweap;
	readyweap = Npc_GetReadiedWeapon(hero);
	if(c_isitembeliarsweapon(readyweap))
	{
		return TRUE;
	};
	return FALSE;
};

func int c_schasequippedbeliarsweapon()
{
	var C_ITEM equipweap;
	equipweap = Npc_GetEquippedMeleeWeapon(hero);
	if(c_isitembeliarsweapon(equipweap))
	{
		return TRUE;
	};
	return FALSE;
};

func void b_clearbeliarsweapon()
{
	Npc_RemoveInvItems(hero,itmw_beliarweapon_raven,Npc_HasItems(hero,itmw_beliarweapon_raven));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_01,Npc_HasItems(hero,itmw_beliarweapon_1h_01));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_02,Npc_HasItems(hero,itmw_beliarweapon_1h_02));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_03,Npc_HasItems(hero,itmw_beliarweapon_1h_03));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_04,Npc_HasItems(hero,itmw_beliarweapon_1h_04));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_05,Npc_HasItems(hero,itmw_beliarweapon_1h_05));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_06,Npc_HasItems(hero,itmw_beliarweapon_1h_06));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_07,Npc_HasItems(hero,itmw_beliarweapon_1h_07));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_08,Npc_HasItems(hero,itmw_beliarweapon_1h_08));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_09,Npc_HasItems(hero,itmw_beliarweapon_1h_09));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_10,Npc_HasItems(hero,itmw_beliarweapon_1h_10));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_11,Npc_HasItems(hero,itmw_beliarweapon_1h_11));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_12,Npc_HasItems(hero,itmw_beliarweapon_1h_12));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_13,Npc_HasItems(hero,itmw_beliarweapon_1h_13));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_14,Npc_HasItems(hero,itmw_beliarweapon_1h_14));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_15,Npc_HasItems(hero,itmw_beliarweapon_1h_15));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_16,Npc_HasItems(hero,itmw_beliarweapon_1h_16));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_17,Npc_HasItems(hero,itmw_beliarweapon_1h_17));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_18,Npc_HasItems(hero,itmw_beliarweapon_1h_18));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_19,Npc_HasItems(hero,itmw_beliarweapon_1h_19));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_1h_20,Npc_HasItems(hero,itmw_beliarweapon_1h_20));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_01,Npc_HasItems(hero,itmw_beliarweapon_2h_01));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_02,Npc_HasItems(hero,itmw_beliarweapon_2h_02));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_03,Npc_HasItems(hero,itmw_beliarweapon_2h_03));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_04,Npc_HasItems(hero,itmw_beliarweapon_2h_04));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_05,Npc_HasItems(hero,itmw_beliarweapon_2h_05));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_06,Npc_HasItems(hero,itmw_beliarweapon_2h_06));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_07,Npc_HasItems(hero,itmw_beliarweapon_2h_07));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_08,Npc_HasItems(hero,itmw_beliarweapon_2h_08));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_09,Npc_HasItems(hero,itmw_beliarweapon_2h_09));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_10,Npc_HasItems(hero,itmw_beliarweapon_2h_10));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_11,Npc_HasItems(hero,itmw_beliarweapon_2h_11));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_12,Npc_HasItems(hero,itmw_beliarweapon_2h_12));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_13,Npc_HasItems(hero,itmw_beliarweapon_2h_13));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_14,Npc_HasItems(hero,itmw_beliarweapon_2h_14));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_15,Npc_HasItems(hero,itmw_beliarweapon_2h_15));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_16,Npc_HasItems(hero,itmw_beliarweapon_2h_16));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_17,Npc_HasItems(hero,itmw_beliarweapon_2h_17));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_18,Npc_HasItems(hero,itmw_beliarweapon_2h_18));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_19,Npc_HasItems(hero,itmw_beliarweapon_2h_19));
	Npc_RemoveInvItems(hero,itmw_beliarweapon_2h_20,Npc_HasItems(hero,itmw_beliarweapon_2h_20));
	Npc_RemoveInvItems(hero,itru_beliarsrage,Npc_HasItems(hero,itru_beliarsrage));
	Npc_RemoveInvItems(hero,itru_suckenergy,Npc_HasItems(hero,itru_suckenergy));
	Npc_RemoveInvItems(hero,itru_greententacle,Npc_HasItems(hero,itru_greententacle));
	Npc_RemoveInvItems(hero,itru_swarm,Npc_HasItems(hero,itru_swarm));
	Npc_RemoveInvItems(hero,itru_skull,Npc_HasItems(hero,itru_skull));
	Npc_RemoveInvItems(hero,itru_summonzombie,Npc_HasItems(hero,itru_summonzombie));
	Npc_RemoveInvItems(hero,itru_summonguardian,Npc_HasItems(hero,itru_summonguardian));
};


var int beliarweapcurrentlvl;
var int beliarweapnextlvl;
var int beliarnextdamagechance;

func int c_sccanupgratebeliarsweapon()
{
	var int herolvl;
	herolvl = hero.level;
	if(hero.guild == GIL_KDF)
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 5)
		{
			BELIARWEAPNEXTLVL = 5;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
		{
			BELIARWEAPNEXTLVL = 4;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
		{
			BELIARWEAPNEXTLVL = 3;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
		{
			BELIARWEAPNEXTLVL = 2;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 1)
		{
			BELIARWEAPNEXTLVL = 1;
		};
		return TRUE;
	}
	else if(herolvl > 46)
	{
		BELIARWEAPNEXTLVL = 20;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_20;
	}
	else if(herolvl > 44)
	{
		BELIARWEAPNEXTLVL = 19;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_19;
	}
	else if(herolvl > 42)
	{
		BELIARWEAPNEXTLVL = 18;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_18;
	}
	else if(herolvl > 40)
	{
		BELIARWEAPNEXTLVL = 17;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_17;
	}
	else if(herolvl > 38)
	{
		BELIARWEAPNEXTLVL = 16;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_16;
	}
	else if(herolvl > 36)
	{
		BELIARWEAPNEXTLVL = 15;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_15;
	}
	else if(herolvl > 34)
	{
		BELIARWEAPNEXTLVL = 14;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_14;
	}
	else if(herolvl > 32)
	{
		BELIARWEAPNEXTLVL = 13;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_13;
	}
	else if(herolvl > 30)
	{
		BELIARWEAPNEXTLVL = 12;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_12;
	}
	else if(herolvl > 28)
	{
		BELIARWEAPNEXTLVL = 11;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_11;
	}
	else if(herolvl > 26)
	{
		BELIARWEAPNEXTLVL = 10;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_10;
	}
	else if(herolvl > 24)
	{
		BELIARWEAPNEXTLVL = 9;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_09;
	}
	else if(herolvl > 22)
	{
		BELIARWEAPNEXTLVL = 8;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_08;
	}
	else if(herolvl > 20)
	{
		BELIARWEAPNEXTLVL = 7;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_07;
	}
	else if(herolvl > 18)
	{
		BELIARWEAPNEXTLVL = 6;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_06;
	}
	else if(herolvl > 16)
	{
		BELIARWEAPNEXTLVL = 5;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_05;
	}
	else if(herolvl > 14)
	{
		BELIARWEAPNEXTLVL = 4;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_04;
	}
	else if(herolvl > 12)
	{
		BELIARWEAPNEXTLVL = 3;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_03;
	}
	else if(herolvl > 10)
	{
		BELIARWEAPNEXTLVL = 2;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_02;
	}
	else if(herolvl <= 10)
	{
		BELIARWEAPNEXTLVL = 1;
		BELIARNEXTDAMAGECHANCE = BELIARDAMAGECHANCE_01;
	};
	if(BELIARWEAPCURRENTLVL < BELIARWEAPNEXTLVL)
	{
		return TRUE;
	};
};

func void b_upgratebeliarsweapon()
{
	var int beliarstribute;
	var string concattext;
	beliarstribute = (BELIARWEAPNEXTLVL - BELIARWEAPCURRENTLVL) * 5;
	hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] - beliarstribute;
	if(beliarstribute > 0)
	{
		concattext = ConcatStrings(PRINT_BELIARSHITPOINTS_MAX,IntToString(beliarstribute));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,4);
	};
	BELIARDAMAGECHANCE = BELIARNEXTDAMAGECHANCE;
	BELIARWEAPCURRENTLVL = BELIARWEAPNEXTLVL;
	if(hero.guild == GIL_KDF)
	{
		Info_ClearChoices(pc_prayshrine_upgratebeliarsweapon);
		if(BELIARWEAPCURRENTLVL >= 1)
		{
			Info_AddChoice(pc_prayshrine_upgratebeliarsweapon,NAME_SPL_GREENTENTACLE,pc_prayshrine_upgratebeliarsweapon_greententacle);
		};
		if(BELIARWEAPCURRENTLVL >= 2)
		{
			Info_AddChoice(pc_prayshrine_upgratebeliarsweapon,NAME_SPL_SUCKENERGY,pc_prayshrine_upgratebeliarsweapon_suckenergy);
		};
		if(BELIARWEAPCURRENTLVL >= 3)
		{
			Info_AddChoice(pc_prayshrine_upgratebeliarsweapon,NAME_SPL_SUMMONGUARDIAN,pc_prayshrine_upgratebeliarsweapon_name_spl_summonguardian);
			Info_AddChoice(pc_prayshrine_upgratebeliarsweapon,NAME_SPL_BELIARSRAGE,pc_prayshrine_upgratebeliarsweapon_beliarsrage);
		};
		if(BELIARWEAPCURRENTLVL >= 4)
		{
			Info_AddChoice(pc_prayshrine_upgratebeliarsweapon,NAME_SPL_SWARM,pc_prayshrine_upgratebeliarsweapon_swarm);
			Info_AddChoice(pc_prayshrine_upgratebeliarsweapon,NAME_SPL_SUMMONZOMBIE,pc_prayshrine_upgratebeliarsweapon_summonzombie);
		};
		if(BELIARWEAPCURRENTLVL >= 5)
		{
			Info_AddChoice(pc_prayshrine_upgratebeliarsweapon,NAME_SPL_SKULL,pc_prayshrine_upgratebeliarsweapon_spl_skull);
		};
	}
	else if(hero.hitchance[NPC_TALENT_1H] > hero.hitchance[NPC_TALENT_2H])
	{
		if(BELIARWEAPCURRENTLVL <= 1)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_01);
		}
		else if(BELIARWEAPCURRENTLVL == 2)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_02);
		}
		else if(BELIARWEAPCURRENTLVL == 3)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_03);
		}
		else if(BELIARWEAPCURRENTLVL == 4)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_04);
		}
		else if(BELIARWEAPCURRENTLVL == 5)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_05);
		}
		else if(BELIARWEAPCURRENTLVL == 6)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_06);
		}
		else if(BELIARWEAPCURRENTLVL == 7)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_07);
		}
		else if(BELIARWEAPCURRENTLVL == 8)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_08);
		}
		else if(BELIARWEAPCURRENTLVL == 9)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_09);
		}
		else if(BELIARWEAPCURRENTLVL == 10)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_10);
		}
		else if(BELIARWEAPCURRENTLVL == 11)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_11);
		}
		else if(BELIARWEAPCURRENTLVL == 12)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_12);
		}
		else if(BELIARWEAPCURRENTLVL == 13)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_13);
		}
		else if(BELIARWEAPCURRENTLVL == 14)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_14);
		}
		else if(BELIARWEAPCURRENTLVL == 15)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_15);
		}
		else if(BELIARWEAPCURRENTLVL == 16)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_16);
		}
		else if(BELIARWEAPCURRENTLVL == 17)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_17);
		}
		else if(BELIARWEAPCURRENTLVL == 18)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_18);
		}
		else if(BELIARWEAPCURRENTLVL == 19)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_19);
		}
		else if(BELIARWEAPCURRENTLVL == 20)
		{
			CreateInvItem(hero,itmw_beliarweapon_1h_20);
		};
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
		Snd_Play("CS_Prayer_WaveOfInsanity");
		BELIARSWEAPONUPGRATED = TRUE;
	}
	else
	{
		if(BELIARWEAPCURRENTLVL <= 1)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_01);
		}
		else if(BELIARWEAPCURRENTLVL == 2)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_02);
		}
		else if(BELIARWEAPCURRENTLVL == 3)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_03);
		}
		else if(BELIARWEAPCURRENTLVL == 4)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_04);
		}
		else if(BELIARWEAPCURRENTLVL == 5)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_05);
		}
		else if(BELIARWEAPCURRENTLVL == 6)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_06);
		}
		else if(BELIARWEAPCURRENTLVL == 7)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_07);
		}
		else if(BELIARWEAPCURRENTLVL == 8)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_08);
		}
		else if(BELIARWEAPCURRENTLVL == 9)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_09);
		}
		else if(BELIARWEAPCURRENTLVL == 10)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_10);
		}
		else if(BELIARWEAPCURRENTLVL == 11)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_11);
		}
		else if(BELIARWEAPCURRENTLVL == 12)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_12);
		}
		else if(BELIARWEAPCURRENTLVL == 13)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_13);
		}
		else if(BELIARWEAPCURRENTLVL == 14)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_14);
		}
		else if(BELIARWEAPCURRENTLVL == 15)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_15);
		}
		else if(BELIARWEAPCURRENTLVL == 16)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_16);
		}
		else if(BELIARWEAPCURRENTLVL == 17)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_17);
		}
		else if(BELIARWEAPCURRENTLVL == 18)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_18);
		}
		else if(BELIARWEAPCURRENTLVL == 19)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_19);
		}
		else if(BELIARWEAPCURRENTLVL == 20)
		{
			CreateInvItem(hero,itmw_beliarweapon_2h_20);
		};
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
		Snd_Play("CS_Prayer_WaveOfInsanity");
		BELIARSWEAPONUPGRATED = TRUE;
	};
};

func void pc_prayshrine_upgratebeliarsweapon_greententacle()
{
	CreateInvItem(hero,itru_greententacle);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_ADDON_RUNEGIVEN,-1,45,FONT_SCREENSMALL,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BELIARSWEAPONUPGRATED = TRUE;
	Info_ClearChoices(pc_prayshrine_upgratebeliarsweapon);
};

func void pc_prayshrine_upgratebeliarsweapon_suckenergy()
{
	CreateInvItem(hero,itru_suckenergy);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_ADDON_RUNEGIVEN,-1,45,FONT_SCREENSMALL,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BELIARSWEAPONUPGRATED = TRUE;
	Info_ClearChoices(pc_prayshrine_upgratebeliarsweapon);
};

func void pc_prayshrine_upgratebeliarsweapon_name_spl_summonguardian()
{
	CreateInvItem(hero,itru_summonguardian);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_ADDON_RUNEGIVEN,-1,45,FONT_SCREENSMALL,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BELIARSWEAPONUPGRATED = TRUE;
	Info_ClearChoices(pc_prayshrine_upgratebeliarsweapon);
};

func void pc_prayshrine_upgratebeliarsweapon_beliarsrage()
{
	CreateInvItem(hero,itru_beliarsrage);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_ADDON_RUNEGIVEN,-1,45,FONT_SCREENSMALL,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BELIARSWEAPONUPGRATED = TRUE;
	Info_ClearChoices(pc_prayshrine_upgratebeliarsweapon);
};

func void pc_prayshrine_upgratebeliarsweapon_swarm()
{
	CreateInvItem(hero,itru_swarm);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_ADDON_RUNEGIVEN,-1,45,FONT_SCREENSMALL,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BELIARSWEAPONUPGRATED = TRUE;
	Info_ClearChoices(pc_prayshrine_upgratebeliarsweapon);
};

func void pc_prayshrine_upgratebeliarsweapon_summonzombie()
{
	CreateInvItem(hero,itru_summonzombie);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_ADDON_RUNEGIVEN,-1,45,FONT_SCREENSMALL,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BELIARSWEAPONUPGRATED = TRUE;
	Info_ClearChoices(pc_prayshrine_upgratebeliarsweapon);
};

func void pc_prayshrine_upgratebeliarsweapon_spl_skull()
{
	CreateInvItem(hero,itru_skull);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_ADDON_RUNEGIVEN,-1,45,FONT_SCREENSMALL,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BELIARSWEAPONUPGRATED = TRUE;
	Info_ClearChoices(pc_prayshrine_upgratebeliarsweapon);
};

