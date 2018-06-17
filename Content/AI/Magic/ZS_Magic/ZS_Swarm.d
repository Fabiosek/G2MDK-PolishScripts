
func void b_restartswarm()
{
	if(Npc_GetLastHitSpellID(self) == SPL_SWARM)
	{
		Npc_SetStateTime(self,0);
	};
};

func void b_stopswarm()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		b_assessdamage();
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
	};
};

func int zs_swarm()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_restartswarm);
	Npc_StopAni(self,"S_SWARM_VICTIM");
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(!c_bodystatecontains(self,BS_UNCONSCIOUS))
	{
		AI_PlayAniBS(self,"T_STAND_2_SWARM_VICTIM",BS_UNCONSCIOUS);
	};
	self.aivar[AIV_SWARMSTATETIME] = 0;
};

func int zs_swarm_loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_SWARM)
	{
		b_stopswarm();
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) != self.aivar[AIV_SWARMSTATETIME])
	{
		if(Npc_GetStateTime(self) == 2)
		{
			b_say(self,other,"$RunAway");
		}
		else if(Npc_GetStateTime(self) == 6)
		{
			b_say(self,other,"$Aargh_2");
		}
		else if(Npc_GetStateTime(self) == 7)
		{
			b_say(self,other,"$Aargh_3");
		}
		else if(Npc_GetStateTime(self) == 8)
		{
			b_say(self,other,"$Aargh_1");
		};
		self.aivar[AIV_SWARMSTATETIME] = Npc_GetStateTime(self);
		if(self.attribute[ATR_HITPOINTS] > SPL_SWARM_DAMAGE)
		{
			b_magichurtnpc(other,self,SPL_SWARM_DAMAGE);
		}
		else
		{
			b_magichurtnpc(other,self,self.attribute - 1);
		};
	};
	return LOOP_CONTINUE;
};

func void zs_swarm_end()
{
};

