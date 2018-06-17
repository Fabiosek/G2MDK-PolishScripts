
func int b_giveinvitems(var C_NPC giver,var C_NPC taker,var int iteminstance,var int amount)
{
	var string concattext;
	var string itemname;
	if(Npc_IsPlayer(giver))
	{
		if(amount > Npc_HasItems(giver,iteminstance))
		{
			return FALSE;
		};
	};
	if(amount == 0)
	{
		return TRUE;
	};
	Npc_RemoveInvItems(giver,iteminstance,amount);
	CreateInvItems(taker,iteminstance,amount);
	itemname = item.name;
	if(Npc_IsPlayer(giver))
	{
		if(iteminstance == itmi_gold)
		{
			concattext = ConcatStrings(IntToString(amount),PRINT_GOLDGEGEBEN);
			AI_PrintScreen(concattext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
		}
		else if(amount == 1)
		{
			concattext = ConcatStrings(itemname,PRINT_ADDON_GEGEBEN);
			AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		}
		else
		{
			concattext = ConcatStrings(IntToString(amount),PRINT_ITEMSGEGEBEN);
			concattext = ConcatStrings(concattext," (");
			concattext = ConcatStrings(concattext,itemname);
			concattext = ConcatStrings(concattext,")");
			AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		};
	}
	else if(Npc_IsPlayer(taker))
	{
		if(iteminstance == itmi_gold)
		{
			concattext = ConcatStrings(IntToString(amount),PRINT_GOLDERHALTEN);
			AI_PrintScreen(concattext,-1,YPOS_GOLDTAKEN,FONT_SCREENSMALL,2);
		}
		else if(amount == 1)
		{
			concattext = ConcatStrings(itemname,PRINT_ADDON_ERHALTEN);
			AI_PrintScreen(concattext,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
		}
		else
		{
			concattext = ConcatStrings(IntToString(amount),PRINT_ITEMSERHALTEN);
			concattext = ConcatStrings(concattext," (");
			concattext = ConcatStrings(concattext,itemname);
			concattext = ConcatStrings(concattext,")");
			AI_PrintScreen(concattext,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
		};
	};
	return TRUE;
};

