
func int b_teachplayertalentsmith(var C_NPC slf,var C_NPC oth,var int waffe)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_SMITH,waffe);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTSMITH,LOG_NOTE);
	b_logentry(TOPIC_TALENTSMITH,"Jeœli zechcê wykuæ jak¹œ broñ, to po pierwsze bêdzie mi potrzebny kawa³ surowej stali, który muszê rozgrzaæ do czerwonoœci w kuŸni, a nastêpnie nadaæ mu odpowiedni kszta³t na kowadle. Jeœli zechcê nadaæ broni jakieœ specjalne charakterystyki, to bêdê musia³ u¿yæ dodatkowych sk³adników.");
	if(waffe == WEAPON_COMMON)
	{
		PLAYER_TALENT_SMITH[WEAPON_COMMON] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Najprostszy miecz nie potrzebuje ¿adnych dodatków.");
	};
	if(waffe == WEAPON_1H_SPECIAL_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdobêdê 1 bry³kê rudy, zrobiê ´D£UGI MIECZ Z RUDY´.");
	};
	if(waffe == WEAPON_2H_SPECIAL_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdobêdê 2 bry³ki rudy, zrobiê ´MIECZ DWURÊCZNY Z RUDY´.");
	};
	if(waffe == WEAPON_1H_SPECIAL_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdobêdê 2 bry³ki rudy, zrobiê ´MIECZ PÓ£TORARÊCZNY Z RUDY´.");
	};
	if(waffe == WEAPON_2H_SPECIAL_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdobêdê 3 bry³ki rudy, zrobiê ´CIÊ¯KI MIECZ DWURÊCZNY Z RUDY´.");
	};
	if(waffe == WEAPON_1H_SPECIAL_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdobêdê 3 bry³ki rudy, zrobiê ´OSTRZE BOJOWE Z RUDY´.");
	};
	if(waffe == WEAPON_2H_SPECIAL_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdobêdê 4 bry³ki rudy, zrobiê ´CIÊ¯KIE OSTRZE BOJOWE Z RUDY´.");
	};
	if(waffe == WEAPON_1H_SPECIAL_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdobêdê 4 bry³ki rudy i 5 porcji smoczej krwi, zrobiê ´OSTRZE Z RUDY NA SMOKI´.");
	};
	if(waffe == WEAPON_2H_SPECIAL_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdobêdê 5 bry³ek rudy i 5 porcji smoczej krwi, zrobiê ´DU¯E OSTRZE Z RUDY NA SMOKI´.");
	};
	if(waffe == WEAPON_1H_HARAD_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Teraz mogê wykuæ dobry miecz.");
	};
	if(waffe == WEAPON_1H_HARAD_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Teraz mogê wykuæ tak¿e d³ugi miecz.");
	};
	if(waffe == WEAPON_1H_HARAD_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Teraz mogê wykuæ nawet Rubinowe Ostrze.");
	};
	if(waffe == WEAPON_1H_HARAD_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Harad nauczy³ mnie, jak wykuæ 'El Bastardo' – jedn¹ z najlepszych znanych broni jednorêcznych.");
	};
	PrintScreen(PRINT_LEARNSMITH,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	return TRUE;
};

