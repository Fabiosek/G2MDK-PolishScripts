
func void zs_circle()
{
	perception_set_normal();
	b_resetall(self);
	Npc_SetPercTime(self,0.3);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int zs_circle_loop()
{
	var int randy;
	var int randykdw;
	var int randykdw_lightstar;
	if(self.guild == GIL_DMT)
	{
		randy = Hlp_Random(3000);
		if(Npc_GetStateTime(self) > randy)
		{
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
		};
	}
	else if(self.guild == GIL_KDW)
	{
		randykdw = Hlp_Random(2500);
		randykdw_lightstar = Hlp_Random(2);
		if(Npc_GetStateTime(self) > randykdw)
		{
			AI_AlignToWP(self);
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			Wld_PlayEffect("spellFX_RingRitual2",itmi_ambosseffekt_addon,itmi_ambosseffekt_addon,0,0,0,FALSE);
			if(randykdw_lightstar == 0)
			{
				Wld_PlayEffect("spellFX_RingRitual1",itmi_ambosseffekt_addon,itmi_ambosseffekt_addon,0,0,0,FALSE);
			}
			else if(randykdw_lightstar == 1)
			{
				Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",itmi_ambosseffekt_addon,itmi_ambosseffekt_addon,0,0,0,FALSE);
			};
		};
	}
	else if(MIS_RITUALINNOSEYEREPAIR != LOG_SUCCESS)
	{
		randy = Hlp_Random(1000);
		if(Npc_GetStateTime(self) > randy)
		{
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(xardas))
			{
				Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pyrokar))
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			}
			else
			{
				Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
			};
		};
	};
	return LOOP_CONTINUE;
};

func void zs_circle_end()
{
};

