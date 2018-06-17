
func int b_stopmagicflee()
{
	Npc_PercDisable(self,PERC_ASSESSDAMAGE);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_flee,0,"");
};

func void zs_magicflee()
{
	var int randy;
	if(self.guild == GIL_DRAGON)
	{
		AI_ContinueRoutine(self);
	};
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_stopmagicflee);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	b_stoplookat(self);
	AI_StopPointAt(self);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM1",BS_STAND);
		};
		if(randy == 1)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM2",BS_STAND);
		};
		if(randy == 2)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM3",BS_STAND);
		};
	};
};

func int zs_magicflee_loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_FEAR)
	{
		Npc_ClearAIQueue(self);
		b_stopmagicflee();
	};
};

func void zs_magicflee_end()
{
};

