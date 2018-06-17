
func int c_allcanyonrazordead()
{
	if((GREGISBACK == TRUE) && Npc_IsDead(canyonrazor01) && Npc_IsDead(canyonrazor02) && Npc_IsDead(canyonrazor03) && Npc_IsDead(canyonrazor04) && Npc_IsDead(canyonrazor05) && Npc_IsDead(canyonrazor06) && Npc_IsDead(canyonrazor07) && Npc_IsDead(canyonrazor08) && Npc_IsDead(canyonrazor09) && Npc_IsDead(canyonrazor10))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int c_iamcanyonrazor(var C_NPC slf)
{
	var C_NPC raz01;
	var C_NPC raz02;
	var C_NPC raz03;
	var C_NPC raz04;
	var C_NPC raz05;
	var C_NPC raz06;
	var C_NPC raz07;
	var C_NPC raz08;
	var C_NPC raz09;
	var C_NPC raz10;
	raz01 = Hlp_GetNpc(canyonrazor01);
	raz02 = Hlp_GetNpc(canyonrazor02);
	raz03 = Hlp_GetNpc(canyonrazor03);
	raz04 = Hlp_GetNpc(canyonrazor04);
	raz05 = Hlp_GetNpc(canyonrazor05);
	raz06 = Hlp_GetNpc(canyonrazor06);
	raz07 = Hlp_GetNpc(canyonrazor07);
	raz08 = Hlp_GetNpc(canyonrazor08);
	raz09 = Hlp_GetNpc(canyonrazor09);
	raz10 = Hlp_GetNpc(canyonrazor10);
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz01)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz02)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz03)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz04)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz05)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz06)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz07)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz08)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz09)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz10)))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void b_countcanyonrazor()
{
	var string canyonrazortext;
	var string canyonrazorleft;
	canyonrazorleft = IntToString(10 - CANYONRAZORBODYCOUNT);
	canyonrazortext = ConcatStrings(canyonrazorleft,PRINT_ADDON_CANYONRAZORSLEFT);
	AI_PrintScreen(canyonrazortext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};

