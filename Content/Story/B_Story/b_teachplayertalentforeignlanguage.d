
func int b_teachplayertalentforeignlanguage(var C_NPC slf,var C_NPC oth,var int language)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_FOREIGNLANGUAGE,language);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_LANGUAGE,LOG_NOTE);
	if(language == LANGUAGE_1)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;
		b_logentry(TOPIC_LANGUAGE,LOGTEXT_ADDON_LANGUAGE_1);
	};
	if(language == LANGUAGE_2)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = TRUE;
		b_logentry(TOPIC_LANGUAGE,LOGTEXT_ADDON_LANGUAGE_2);
	};
	if(language == LANGUAGE_3)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] = TRUE;
		b_logentry(TOPIC_LANGUAGE,LOGTEXT_ADDON_LANGUAGE_3);
	};
	PrintScreen(PRINT_LEARNFOREIGNLANGUAGE,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_FOREIGNLANGUAGE,1);
	return TRUE;
};

