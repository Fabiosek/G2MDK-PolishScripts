
func int c_playerisfakebandit(var C_NPC slf,var C_NPC oth)
{
	var C_ITEM itm;
	if(slf.aivar[AIV_IGNORESARMOR] == TRUE)
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IGNORESFAKEGUILD] == TRUE)
	{
		return FALSE;
	};
	if(slf.guild == GIL_PIR)
	{
		return FALSE;
	};
	if(Npc_HasEquippedArmor(oth) == TRUE)
	{
		itm = Npc_GetEquippedArmor(oth);
		if((Hlp_IsItem(itm,itar_bdt_m) == TRUE) || (Hlp_IsItem(itm,itar_thorus_addon) == TRUE) || (Hlp_IsItem(itm,itar_bdt_h) == TRUE))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	}
	else if((slf.guild == GIL_BDT) && (CURRENTLEVEL == ADDONWORLD_ZEN) && (PLAYER_HASTALKEDTOBANDITCAMP == TRUE))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

