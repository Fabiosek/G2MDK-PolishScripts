
var int b_ravensescapeintotempelavi_onetime;

func void b_ravensescapeintotempelavi()
{
	if(b_ravensescapeintotempelavi_onetime == FALSE)
	{
		PlayVideoEx("PORTAL_RAVEN.BIK",TRUE,FALSE);
		RAVENISINTEMPEL = TRUE;
		Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_RAVENKDW,"Dosta�em si� do kwatery Kruka i zd��y�em zauwa�y�, jak przeszed� przez du�� bram�. Nie mog�em uda� si� za nim. S�dz�, �e brama prowadzi do �wi�tyni Adanosa, wi�c musz� o tym powiedzie� Saturasowi.");
		b_ravensescapeintotempelavi_onetime = TRUE;
	};
};

