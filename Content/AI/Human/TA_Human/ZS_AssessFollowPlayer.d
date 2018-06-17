
func void b_assessfollowplayer()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(diegoow))
	{
		if((Npc_GetDistToNpc(self,hero) < self.aivar[AIV_FOLLOWDIST]) && (self.aivar[AIV_TAPOSITION] == FALSE))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			self.aivar[AIV_TAPOSITION] = TRUE;
		}
		else if(c_diegotoofar(0) && (self.aivar[AIV_TAPOSITION] == FALSE))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			self.aivar[AIV_TAPOSITION] = TRUE;
			if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
			{
				b_say(self,other,"$SC_HEYWAITASECOND");
			};
		}
		else
		{
			b_assessplayer();
		};
		return;
	};
	if((Npc_GetDistToNpc(self,hero) < self.aivar[AIV_FOLLOWDIST]) && (self.aivar[AIV_TAPOSITION] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_TAPOSITION] = TRUE;
	}
	else
	{
		b_assessplayer();
	};
};

func void b_assessfollowfightsound()
{
	if(Npc_IsPlayer(other) || Npc_IsPlayer(victim) || (other.aivar[AIV_PARTYMEMBER] == TRUE) || (victim.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		b_assessfightsound();
	};
};

func void b_movefollownpc()
{
};

func void zs_follow_player()
{
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	self.senses_range = 2000;
	Npc_SetPercTime(self,0.3);
	perception_set_minimal();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assessfollowplayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfollowfightsound);
	b_resetall(self);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	if(self.aivar[AIV_FOLLOWDIST] == 0)
	{
		self.aivar[AIV_FOLLOWDIST] = 500;
	};
};

func int zs_follow_player_loop()
{
	if(Npc_GetDistToNpc(self,hero) > self.aivar[AIV_FOLLOWDIST])
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(diegoow))
		{
			if(c_diegotoofar(0))
			{
				if(Npc_GetStateTime(self) > 1)
				{
					b_turntonpc(self,hero);
					Npc_SetStateTime(self,0);
				};
				return LOOP_CONTINUE;
			};
		};
		if(!c_bodystatecontains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		AI_GotoNpc(self,hero);
		self.aivar[AIV_TAPOSITION] = FALSE;
	}
	else if(Npc_GetStateTime(self) > 1)
	{
		b_turntonpc(self,hero);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_follow_player_end()
{
};

