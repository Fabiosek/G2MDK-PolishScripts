
func void b_mm_assessothersdamage()
{
	if((Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT))
	{
		return;
	};
	if(!Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(Npc_IsPlayer(victim))
		{
			Npc_ClearAIQueue(self);
			b_clearperceptions(self);
			Npc_SetTarget(self,other);
			AI_StartState(self,zs_mm_attack,0,"");
			return;
		};
		if(Npc_IsPlayer(other) && !Npc_IsDead(victim))
		{
			Npc_ClearAIQueue(self);
			b_clearperceptions(self);
			Npc_SetTarget(self,victim);
			AI_StartState(self,zs_mm_attack,0,"");
			return;
		};
	};
	if(self.guild == GIL_WOLF)
	{
		if((victim.guild == GIL_WOLF) && (other.guild == GIL_WOLF) && Npc_IsPlayer(other) && Npc_IsDead(victim))
		{
			Npc_ClearAIQueue(self);
			b_clearperceptions(self);
			self.start_aistate = zs_mm_rtn_summoned;
			AI_StartState(self,zs_mm_rtn_summoned,0,"");
			return;
		};
	};
	if((self.guild == GIL_STONEGUARDIAN) && (victim.guild == GIL_STONEGUARDIAN) && (self.aivar[AIV_ENEMYOVERRIDE] == TRUE))
	{
		b_awake_stoneguardian(self);
	};
	if((Wld_GetGuildAttitude(self.guild,victim.guild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY))
	{
		Npc_ClearAIQueue(self);
		b_clearperceptions(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_mm_attack,0,"");
		return;
	};
	if((Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self.guild,victim.guild) != ATT_FRIENDLY) && !Npc_IsDead(victim))
	{
		Npc_ClearAIQueue(self);
		b_clearperceptions(self);
		Npc_SetTarget(self,victim);
		AI_StartState(self,zs_mm_attack,0,"");
		return;
	};
};

