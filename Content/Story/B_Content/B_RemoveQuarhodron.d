
var int b_removequarhodron_onetime;
var int b_removerhademes_onetime;

func int b_removeghost()
{
	if(GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == TRUE)
	{
		if((SC_SUMMONEDANCIENTGHOST == TRUE) && (B_REMOVEQUARHODRON_ONETIME == FALSE))
		{
			AI_Teleport(none_addon_111_quarhodron,"TOT");
			b_removenpc(none_addon_111_quarhodron);
			Snd_Play("MFX_GhostVoice");
			Snd_Play("MFX_Firestorm_Cast");
			B_REMOVEQUARHODRON_ONETIME = TRUE;
			GHOSTATTACKWARN = 0;
		};
	};
	if(ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_ONETIME == TRUE)
	{
		if((SC_TOOKRHADEMESTRAP == TRUE) && (B_REMOVERHADEMES_ONETIME == FALSE))
		{
			AI_Teleport(none_addon_112_rhademes,"TOT");
			b_removenpc(none_addon_112_rhademes);
			if(SC_TALKEDTORHADEMAFTER == TRUE)
			{
				Snd_Play("MFX_GhostVoice");
				Snd_Play("MFX_Firestorm_Cast");
			};
			B_REMOVERHADEMES_ONETIME = TRUE;
			GHOSTATTACKWARN = 0;
		};
	};
};

