
func int c_wanttoattackthief(var C_NPC slf,var C_NPC oth)
{
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_STRF) || (slf.guild == GIL_DJG))
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IGNORE_THEFT] == TRUE)
	{
		return FALSE;
	};
	if(slf.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		return FALSE;
	};
	if(Npc_IsPlayer(oth) && (slf.npctype == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	if(c_npcisgateguard(slf))
	{
		return FALSE;
	};
	return TRUE;
};

