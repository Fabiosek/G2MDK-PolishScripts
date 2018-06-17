
func void b_restartinflate()
{
	if(Npc_GetLastHitSpellID(self) == SPL_INFLATE)
	{
		Npc_SetStateTime(self,0);
	};
};

func void b_stopinflate()
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

func int zs_inflate()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_restartinflate);
	Npc_StopAni(self,"S_INFLATE_VICTIM");
	if(!c_bodystatecontains(self,BS_UNCONSCIOUS))
	{
		AI_PlayAniBS(self,"T_STAND_2_INFLATE_VICTIM",BS_UNCONSCIOUS);
	};
	self.aivar[AIV_INFLATESTATETIME] = 0;
};

func int zs_inflate_loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_INFLATE)
	{
		b_stopinflate();
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) != self.aivar[AIV_INFLATESTATETIME])
	{
		if(Npc_GetStateTime(self) == 1)
		{
			Mdl_SetModelFatness(self,1);
		}
		else if(Npc_GetStateTime(self) == 2)
		{
			Mdl_SetModelFatness(self,3);
		}
		else if(Npc_GetStateTime(self) == 3)
		{
			Mdl_SetModelFatness(self,8);
		}
		else if(Npc_GetStateTime(self) == 4)
		{
			Mdl_SetModelFatness(self,12);
		}
		else if(Npc_GetStateTime(self) == 5)
		{
			Mdl_SetModelFatness(self,9);
			b_say(self,other,"$Aargh_1");
		}
		else if(Npc_GetStateTime(self) == 6)
		{
			Mdl_SetModelFatness(self,15);
		}
		else if(Npc_GetStateTime(self) == 7)
		{
			Mdl_SetModelFatness(self,18);
		}
		else if(Npc_GetStateTime(self) == 8)
		{
			Mdl_SetModelFatness(self,11);
			b_say(self,other,"$Aargh_2");
		}
		else if(Npc_GetStateTime(self) == 9)
		{
			Mdl_SetModelFatness(self,15);
		}
		else if(Npc_GetStateTime(self) == 10)
		{
			Mdl_SetModelFatness(self,13);
		}
		else if(Npc_GetStateTime(self) == 11)
		{
			Mdl_SetModelFatness(self,12);
		}
		else if(Npc_GetStateTime(self) == 12)
		{
			Mdl_SetModelFatness(self,10);
		}
		else if(Npc_GetStateTime(self) == 13)
		{
			Mdl_SetModelFatness(self,8);
		}
		else if(Npc_GetStateTime(self) == 14)
		{
			Mdl_SetModelFatness(self,5);
			b_say(self,other,"$Aargh_3");
		}
		else if(Npc_GetStateTime(self) == 15)
		{
			Mdl_SetModelFatness(self,6);
		}
		else if(Npc_GetStateTime(self) == 16)
		{
			Mdl_SetModelFatness(self,4);
		}
		else if(Npc_GetStateTime(self) == 17)
		{
			Mdl_SetModelFatness(self,2);
		}
		else if(Npc_GetStateTime(self) == 18)
		{
			Mdl_SetModelFatness(self,1);
		}
		else if(Npc_GetStateTime(self) == 19)
		{
			Mdl_SetModelFatness(self,1);
		};
		self.aivar[AIV_INFLATESTATETIME] = Npc_GetStateTime(self);
		if(self.attribute[ATR_HITPOINTS] > SPL_INFLATE_DAMAGE)
		{
			b_magichurtnpc(other,self,SPL_INFLATE_DAMAGE);
		}
		else
		{
			b_magichurtnpc(other,self,self.attribute - 1);
		};
	};
	return LOOP_CONTINUE;
};

func void zs_inflate_end()
{
};

