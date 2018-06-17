
func void b_restartwhirlwind()
{
	if(Npc_GetLastHitSpellID(self) == SPL_WHIRLWIND)
	{
		Npc_SetStateTime(self,0);
	};
};

func void b_stopwhirlwind()
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

func int zs_whirlwind()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_restartwhirlwind);
	Npc_StopAni(self,"S_WHIRLWIND_VICTIM");
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(!c_bodystatecontains(self,BS_UNCONSCIOUS))
	{
		AI_PlayAniBS(self,"T_STAND_2_WHIRLWIND_VICTIM",BS_UNCONSCIOUS);
	};
	self.aivar[AIV_WHIRLWINDSTATETIME] = 0;
};

func int zs_whirlwind_loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_WHIRLWIND)
	{
		b_stopwhirlwind();
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) != self.aivar[AIV_WHIRLWINDSTATETIME])
	{
		self.aivar[AIV_WHIRLWINDSTATETIME] = Npc_GetStateTime(self);
		if(self.attribute[ATR_HITPOINTS] > SPL_WHIRLWIND_DAMAGE)
		{
			b_magichurtnpc(other,self,SPL_WHIRLWIND_DAMAGE);
		}
		else
		{
			b_magichurtnpc(other,self,self.attribute - 1);
		};
	};
	return LOOP_CONTINUE;
};

func void zs_whirlwind_end()
{
};

