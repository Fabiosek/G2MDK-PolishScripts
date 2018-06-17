
func void b_wispdetector_learneffect(var C_NPC teacher)
{
	AI_PlayAni(teacher,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_HealShrine",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
	Snd_Play("WSP_Dead_A1");
};

func int b_teachplayertalentwispdetector(var C_NPC slf,var C_NPC oth,var int wispskill)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_WISPDETECTOR,wispskill);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_WISPDETECTOR,LOG_NOTE);
	b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED);
	if(wispskill == WISPSKILL_FF)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] = TRUE;
		b_wispdetector_learneffect(slf);
		b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED_FF);
	};
	if(wispskill == WISPSKILL_NONE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] = TRUE;
		b_wispdetector_learneffect(slf);
		b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED_NONE);
	};
	if(wispskill == WISPSKILL_RUNE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] = TRUE;
		b_wispdetector_learneffect(slf);
		b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED_RUNE);
	};
	if(wispskill == WISPSKILL_MAGIC)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] = TRUE;
		b_wispdetector_learneffect(slf);
		b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED_MAGIC);
	};
	if(wispskill == WISPSKILL_FOOD)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] = TRUE;
		b_wispdetector_learneffect(slf);
		b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED_FOOD);
	};
	if(wispskill == WISPSKILL_POTIONS)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] = TRUE;
		b_wispdetector_learneffect(slf);
		b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED_POTIONS);
	};
	PrintScreen(PRINT_LEARNWISPDETECTOR,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_WISPDETECTOR,1);
	return TRUE;
};

