
func void b_awake_stoneguardian(var C_NPC slf)
{
	if(slf.aivar[AIV_ENEMYOVERRIDE] == TRUE)
	{
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",slf,slf,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",slf,slf,0,0,0,FALSE);
		slf.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};

