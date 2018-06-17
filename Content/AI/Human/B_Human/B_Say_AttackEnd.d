
func void b_say_attackend()
{
	var int rnd;
	var int random;
	var int randy;
	if((self.aivar[AIV_ATTACKREASON] == AR_GUILDENEMY) || (self.aivar[AIV_ATTACKREASON] == AR_MONSTERMURDEREDHUMAN))
	{
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			if(!Npc_IsDead(other))
			{
				if(self.aivar[AIV_LASTTARGET] == Hlp_GetInstanceID(other))
				{
					b_say(self,other,"$KILLENEMY");
				}
				else
				{
					b_say(self,other,"$GOODKILL");
				};
			}
			else
			{
				b_say(self,other,"$ENEMYKILLED");
			};
		}
		else
		{
			if(self.aivar[AIV_PARTYMEMBER] == TRUE)
			{
				rnd = Hlp_Random(100);
				if((rnd > 15) && (other.guild != GIL_DRAGON))
				{
					return;
				};
			};
			if(other.aivar[AIV_KILLEDBYPLAYER] == FALSE)
			{
				if(self.voice == 9)
				{
					random = Hlp_Random(2);
					if(random == 0)
					{
						b_say(self,other,"$ADDON_MONSTERKILLED");
					}
					else
					{
						b_say(self,other,"$ADDON_MONSTERKILLED2");
					};
				}
				else if(self.voice == 12)
				{
					if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gornow)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gorndjg)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gornnw_vor_djg)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gornnw_nach_djg)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gorn_di)))
					{
						randy = Hlp_Random(2);
						if(randy == 0)
						{
							b_say(self,other,"$ADDON_MONSTERKILLED");
						}
						else
						{
							b_say(self,other,"$MONSTERKILLED");
						};
					}
					else
					{
						b_say(self,other,"$ADDON_MONSTERKILLED");
					};
				}
				else
				{
					b_say(self,other,"$MONSTERKILLED");
				};
			}
			else
			{
				b_say(self,other,"$GOODMONSTERKILL");
			};
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_THEFT)
	{
		b_say(self,other,"$THIEFDOWN");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_USEMOB)
	{
		b_say(self,other,"$RUMFUMMLERDOWN");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_SHEEPKILLER)
	{
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			b_say(self,other,"$SHEEPATTACKERDOWN");
		}
		else
		{
			b_say(self,other,"$MONSTERKILLED");
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_HUMANMURDEREDHUMAN)
	{
		if(!Npc_IsDead(other))
		{
			if(self.aivar[AIV_LASTTARGET] == Hlp_GetInstanceID(other))
			{
				b_say(self,other,"$KILLMURDERER");
			}
			else
			{
				b_say(self,other,"$GOODKILL");
			};
		}
		else
		{
			b_say(self,other,"$ENEMYKILLED");
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_MONSTERVSHUMAN)
	{
		if((self.voice == 9) || (self.voice == 12))
		{
			b_say(self,other,"$ADDON_MONSTERKILLED");
		}
		else
		{
			b_say(self,other,"$MONSTERKILLED");
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_MONSTERCLOSETOGATE)
	{
		b_say(self,other,"$STUPIDBEASTKILLED");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_REACTTODAMAGE)
	{
		b_say(self,other,"$NEVERHITMEAGAIN");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_REACTTOWEAPON)
	{
		b_say(self,other,"$YOUBETTERSHOULDHAVELISTENED");
		return;
	};
	if((self.aivar[AIV_ATTACKREASON] == AR_CLEARROOM) || (self.aivar[AIV_ATTACKREASON] == AR_GUARDCALLEDTOROOM))
	{
		if(c_npcisbotheredbyplayerroomguild(self))
		{
			b_say(self,other,"$GETUPANDBEGONE");
		}
		else
		{
			b_say(self,other,"$NEVERENTERROOMAGAIN");
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_LEFTPORTALROOM)
	{
		b_say(self,other,"$NEVERENTERROOMAGAIN");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GUARDSTOPSINTRUDER)
	{
		b_say(self,other,"$KILLENEMY");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GUARDSTOPSFIGHT)
	{
		if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
		}
		else
		{
			b_say(self,other,"$THEREISNOFIGHTINGHERE");
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GUARDCALLEDTOTHIEF)
	{
		b_say(self,other,"$RUMFUMMLERDOWN");
		return;
	};
};

