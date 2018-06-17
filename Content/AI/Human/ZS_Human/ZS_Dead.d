
func void zs_dead()
{
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	b_stoplookat(self);
	AI_StopPointAt(self);
	if((Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)) && (self.aivar[AIV_VICTORYXPGIVEN] == FALSE))
	{
		b_giveplayerxp(self.level * XP_PER_VICTORY);
		self.aivar[AIV_VICTORYXPGIVEN] = TRUE;
	};
	if(c_iamcanyonrazor(self) == TRUE)
	{
		CANYONRAZORBODYCOUNT = CANYONRAZORBODYCOUNT + 1;
		if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
		{
			b_countcanyonrazor();
		};
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		if(Npc_GetDistToNpc(self,other) < 300)
		{
			other.attribute[ATR_HITPOINTS] -= 50;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(diegoow))
	{
		DIEGO_ISDEAD = TRUE;
	};
	if(Npc_IsPlayer(other))
	{
		self.aivar[AIV_KILLEDBYPLAYER] = TRUE;
		if(c_dropunconscious())
		{
			MADKILLERCOUNT = MADKILLERCOUNT + 1;
		};
		if((self.guild == GIL_GIANT_BUG) && (MIS_FESTER_KILLBUGS == LOG_RUNNING))
		{
			FESTERS_GIANT_BUG_KILLED = FESTERS_GIANT_BUG_KILLED + 1;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(swamprat)) && (MIS_KROKOJAGD == LOG_RUNNING))
		{
			ALLIGATORJACK_KROKOSKILLED = ALLIGATORJACK_KROKOSKILLED + 1;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ramon))
		{
			PLAYER_HASTALKEDTOBANDITCAMP = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(franco))
		{
			if(MIS_HLPLOGAN == LOG_RUNNING)
			{
				MIS_HLPLOGAN = LOG_OBSOLETE;
			};
			if(MIS_HLPEDGOR == LOG_RUNNING)
			{
				MIS_HLPEDGOR = LOG_OBSOLETE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(fortuno))
		{
			Log_SetTopicStatus(TOPIC_ADDON_FORTUNO,LOG_OBSOLETE);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(goldminecrawler))
	{
		if((MINECRAWLER_KILLED >= 9) && (BLOODWYN_SPAWN == FALSE))
		{
			AI_Teleport(bloodwyn,"ADW_MINE_TO_MC_03");
			b_startotherroutine(bloodwyn,"MINE");
			b_giveplayerxp(XP_ADDON_BLOODYWYN);
			BLOODWYN_SPAWN = TRUE;
		}
		else
		{
			MINECRAWLER_KILLED = MINECRAWLER_KILLED + 1;
		};
	};
	b_givetradeinv(self);
	b_givedeathinv(self);
	b_clearruneinv(self);
	b_deletepetzcrime(self);
	self.aivar[AIV_NPCSAWPLAYERCOMMIT] = CRIME_NONE;
	AI_UnequipWeapons(self);
	self.aivar[AIV_TAPOSITION] = FALSE;
};

func int zs_dead_loop()
{
	if(self.aivar[AIV_TAPOSITION] == FALSE)
	{
		b_dragonkillcounter(self);
		self.aivar[AIV_TAPOSITION] = TRUE;
	};
	return LOOP_CONTINUE;
};

