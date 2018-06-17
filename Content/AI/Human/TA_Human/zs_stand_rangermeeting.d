
func void zs_stand_rangermeeting()
{
	perception_set_minimal();
	b_resetall(self);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	self.senses_range = 500;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assessguideplayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(lares)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(erol)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(greg_nw)))
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	};
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessguidefightsound);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(lares)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(greg_nw)))
	{
		AI_SetWalkMode(self,NPC_RUN);
		if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_AlignToWP(self);
		AI_PlayAni(self,"T_STAND_2_HGUARD");
	}
	else
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
		{
			AI_GotoWP(self,self.wp);
		};
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};
};

func int zs_stand_rangermeeting_loop()
{
	var int random;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(lares))
	{
		if(Npc_GetStateTime(self) > 5)
		{
			random = Hlp_Random(2);
			if(random == 0)
			{
				AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
			};
			Npc_SetStateTime(self,0);
		};
	}
	else
	{
		if(Npc_IsOnFP(self,"STAND"))
		{
			AI_AlignToFP(self);
			if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
			{
				self.aivar[AIV_TAPOSITION] = NOTINPOS;
			};
		}
		else if(Wld_IsFPAvailable(self,"STAND"))
		{
			AI_GotoFP(self,"STAND");
			AI_Standup(self);
			AI_AlignToFP(self);
			self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
		}
		else
		{
			AI_AlignToWP(self);
			if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
			{
				self.aivar[AIV_TAPOSITION] = NOTINPOS;
			};
		};
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
		{
			AI_Standup(self);
			AI_PlayAni(self,"T_STAND_2_LGUARD");
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
		{
			random = Hlp_Random(7);
			if(random == 0)
			{
				AI_PlayAni(self,"T_LGUARD_SCRATCH");
			}
			else if(random == 1)
			{
				AI_PlayAni(self,"T_LGUARD_STRETCH");
			}
			else if(random == 2)
			{
				AI_PlayAni(self,"T_LGUARD_CHANGELEG");
			};
			Npc_SetStateTime(self,0);
		};
	};
	return LOOP_CONTINUE;
};

func void zs_stand_rangermeeting_end()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(lares))
	{
	}
	else
	{
		AI_PlayAni(self,"T_LGUARD_2_STAND");
	};
};

