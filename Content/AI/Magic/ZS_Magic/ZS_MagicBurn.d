
const int SPL_MAGICBURN_DAMAGE_PER_SEC = 1;

func void b_stopmagicburn()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		b_assessdamage();
		AI_ContinueRoutine(self);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_ContinueRoutine(self);
	};
};

func void b_restartburn()
{
	if((Npc_GetLastHitSpellID(self) == SPL_FIRERAIN) || (Npc_GetLastHitSpellID(self) == SPL_CHARGEFIREBALL) || (Npc_GetLastHitSpellID(self) == SPL_INSTANTFIREBALL) || (Npc_GetLastHitSpellID(self) == SPL_FIREBOLT))
	{
		Npc_SetStateTime(self,0);
		return;
	};
	if((Npc_GetLastHitSpellID(self) == SPL_ICEWAVE) || (Npc_GetLastHitSpellID(self) == SPL_ICECUBE))
	{
		Npc_ClearAIQueue(self);
		b_clearperceptions(self);
		AI_StartState(self,zs_magicfreeze,0,"");
	};
};

func int zs_magicburn()
{
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,b_stopmagicburn);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
};

func int zs_magicburn_loop()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_restartburn);
	if(Npc_GetStateTime(self) == 1)
	{
		Npc_SetStateTime(self,0);
		b_magichurtnpc(other,self,SPL_MAGICBURN_DAMAGE_PER_SEC);
	};
	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_magicburn_end()
{
};

