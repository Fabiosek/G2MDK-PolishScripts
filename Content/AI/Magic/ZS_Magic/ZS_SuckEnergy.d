
var int temp_suckenergy_disttoplayer;

func void b_restartsuckenergy()
{
	if(Npc_GetLastHitSpellID(self) == SPL_SUCKENERGY)
	{
		Npc_SetStateTime(self,0);
		AI_PlayAni(self,"T_STAND_2_SUCKENERGY_VICTIM");
	};
};

func void b_stopsuckenergy()
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

func int zs_suckenergy()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_restartsuckenergy);
	Npc_StopAni(self,"S_SUCKENERGY_VICTIM");
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	self.aivar[AIV_SUCKENERGYSTATETIME] = 1;
	TEMP_SUCKENERGY_DISTTOPLAYER = Npc_GetDistToPlayer(self);
};

func int zs_suckenergy_loop()
{
	if((Npc_GetStateTime(self) > SPL_TIME_SUCKENERGY) || (TEMP_SUCKENERGY_DISTTOPLAYER >= (Npc_GetDistToPlayer(self) + 100)))
	{
		b_stopsuckenergy();
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) != self.aivar[AIV_SUCKENERGYSTATETIME])
	{
		if(Npc_GetStateTime(self) == 0)
		{
			if(!c_bodystatecontains(self,BS_UNCONSCIOUS))
			{
				AI_PlayAniBS(self,"T_STAND_2_SUCKENERGY_VICTIM",BS_UNCONSCIOUS);
			};
			Wld_PlayEffect("spellFX_SuckEnergy_BloodFly",self,hero,0,0,0,FALSE);
		};
		self.aivar[AIV_SUCKENERGYSTATETIME] = Npc_GetStateTime(self);
		if(self.attribute[ATR_HITPOINTS] > SPL_SUCKENERGY_DAMAGE)
		{
			b_magichurtnpc(other,self,SPL_SUCKENERGY_DAMAGE);
			Npc_ChangeAttribute(other,ATR_HITPOINTS,SPL_SUCKENERGY_DAMAGE);
		}
		else
		{
			b_magichurtnpc(other,self,self.attribute - 1);
		};
	};
	return LOOP_CONTINUE;
};

func void zs_suckenergy_end()
{
};

