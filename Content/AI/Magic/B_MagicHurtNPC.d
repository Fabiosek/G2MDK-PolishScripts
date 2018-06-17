
func void b_magichurtnpc(var C_NPC slf,var C_NPC oth,var int damage)
{
	Npc_ChangeAttribute(oth,ATR_HITPOINTS,-damage);
	if(Npc_IsDead(oth))
	{
		if((Npc_IsPlayer(slf) || (slf.aivar[AIV_PARTYMEMBER] == TRUE)) && (oth.aivar[AIV_VICTORYXPGIVEN] == FALSE))
		{
			b_giveplayerxp(self.level * XP_PER_VICTORY);
			oth.aivar[AIV_VICTORYXPGIVEN] = TRUE;
		};
	};
};

