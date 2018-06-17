
func int c_playerisfakepirate(var C_NPC slf,var C_NPC oth)
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
	if(Npc_HasEquippedArmor(other) == TRUE)
	{
		itm = Npc_GetEquippedArmor(oth);
		if((Hlp_IsItem(itm,itar_pir_l_addon) == TRUE) || (Hlp_IsItem(itm,itar_pir_m_addon) == TRUE) || (Hlp_IsItem(itm,itar_pir_h_addon) == TRUE))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	}
	else
	{
		return FALSE;
	};
};

