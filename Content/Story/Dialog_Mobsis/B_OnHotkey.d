
func int b_getbestplayermap()
{
	if(CURRENTLEVEL == NEWWORLD_ZEN)
	{
		if(Npc_HasItems(hero,itwr_map_newworld) >= 1)
		{
			return itwr_map_newworld;
		}
		else if(Npc_HasItems(hero,itwr_map_shrine_mis) >= 1)
		{
			return itwr_map_shrine_mis;
		}
		else if(Npc_HasItems(hero,itwr_map_caves_mis) >= 1)
		{
			return itwr_map_caves_mis;
		}
		else if(Npc_HasItems(hero,itwr_map_newworld_ornaments_addon) >= 1)
		{
			return itwr_map_newworld_ornaments_addon;
		}
		else if(Npc_HasItems(hero,itwr_map_newworld_dexter) >= 1)
		{
			return itwr_map_newworld_dexter;
		}
		else if(Npc_HasItems(hero,itwr_shatteredgolem_mis) >= 1)
		{
			return itwr_shatteredgolem_mis;
		}
		else if(Npc_HasItems(hero,itwr_map_orcelite_mis) >= 1)
		{
			return itwr_map_orcelite_mis;
		}
		else if(Npc_HasItems(hero,itwr_map_newworld_city) >= 1)
		{
			return itwr_map_newworld_city;
		};
	}
	else if(CURRENTLEVEL == OLDWORLD_ZEN)
	{
		if(Npc_HasItems(hero,itwr_map_oldworld) >= 1)
		{
			return itwr_map_oldworld;
		}
		else if(Npc_HasItems(hero,itwr_map_oldworld_oremines_mis) >= 1)
		{
			return itwr_map_oldworld_oremines_mis;
		};
	}
	else if(CURRENTLEVEL == DRAGONISLAND_ZEN)
	{
	}
	else if(CURRENTLEVEL == ADDONWORLD_ZEN)
	{
		if(Npc_HasItems(hero,itwr_map_addonworld) >= 1)
		{
			return itwr_map_addonworld;
		}
		else if(Npc_HasItems(hero,itwr_addon_treasuremap) >= 1)
		{
			return itwr_addon_treasuremap;
		};
	};
	return 0;
};

func int b_getanyplayermap()
{
	if(Npc_HasItems(hero,itwr_map_newworld) >= 1)
	{
		return itwr_map_newworld;
	}
	else if(Npc_HasItems(hero,itwr_map_shrine_mis) >= 1)
	{
		return itwr_map_shrine_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_caves_mis) >= 1)
	{
		return itwr_map_caves_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_newworld_ornaments_addon) >= 1)
	{
		return itwr_map_newworld_ornaments_addon;
	}
	else if(Npc_HasItems(hero,itwr_map_newworld_dexter) >= 1)
	{
		return itwr_map_newworld_dexter;
	}
	else if(Npc_HasItems(hero,itwr_shatteredgolem_mis) >= 1)
	{
		return itwr_shatteredgolem_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_orcelite_mis) >= 1)
	{
		return itwr_map_orcelite_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_newworld_city) >= 1)
	{
		return itwr_map_newworld_city;
	}
	else if(Npc_HasItems(hero,itwr_map_oldworld) >= 1)
	{
		return itwr_map_oldworld;
	}
	else if(Npc_HasItems(hero,itwr_map_oldworld_oremines_mis) >= 1)
	{
		return itwr_map_oldworld_oremines_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_addonworld) >= 1)
	{
		return itwr_map_addonworld;
	}
	else if(Npc_HasItems(hero,itwr_addon_treasuremap) >= 1)
	{
		return itwr_addon_treasuremap;
	};
	return 0;
};

