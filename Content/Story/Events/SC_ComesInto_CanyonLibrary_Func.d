
var int sc_comesinto_canyonlibrary_func_onetime;

func void sc_comesinto_canyonlibrary_func()
{
	if(sc_comesinto_canyonlibrary_func_onetime == FALSE)
	{
		if(Npc_IsDead(shadowbeast_addon_fire_canyonlib) == FALSE)
		{
			AI_Standup(shadowbeast_addon_fire_canyonlib);
			shadowbeast_addon_fire_canyonlib.aivar[AIV_ENEMYOVERRIDE] = FALSE;
			Snd_Play("THRILLJINGLE_03");
			Snd_Play("GOL_Ambient_A2");
		};
		sc_comesinto_canyonlibrary_func_onetime = TRUE;
	};
};

