
func int b_getlearncosttalent(var C_NPC oth,var int talent,var int skill)
{
	var int kosten;
	kosten = 0;
	if(talent == NPC_TALENT_MAGE)
	{
		if((skill >= 1) && (skill <= 6))
		{
			kosten = 5;
		};
	};
	if(talent == NPC_TALENT_1H)
	{
		if(oth.aivar[REAL_TALENT_1H] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_2H)
	{
		if(oth.aivar[REAL_TALENT_2H] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_BOW)
	{
		if(oth.aivar[REAL_TALENT_BOW] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		if(oth.aivar[REAL_TALENT_CROSSBOW] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		kosten = kosten * skill;
	};
	if((talent == NPC_TALENT_SNEAK) || (talent == NPC_TALENT_ACROBAT))
	{
		kosten = 5;
	};
	if((talent == NPC_TALENT_PICKLOCK) || (talent == NPC_TALENT_PICKPOCKET))
	{
		kosten = 10;
	};
	if(talent == NPC_TALENT_SMITH)
	{
		if(skill == WEAPON_COMMON)
		{
			kosten = 2;
		}
		else if(skill == WEAPON_1H_SPECIAL_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_2H_SPECIAL_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_1H_SPECIAL_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_2H_SPECIAL_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_1H_SPECIAL_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_2H_SPECIAL_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_1H_SPECIAL_04)
		{
			kosten = 10;
		}
		else if(skill == WEAPON_2H_SPECIAL_04)
		{
			kosten = 10;
		}
		else if(skill == WEAPON_1H_HARAD_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_1H_HARAD_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_1H_HARAD_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_1H_HARAD_04)
		{
			kosten = 10;
		};
	};
	if(talent == NPC_TALENT_ALCHEMY)
	{
		if(skill == POTION_HEALTH_01)
		{
			kosten = 1;
		}
		else if(skill == POTION_HEALTH_02)
		{
			kosten = 3;
		}
		else if(skill == POTION_HEALTH_03)
		{
			kosten = 5;
		}
		else if(skill == POTION_HEALTH_04)
		{
			kosten = 8;
		}
		else if(skill == POTION_MANA_01)
		{
			kosten = 1;
		}
		else if(skill == POTION_MANA_02)
		{
			kosten = 3;
		}
		else if(skill == POTION_MANA_03)
		{
			kosten = 5;
		}
		else if(skill == POTION_MANA_04)
		{
			kosten = 8;
		}
		else if(skill == POTION_SPEED)
		{
			kosten = 5;
		}
		else if(skill == POTION_PERM_STR)
		{
			kosten = 20;
		}
		else if(skill == POTION_PERM_DEX)
		{
			kosten = 20;
		}
		else if(skill == POTION_PERM_MANA)
		{
			kosten = 10;
		}
		else if(skill == POTION_PERM_HEALTH)
		{
			kosten = 10;
		}
		else if(skill == POTION_MEGADRINK)
		{
			kosten = 20;
		};
	};
	if(talent == NPC_TALENT_TAKEANIMALTROPHY)
	{
		if(skill == TROPHY_TEETH)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_CLAWS)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_FUR)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_HEART)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_SHADOWHORN)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_FIRETONGUE)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_BFWING)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_BFSTING)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_MANDIBLES)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_CRAWLERPLATE)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_DRGSNAPPERHORN)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_DRAGONSCALE)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_DRAGONBLOOD)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_REPTILESKIN)
		{
			kosten = 3;
		};
	};
	if(talent == NPC_TALENT_FOREIGNLANGUAGE)
	{
		if(skill == LANGUAGE_1)
		{
			kosten = 5;
		}
		else if(skill == LANGUAGE_2)
		{
			kosten = 10;
		}
		else if(skill == LANGUAGE_3)
		{
			kosten = 15;
		};
	};
	if(talent == NPC_TALENT_WISPDETECTOR)
	{
		if(skill == WISPSKILL_NF)
		{
			kosten = 0;
		}
		else if(skill == WISPSKILL_FF)
		{
			kosten = 1;
		}
		else if(skill == WISPSKILL_NONE)
		{
			kosten = 2;
		}
		else if(skill == WISPSKILL_RUNE)
		{
			kosten = 3;
		}
		else if(skill == WISPSKILL_MAGIC)
		{
			kosten = 4;
		}
		else if(skill == WISPSKILL_FOOD)
		{
			kosten = 5;
		}
		else if(skill == WISPSKILL_POTIONS)
		{
			kosten = 5;
		};
	};
	if(talent == NPC_TALENT_RUNES)
	{
		if(skill == SPL_PALLIGHT)
		{
			kosten = 1;
		}
		else if(skill == SPL_PALLIGHTHEAL)
		{
			kosten = 3;
		}
		else if(skill == SPL_PALHOLYBOLT)
		{
			kosten = 3;
		}
		else if(skill == SPL_PALMEDIUMHEAL)
		{
			kosten = 5;
		}
		else if(skill == SPL_PALREPELEVIL)
		{
			kosten = 5;
		}
		else if(skill == SPL_PALFULLHEAL)
		{
			kosten = 10;
		}
		else if(skill == SPL_PALDESTROYEVIL)
		{
			kosten = 10;
		}
		else if(skill == SPL_PALTELEPORTSECRET)
		{
			kosten = 5;
		}
		else if(skill == SPL_LIGHT)
		{
			kosten = 1;
		}
		else if(skill == SPL_FIREBOLT)
		{
			kosten = 5;
		}
		else if(skill == SPL_LIGHTHEAL)
		{
			kosten = 3;
		}
		else if(skill == SPL_SUMMONGOBLINSKELETON)
		{
			kosten = 3;
		}
		else if(skill == SPL_ZAP)
		{
			kosten = 3;
		}
		else if(skill == SPL_ICEBOLT)
		{
			kosten = 5;
		}
		else if(skill == SPL_INSTANTFIREBALL)
		{
			kosten = 10;
		}
		else if(skill == SPL_SUMMONWOLF)
		{
			kosten = 5;
		}
		else if(skill == SPL_WINDFIST)
		{
			kosten = 5;
		}
		else if(skill == SPL_SLEEP)
		{
			kosten = 5;
		}
		else if(skill == SPL_CHARM)
		{
			kosten = 5;
		}
		else if(skill == SPL_ICELANCE)
		{
			kosten = 5;
		}
		else if(skill == SPL_WHIRLWIND)
		{
			kosten = 5;
		}
		else if(skill == SPL_MEDIUMHEAL)
		{
			kosten = 5;
		}
		else if(skill == SPL_LIGHTNINGFLASH)
		{
			kosten = 5;
		}
		else if(skill == SPL_CHARGEFIREBALL)
		{
			kosten = 10;
		}
		else if(skill == SPL_SUMMONSKELETON)
		{
			kosten = 10;
		}
		else if(skill == SPL_FEAR)
		{
			kosten = 5;
		}
		else if(skill == SPL_ICECUBE)
		{
			kosten = 10;
		}
		else if(skill == SPL_THUNDERSTORM)
		{
			kosten = 5;
		}
		else if(skill == SPL_GEYSER)
		{
			kosten = 10;
		}
		else if(skill == SPL_CHARGEZAP)
		{
			kosten = 10;
		}
		else if(skill == SPL_SUMMONGOLEM)
		{
			kosten = 15;
		}
		else if(skill == SPL_DESTROYUNDEAD)
		{
			kosten = 10;
		}
		else if(skill == SPL_PYROKINESIS)
		{
			kosten = 10;
		}
		else if(skill == SPL_WATERFIST)
		{
			kosten = 10;
		}
		else if(skill == SPL_FIRESTORM)
		{
			kosten = 15;
		}
		else if(skill == SPL_ICEWAVE)
		{
			kosten = 20;
		}
		else if(skill == SPL_SUMMONDEMON)
		{
			kosten = 20;
		}
		else if(skill == SPL_FULLHEAL)
		{
			kosten = 10;
		}
		else if(skill == SPL_MASTEROFDISASTER)
		{
			kosten = 15;
		}
		else if(skill == SPL_FIRERAIN)
		{
			kosten = 20;
		}
		else if(skill == SPL_BREATHOFDEATH)
		{
			kosten = 20;
		}
		else if(skill == SPL_MASSDEATH)
		{
			kosten = 20;
		}
		else if(skill == SPL_ARMYOFDARKNESS)
		{
			kosten = 20;
		}
		else if(skill == SPL_SHRINK)
		{
			kosten = 20;
		}
		else
		{
			kosten = 5;
		};
	};
	return kosten;
};