func int player_hotkey_screen_map()
{
	var int oldinstance;
	var int newinstance;
	oldinstance = b_getplayermap();
	if((oldinstance > 0) && (Npc_HasItems(hero,oldinstance) < 1))
	{
		oldinstance = 0;
	};
	b_setplayermap(oldinstance);
	newinstance = oldinstance;
	if(CURRENTLEVEL != NEWWORLD_ZEN)
	{
		if((oldinstance == itwr_map_caves_mis) || (oldinstance == itwr_map_newworld) || (oldinstance == itwr_map_newworld_city) || (oldinstance == itwr_map_newworld_dexter) || (oldinstance == itwr_map_newworld_ornaments_addon) || (oldinstance == itwr_map_orcelite_mis) || (oldinstance == itwr_map_shrine_mis) || (oldinstance == itwr_shatteredgolem_mis))
		{
			newinstance = 0;
		};
	};
	if(CURRENTLEVEL != OLDWORLD_ZEN)
	{
		if((oldinstance == itwr_map_oldworld) || (oldinstance == itwr_map_oldworld_oremines_mis))
		{
			newinstance = 0;
		};
	};
	if(CURRENTLEVEL != DRAGONISLAND_ZEN)
	{
	};
	if(CURRENTLEVEL != ADDONWORLD_ZEN)
	{
		if((oldinstance == itwr_map_addonworld) || (oldinstance == itwr_addon_treasuremap))
		{
			newinstance = 0;
		};
	};
	if(newinstance <= 0)
	{
		newinstance = b_getbestplayermap();
	};
	if((newinstance <= 0) && (oldinstance <= 0))
	{
		newinstance = b_getanyplayermap();
	};
	if(newinstance > 0)
	{
		b_setplayermap(newinstance);
		return newinstance;
	}
	else
	{
		return oldinstance;
	};
};

func void b_lameschlork()
{
	Snd_Play("DRINKBOTTLE");
};

func void player_hotkey_lame_potion()
{
	if(Npc_IsInState(hero,zs_dead) == FALSE)
	{
		if(Npc_HasItems(hero,itpo_mana_03) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= MANA_ELIXIER))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,MANA_ELIXIER);
			Npc_RemoveInvItem(hero,itpo_mana_03);
			b_lameschlork();
		}
		else if(Npc_HasItems(hero,itpo_mana_02) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= MANA_EXTRAKT))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,MANA_EXTRAKT);
			Npc_RemoveInvItem(hero,itpo_mana_02);
			b_lameschlork();
		}
		else if(Npc_HasItems(hero,itpo_mana_01) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= MANA_ESSENZ))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,MANA_ESSENZ);
			Npc_RemoveInvItem(hero,itpo_mana_01);
			b_lameschlork();
		}
		else if(hero.attribute[ATR_MANA_MAX] != hero.attribute[ATR_MANA])
		{
			if(Npc_HasItems(hero,itpo_mana_01))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,MANA_ESSENZ);
				Npc_RemoveInvItem(hero,itpo_mana_01);
				b_lameschlork();
			}
			else if(Npc_HasItems(hero,itpo_mana_02))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,MANA_EXTRAKT);
				Npc_RemoveInvItem(hero,itpo_mana_02);
				b_lameschlork();
			}
			else if(Npc_HasItems(hero,itpo_mana_03))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,MANA_ELIXIER);
				Npc_RemoveInvItem(hero,itpo_mana_03);
				b_lameschlork();
			}
			else
			{
				Print("Brak mikstur many!");
			};
		}
		else
		{
			Print("Maksymalny mo¿liwy poziom many!");
		};
	};
};

func void player_hotkey_lame_heal()
{
	if(Npc_IsInState(hero,zs_dead) == FALSE)
	{
		if(Npc_HasItems(hero,itpo_health_03) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_ELIXIER))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_ELIXIER);
			Npc_RemoveInvItem(hero,itpo_health_03);
			b_lameschlork();
		}
		else if(Npc_HasItems(hero,itpo_health_02) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_EXTRAKT))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_EXTRAKT);
			Npc_RemoveInvItem(hero,itpo_health_02);
			b_lameschlork();
		}
		else if(Npc_HasItems(hero,itpo_health_01) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_ESSENZ))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_ESSENZ);
			Npc_RemoveInvItem(hero,itpo_health_01);
			b_lameschlork();
		}
		else if(hero.attribute[ATR_HITPOINTS_MAX] != hero.attribute[ATR_HITPOINTS])
		{
			if(Npc_HasItems(hero,itpo_health_01))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_ESSENZ);
				Npc_RemoveInvItem(hero,itpo_health_01);
				b_lameschlork();
			}
			else if(Npc_HasItems(hero,itpo_health_02))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_EXTRAKT);
				Npc_RemoveInvItem(hero,itpo_health_02);
				b_lameschlork();
			}
			else if(Npc_HasItems(hero,itpo_health_03))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_ELIXIER);
				Npc_RemoveInvItem(hero,itpo_health_03);
				b_lameschlork();
			}
			else
			{
				Print("Brak mikstur leczniczych!");
			};
		}
		else
		{
			Print("Maksymalna mo¿liwa liczba punktów trafieñ!");
		};
	};
};

