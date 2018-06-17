
func void zs_ghost()
{
	var C_NPC quarho;
	quarho = Hlp_GetNpc(none_addon_111_quarhodron);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(quarho))
	{
		if(GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE)
		{
			Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
		};
	}
	else
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	};
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_assessdamage);
	b_resetall(self);
	Npc_SetPercTime(self,0.1);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int zs_ghost_loop()
{
	if(Npc_GetStateTime(self) >= 5)
	{
		if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
		{
			AI_AlignToWP(self);
			Npc_SetStateTime(self,0);
		};
		b_removeghost();
	};
	return LOOP_CONTINUE;
};

func void zs_ghost_end()
{
};

func void zs_ghostwusel()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_assessdamage);
	b_resetall(self);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_GotoFP(self,"FP_ROAM");
};

func int zs_ghostwusel_loop()
{
	if(Npc_GetStateTime(self) >= 3)
	{
		if(Npc_IsOnFP(self,"FP_ROAM"))
		{
			if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
			{
				Npc_ClearAIQueue(self);
				AI_GotoNextFP(self,"FP_ROAM");
			};
		}
		else if(!c_bodystatecontains(self,BS_WALK) && !c_bodystatecontains(self,BS_RUN))
		{
			AI_GotoFP(self,"FP_ROAM");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_ghostwusel_end()
{
};

