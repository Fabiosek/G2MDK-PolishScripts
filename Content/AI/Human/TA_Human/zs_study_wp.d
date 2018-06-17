
func void zs_study_wp()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_study_wp_loop()
{
	var int randy;
	var int eventrandy;
	var int randystatetime;
	var int wait;
	var float waittime;
	randystatetime = randy + 25;
	randy = Hlp_Random(10);
	eventrandy = Hlp_Random(100);
	wait = randy + 5;
	waittime = IntToFloat(wait);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_AlignToWP(self);
	if(Npc_GetStateTime(self) >= randystatetime)
	{
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			b_turntonpc(self,hero);
		};
		AI_RemoveWeapon(self);
		if(randy <= 3)
		{
			if(randy == 0)
			{
				AI_PlayAni(self,"T_LGUARD_SCRATCH");
			}
			else if(randy == 1)
			{
				AI_PlayAni(self,"T_LGUARD_STRETCH");
			}
			else if(randy == 2)
			{
				AI_PlayAni(self,"T_LGUARD_CHANGELEG");
			};
		}
		else
		{
			AI_PlayAni(self,"T_LGUARD_2_STAND");
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
			if(Npc_HasItems(self,fakescroll_addon) == FALSE)
			{
				CreateInvItem(self,fakescroll_addon);
			};
			b_stoplookat(self);
			AI_UseItemToState(self,fakescroll_addon,1);
			AI_Wait(self,waittime);
			AI_UseItemToState(self,fakescroll_addon,-1);
			Npc_SetStateTime(self,0);
			if((((eventrandy < 5) && (CURRENTLEVEL == NEWWORLD_ZEN)) || ((eventrandy == 1) && (CURRENTLEVEL == ADDONWORLD_ZEN))) && (self.guild == GIL_KDW) && (RAVENISDEAD == FALSE))
			{
				b_event_portal_earthquake();
			};
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void zs_study_wp_end()
{
	Npc_RemoveInvItems(self,fakescroll_addon,Npc_HasItems(other,fakescroll_addon));
};

