
func void evt_ornament_switch_bigfarm_01_func()
{
	if(ORNAMENT_SWITCHED_BIGFARM == FALSE)
	{
		Wld_InsertNpc(stoneguardian_ornament,"FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_BIGFARM_01");
		Wld_InsertItem(itmi_ornamenteffekt_bigfarm_addon,"FP_EVENT_STONEGUARDIAN_ORNAMENT_EFFECT_BIGFARM_01");
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",itmi_ornamenteffekt_bigfarm_addon,itmi_ornamenteffekt_bigfarm_addon,0,0,0,FALSE);
		Snd_Play("Ravens_Earthquake4");
		Snd_Play("Ravens_Earthquake2");
		Snd_Play("THRILLJINGLE_02");
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",itmi_ornamenteffekt_bigfarm_addon,itmi_ornamenteffekt_bigfarm_addon,0,0,0,FALSE);
		Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_ORNAMENT,"Uaktywni³em mechanizm kamiennego krêgu w pobli¿u farmy Sekoba. Us³ysza³em g³oœny huk i pojawi³ siê kamienny stra¿nik.");
		ORNAMENT_SWITCHED_BIGFARM = TRUE;
	};
};

func void evt_ornament_switch_farm_01_func()
{
	if(ORNAMENT_SWITCHED_FARM == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_ORNAMENT,"Uaktywni³em mechanizm kamiennego krêgu przy farmie Lobarta. Jedynym efektem by³o lekkie trzêsienie ziemi.");
		ORNAMENT_SWITCHED_FARM = TRUE;
	};
};

func void evt_ornament_switch_forest_01_func()
{
	if(ORNAMENT_SWITCHED_FOREST == FALSE)
	{
		Wld_InsertNpc(stoneguardian_ornament,"FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
		Wld_InsertItem(itmi_ornamenteffekt_forest_addon,"FP_EVENT_STONEGUARDIAN_ORNAMENT_EFFECT_FOREST_01");
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",itmi_ornamenteffekt_forest_addon,itmi_ornamenteffekt_forest_addon,0,0,0,FALSE);
		Snd_Play("Ravens_Earthquake4");
		Snd_Play("Ravens_Earthquake2");
		Snd_Play("THRILLJINGLE_02");
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",itmi_ornamenteffekt_forest_addon,itmi_ornamenteffekt_forest_addon,0,0,0,FALSE);
		Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_ORNAMENT,"Uaktywni³em mechanizm kamiennego krêgu w pó³nocnym lesie. Pojawi³ siê wielki, kamienny stra¿nik. Wygl¹da³ na nieŸle wkurzonego.");
		ORNAMENT_SWITCHED_FOREST = TRUE;
	};
};

