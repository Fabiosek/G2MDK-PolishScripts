
func void b_assessdamage()
{
	var C_NPC quarho;
	var C_NPC rhadem;
	var C_NPC rav;
	quarho = Hlp_GetNpc(none_addon_111_quarhodron);
	rhadem = Hlp_GetNpc(none_addon_112_rhademes);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(quarho)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rhadem)))
	{
		b_ghostspecialdamage(other,self);
		return;
	};
	b_beliarsweaponspecialdamage(other,self);
	if(self.aivar[AIV_ARENAFIGHT] == AF_AFTER)
	{
		self.aivar[AIV_ARENAFIGHT] = AF_AFTER_PLUS_DAMAGE;
	};
	if(self.aivar[AIV_ENEMYOVERRIDE] == TRUE)
	{
		rav = Hlp_GetNpc(bdt_1090_addon_raven);
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rav))
		{
			self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		};
	};
	if(Npc_IsInState(self,zs_attack))
	{
		if(Npc_IsPlayer(other) && (self.npctype == NPCTYPE_FRIEND))
		{
			return;
		};
		if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
		{
			return;
		};
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET])
		{
			if((self.aivar[AIV_HITBYOTHERNPC] == Hlp_GetInstanceID(other)) || (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)))
			{
				Npc_SetTarget(self,other);
			}
			else
			{
				self.aivar[AIV_HITBYOTHERNPC] = Hlp_GetInstanceID(other);
			};
		};
		return;
	};
	if(b_assessenemy())
	{
		return;
	};
	if(!Npc_IsPlayer(other) && (other.aivar[AIV_ATTACKREASON] == AR_NONE))
	{
		b_attack(self,other,AR_NONE,0);
		return;
	};
	if(Npc_IsInFightMode(other,FMODE_MELEE) || Npc_IsInFightMode(other,FMODE_FIST) || Npc_IsInFightMode(other,FMODE_NONE))
	{
		if((Npc_GetAttitude(self,other) == ATT_FRIENDLY) || ((self.npctype == NPCTYPE_FRIEND) && Npc_IsPlayer(other)))
		{
			if(!Npc_IsInState(self,zs_reacttodamage))
			{
				Npc_ClearAIQueue(self);
				b_clearperceptions(self);
				AI_StartState(self,zs_reacttodamage,0,"");
				return;
			};
		};
	};
	b_attack(self,other,AR_REACTTODAMAGE,0);
};

