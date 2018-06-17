
func int c_refusetalk(var C_NPC slf,var C_NPC oth)
{
	if((Npc_RefuseTalk(slf) == TRUE) && c_npcisgateguard(slf) && (slf.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE))
	{
		return TRUE;
	};
	if((slf.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (Npc_GetDistToWP(slf,slf.wp) > 500))
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(lothar))
		{
			return TRUE;
		};
	};
	if(c_playerhasfakeguild(slf,oth) && (self.flags != NPC_FLAG_IMMORTAL))
	{
		return TRUE;
	};
	return FALSE;
};

