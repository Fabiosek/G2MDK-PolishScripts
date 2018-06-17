
func void b_getwispdetecteditem()
{
	var int randy;
	if(!Hlp_IsValidItem(item))
	{
		return;
	};
	if(Npc_GetHeightToItem(self,item) > 500)
	{
		return;
	};
	randy = Hlp_Random(100);
	AI_GotoItem(self,item);
	if((Npc_GetDistToItem(self,item) < 1000) && (randy <= 1))
	{
		Wld_PlayEffect("spellFX_ItemAusbuddeln",item,item,0,0,0,FALSE);
	};
};

func int b_wispdetecteditem()
{
	var int wispsearchflags;
	if(WISPSEARCHING == WISPSEARCH_FOLLOW)
	{
	}
	else
	{
		wispsearchflags = 0;
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == TRUE) && ((WISPSEARCHING == WISPSEARCH_ALL) || (WISPSEARCHING == WISPSEARCH_NF)))
		{
			wispsearchflags = wispsearchflags | ITEM_KAT_NF;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == TRUE) && ((WISPSEARCHING == WISPSEARCH_ALL) || (WISPSEARCHING == WISPSEARCH_FF)))
		{
			wispsearchflags = wispsearchflags | ITEM_KAT_FF | ITEM_KAT_MUN;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == TRUE) && ((WISPSEARCHING == WISPSEARCH_ALL) || (WISPSEARCHING == WISPSEARCH_NONE)))
		{
			wispsearchflags = wispsearchflags | ITEM_KAT_NONE | ITEM_KAT_KEYS | ITEM_KAT_LIGHT | ITEM_KAT_ARMOR;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == TRUE) && ((WISPSEARCHING == WISPSEARCH_ALL) || (WISPSEARCHING == WISPSEARCH_RUNE)))
		{
			wispsearchflags = wispsearchflags | ITEM_KAT_RUNE | ITEM_KAT_DOCS;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE) && ((WISPSEARCHING == WISPSEARCH_ALL) || (WISPSEARCHING == WISPSEARCH_MAGIC)))
		{
			wispsearchflags = wispsearchflags | ITEM_KAT_MAGIC;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == TRUE) && ((WISPSEARCHING == WISPSEARCH_ALL) || (WISPSEARCHING == WISPSEARCH_FOOD)))
		{
			wispsearchflags = wispsearchflags | ITEM_KAT_FOOD;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE) && ((WISPSEARCHING == WISPSEARCH_ALL) || (WISPSEARCHING == WISPSEARCH_POTIONS)))
		{
			wispsearchflags = wispsearchflags | ITEM_KAT_POTIONS;
		};
		if(wispsearchflags != 0)
		{
			if(Wld_DetectItem(self,wispsearchflags))
			{
				b_getwispdetecteditem();
			};
		};
		return wispsearchflags;
	};
	return 0;
};

func int b_mm_wispdetect()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(wisp_detector))
	{
		Npc_PerceiveAll(self);
		if(Wld_DetectNpc(self,wisp_detector,NOFUNC,-1))
		{
			b_removenpc(self);
		};
		if((Npc_GetDistToNpc(self,hero) < 2000) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
		{
			self.aivar[AIV_SUMMONTIME] = 0;
			b_wispdetecteditem();
			return LOOP_END;
		}
		else
		{
			if(Npc_GetDistToNpc(self,hero) < 500)
			{
				self.aivar[AIV_TAPOSITION] = ISINPOS;
			}
			else
			{
				self.aivar[AIV_TAPOSITION] = NOTINPOS;
				Npc_ClearAIQueue(self);
				AI_GotoNpc(self,hero);
			};
			return LOOP_END;
		};
	};
};

