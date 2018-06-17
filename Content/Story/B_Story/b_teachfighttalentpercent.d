
func int b_teachfighttalentpercent(var C_NPC slf,var C_NPC oth,var int talent,var int percent,var int teachermax)
{
	var string concattext;
	var int kosten;
	var int realhitchance;
	kosten = b_getlearncosttalent(oth,talent,1) * percent;
	if((talent != NPC_TALENT_1H) && (talent != NPC_TALENT_2H) && (talent != NPC_TALENT_BOW) && (talent != NPC_TALENT_CROSSBOW))
	{
		Print("*** B³¹d: Z³y parametr ***");
		return FALSE;
	};
	if(talent == NPC_TALENT_1H)
	{
		realhitchance = oth.hitchance[NPC_TALENT_1H];
	}
	else if(talent == NPC_TALENT_2H)
	{
		realhitchance = oth.hitchance[NPC_TALENT_2H];
	}
	else if(talent == NPC_TALENT_BOW)
	{
		realhitchance = oth.hitchance[NPC_TALENT_BOW];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		realhitchance = oth.hitchance[NPC_TALENT_CROSSBOW];
	};
	if(realhitchance >= teachermax)
	{
		concattext = ConcatStrings(PRINT_NOLEARNOVERPERSONALMAX,IntToString(teachermax));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
		b_say(slf,oth,"$NOLEARNYOUREBETTER");
		return FALSE;
	};
	if((realhitchance + percent) > teachermax)
	{
		concattext = ConcatStrings(PRINT_NOLEARNOVERPERSONALMAX,IntToString(teachermax));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
		b_say(slf,oth,"$NOLEARNOVERPERSONALMAX");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLP,-1,-1,FONT_SCREEN,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	if(talent == NPC_TALENT_1H)
	{
		b_raisefighttalent(oth,NPC_TALENT_1H,percent);
		if(oth.aivar[REAL_TALENT_1H] >= (oth.aivar[REAL_TALENT_2H] + 30))
		{
			b_raisefighttalent(oth,NPC_TALENT_2H,percent);
			PrintScreen(PRINT_LEARN1H_AND_2H,-1,-1,FONT_SCREEN,2);
		}
		else
		{
			PrintScreen(PRINT_LEARN1H,-1,-1,FONT_SCREEN,2);
		};
		return TRUE;
	};
	if(talent == NPC_TALENT_2H)
	{
		b_raisefighttalent(oth,NPC_TALENT_2H,percent);
		if(oth.aivar[REAL_TALENT_2H] >= (oth.aivar[REAL_TALENT_1H] + 30))
		{
			b_raisefighttalent(oth,NPC_TALENT_1H,percent);
			PrintScreen(PRINT_LEARN2H_AND_1H,-1,-1,FONT_SCREEN,2);
		}
		else
		{
			PrintScreen(PRINT_LEARN2H,-1,-1,FONT_SCREEN,2);
		};
		return TRUE;
	};
	if(talent == NPC_TALENT_BOW)
	{
		b_raisefighttalent(oth,NPC_TALENT_BOW,percent);
		if(oth.aivar[REAL_TALENT_BOW] >= (oth.aivar[REAL_TALENT_CROSSBOW] + 30))
		{
			b_raisefighttalent(oth,NPC_TALENT_CROSSBOW,percent);
			PrintScreen(PRINT_LEARNBOW_AND_CROSSBOW,-1,-1,FONT_SCREEN,2);
		}
		else
		{
			PrintScreen(PRINT_LEARNBOW,-1,-1,FONT_SCREEN,2);
		};
		return TRUE;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		b_raisefighttalent(oth,NPC_TALENT_CROSSBOW,percent);
		if(oth.aivar[REAL_TALENT_CROSSBOW] >= (oth.aivar[REAL_TALENT_BOW] + 30))
		{
			b_raisefighttalent(oth,NPC_TALENT_BOW,percent);
			PrintScreen(PRINT_LEARNCROSSBOW_AND_BOW,-1,-1,FONT_SCREEN,2);
		}
		else
		{
			PrintScreen(PRINT_LEARNCROSSBOW,-1,-1,FONT_SCREEN,2);
		};
		return TRUE;
	};
};

