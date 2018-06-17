
var int b_ravensescapeintotempelavi_onetime;

func void b_ravensescapeintotempelavi()
{
	if(b_ravensescapeintotempelavi_onetime == FALSE)
	{
		PlayVideoEx("PORTAL_RAVEN.BIK",TRUE,FALSE);
		RAVENISINTEMPEL = TRUE;
		Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_RAVENKDW,"Dosta³em siê do kwatery Kruka i zd¹¿y³em zauwa¿yæ, jak przeszed³ przez du¿¹ bramê. Nie mog³em udaæ siê za nim. S¹dzê, ¿e brama prowadzi do œwi¹tyni Adanosa, wiêc muszê o tym powiedzieæ Saturasowi.");
		b_ravensescapeintotempelavi_onetime = TRUE;
	};
};

