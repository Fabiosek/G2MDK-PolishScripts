
func void zs_concert()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_concert_loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1394_addon_inextremo_yellowpfeiffer))
		{
			AI_UseItemToState(self,itmi_iedudelgelb,1);
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1390_addon_inextremo_drpymonte))
		{
			AI_UseItemToState(self,itmi_ieharfe,1);
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1391_addon_inextremo_theflail))
		{
			AI_UseItemToState(self,itmi_iedrum,1);
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1392_addon_inextremo_thomastheforger))
		{
			AI_UseItemToState(self,itmi_iecello,1);
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1393_addon_inextremo_unicorn))
		{
			AI_UseItemToState(self,itmi_ielaute,1);
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1395_addon_inextremo_lutter))
		{
			AI_UseItemToState(self,itmi_iedrumscheit,1);
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1396_addon_inextremo_flex))
		{
			AI_UseItemToState(self,itmi_iedudelblau,1);
		}
		else
		{
		};
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void zs_concert_end()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1394_addon_inextremo_yellowpfeiffer))
	{
		AI_UseItemToState(self,itmi_iedudelgelb,-1);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1390_addon_inextremo_drpymonte))
	{
		AI_UseItemToState(self,itmi_ieharfe,-1);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1391_addon_inextremo_theflail))
	{
		AI_UseItemToState(self,itmi_iedrum,-1);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1392_addon_inextremo_thomastheforger))
	{
		AI_UseItemToState(self,itmi_iecello,-1);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1393_addon_inextremo_unicorn))
	{
		AI_UseItemToState(self,itmi_ielaute,-1);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1395_addon_inextremo_lutter))
	{
		AI_UseItemToState(self,itmi_iedrumscheit,-1);
	}
	else
	{
	};
};

