
func int b_assessenemy()
{
	var C_NPC pcl;
	var C_NPC mgo;
	var C_NPC lar;
	pcl = Hlp_GetNpc(pc_levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		return FALSE;
	};
	if(((Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)) && (other.guild < GIL_SEPERATOR_HUM) && ((self.aivar[AIV_NOFIGHTPARKER] == TRUE) || (other.aivar[AIV_NOFIGHTPARKER] == TRUE))) || ((other.guild > GIL_SEPERATOR_HUM) && (other.aivar[AIV_NOFIGHTPARKER] == TRUE)))
	{
		return FALSE;
	};
	if((c_bodystatecontains(other,BS_SWIM) || c_bodystatecontains(other,BS_DIVE)) && (self.aivar[AIV_MM_FOLLOWINWATER] == FALSE))
	{
		return FALSE;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return FALSE;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(Npc_GetDistToNpc(self,other) > 1500)
		{
			return FALSE;
		};
		if(!Npc_CanSeeNpc(self,other))
		{
			return FALSE;
		};
	};
	if(c_playerisfakebandit(self,other) && (self.guild == GIL_BDT))
	{
		return FALSE;
	};
	mgo = Hlp_GetNpc(magicgolem);
	lar = Hlp_GetNpc(vlk_449_lares);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(lar)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(mgo)))
	{
		return FALSE;
	};
	if(((self.aivar[AIV_ENEMYOVERRIDE] == TRUE) || (other.aivar[AIV_ENEMYOVERRIDE] == TRUE)) && (other.guild < GIL_SEPERATOR_HUM))
	{
		return FALSE;
	};
	if(Npc_GetAttitude(self,other) != ATT_HOSTILE)
	{
		return FALSE;
	};
	if(c_npcisgateguard(self))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (self.npctype == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
	{
		if((Npc_GetAttitude(self,other) == ATT_HOSTILE) && ((Npc_GetStateTime(self) > 2) || Npc_IsInState(self,zs_observeplayer)) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT))
		{
			b_attack(self,other,self.aivar[AIV_LASTPLAYERAR],0);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	b_attack(self,other,AR_GUILDENEMY,0);
	return TRUE;
};

