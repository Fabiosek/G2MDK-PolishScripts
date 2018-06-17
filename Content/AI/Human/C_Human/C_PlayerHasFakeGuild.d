
func int c_playerhasfakeguild(var C_NPC slf,var C_NPC oth)
{
	var C_ITEM itm;
	var int nsc_commentrangerarmor;
	itm = Npc_GetEquippedArmor(oth);
	nsc_commentrangerarmor = TRUE;
	if(slf.aivar[AIV_IGNORESARMOR] == TRUE)
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IGNORESFAKEGUILD] == TRUE)
	{
		return FALSE;
	};
	if(c_npcisgateguard(self) == TRUE)
	{
		return FALSE;
	};
	if((slf.guild == GIL_BDT) && c_playerisfakebandit(slf,oth))
	{
		if(Npc_HasEquippedArmor(oth) == FALSE)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(Npc_HasEquippedArmor(oth) == FALSE)
	{
		return FALSE;
	}
	else if(slf.guild == oth.guild)
	{
		if(Hlp_IsItem(itm,itar_ranger_addon) == TRUE)
		{
			if(nsc_commentrangerarmor == TRUE)
			{
				return TRUE;
			}
			else
			{
				return FALSE;
			};
		};
		if((oth.guild == GIL_NONE) && ((Hlp_IsItem(itm,itar_vlk_l) == TRUE) || (Hlp_IsItem(itm,itar_vlk_m) == TRUE) || (Hlp_IsItem(itm,itar_vlk_h) == TRUE) || (Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE) || (Hlp_IsItem(itm,itar_leather_l) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_MIL) && ((Hlp_IsItem(itm,itar_mil_l) == TRUE) || (Hlp_IsItem(itm,itar_mil_m) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_PAL) && ((Hlp_IsItem(itm,itar_pal_m) == TRUE) || (Hlp_IsItem(itm,itar_pal_h) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_SLD) && ((Hlp_IsItem(itm,itar_sld_l) == TRUE) || (Hlp_IsItem(itm,itar_sld_m) == TRUE) || (Hlp_IsItem(itm,itar_sld_h) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_DJG) && ((Hlp_IsItem(itm,itar_sld_l) == TRUE) || (Hlp_IsItem(itm,itar_sld_m) == TRUE) || (Hlp_IsItem(itm,itar_sld_h) == TRUE) || (Hlp_IsItem(itm,itar_djg_l) == TRUE) || (Hlp_IsItem(itm,itar_djg_m) == TRUE) || (Hlp_IsItem(itm,itar_djg_h) == TRUE) || (Hlp_IsItem(itm,itar_djg_crawler) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_NOV) && (Hlp_IsItem(itm,itar_nov_l) == TRUE))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_KDF) && ((Hlp_IsItem(itm,itar_kdf_l) == TRUE) || (Hlp_IsItem(itm,itar_kdf_h) == TRUE)))
		{
			return FALSE;
		}
		else
		{
			return TRUE;
		};
	}
	else
	{
		return FALSE;
	};
};

