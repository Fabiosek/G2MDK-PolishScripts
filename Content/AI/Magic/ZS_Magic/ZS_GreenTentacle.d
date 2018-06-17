
func void b_restartgreententacle()
{
	if(Npc_GetLastHitSpellID(self) == SPL_GREENTENTACLE)
	{
		Npc_SetStateTime(self,0);
	};
};

func void b_stopgreententacle()
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

func int zs_greententacle()
{
	var int randy;
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_restartgreententacle);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_assessdamage);
	Npc_StopAni(self,"s_GreententacleA_Victim");
	Npc_StopAni(self,"s_GreententacleB_Victim");
	Npc_StopAni(self,"s_GreententacleC_Victim");
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(!c_bodystatecontains(self,BS_UNCONSCIOUS))
	{
		if(self.guild < GIL_SEPERATOR_HUM)
		{
			if(randy == 0)
			{
				AI_PlayAniBS(self,"T_STAND_2_GREENTENTACLEA_VICTIM",BS_UNCONSCIOUS);
			};
			if(randy == 1)
			{
				AI_PlayAniBS(self,"T_STAND_2_GREENTENTACLEB_VICTIM",BS_UNCONSCIOUS);
			};
			if(randy == 2)
			{
				AI_PlayAniBS(self,"T_STAND_2_GREENTENTACLEC_VICTIM",BS_UNCONSCIOUS);
			};
		}
		else
		{
			AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_UNCONSCIOUS);
		};
	};
};

func int zs_greententacle_loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_GREENTENTACLE)
	{
		b_stopgreententacle();
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_greententacle_end()
{
};

