
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
	b_logentry(TOPIC_TALENTSMITH,"Je�li zechc� wyku� jak�� bro�, to po pierwsze b�dzie mi potrzebny kawa� surowej stali, kt�ry musz� rozgrza� do czerwono�ci w ku�ni, a nast�pnie nada� mu odpowiedni kszta�t na kowadle. Je�li zechc� nada� broni jakie� specjalne charakterystyki, to b�d� musia� u�y� dodatkowych sk�adnik�w.");
	if(waffe == WEAPON_COMMON)
	{
		PLAYER_TALENT_SMITH[WEAPON_COMMON] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Najprostszy miecz nie potrzebuje �adnych dodatk�w.");
	};
	if(waffe == WEAPON_1H_SPECIAL_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdob�d� 1 bry�k� rudy, zrobi� �D�UGI MIECZ Z RUDY�.");
	};
	if(waffe == WEAPON_2H_SPECIAL_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdob�d� 2 bry�ki rudy, zrobi� �MIECZ DWUR�CZNY Z RUDY�.");
	};
	if(waffe == WEAPON_1H_SPECIAL_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdob�d� 2 bry�ki rudy, zrobi� �MIECZ PӣTORAR�CZNY Z RUDY�.");
	};
	if(waffe == WEAPON_2H_SPECIAL_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdob�d� 3 bry�ki rudy, zrobi� �CIʯKI MIECZ DWUR�CZNY Z RUDY�.");
	};
	if(waffe == WEAPON_1H_SPECIAL_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdob�d� 3 bry�ki rudy, zrobi� �OSTRZE BOJOWE Z RUDY�.");
	};
	if(waffe == WEAPON_2H_SPECIAL_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdob�d� 4 bry�ki rudy, zrobi� �CIʯKIE OSTRZE BOJOWE Z RUDY�.");
	};
	if(waffe == WEAPON_1H_SPECIAL_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdob�d� 4 bry�ki rudy i 5 porcji smoczej krwi, zrobi� �OSTRZE Z RUDY NA SMOKI�.");
	};
	if(waffe == WEAPON_2H_SPECIAL_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Gdy zdob�d� 5 bry�ek rudy i 5 porcji smoczej krwi, zrobi� �DU�E OSTRZE Z RUDY NA SMOKI�.");
	};
	if(waffe == WEAPON_1H_HARAD_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Teraz mog� wyku� dobry miecz.");
	};
	if(waffe == WEAPON_1H_HARAD_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Teraz mog� wyku� tak�e d�ugi miecz.");
	};
	if(waffe == WEAPON_1H_HARAD_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Teraz mog� wyku� nawet Rubinowe Ostrze.");
	};
	if(waffe == WEAPON_1H_HARAD_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"Harad nauczy� mnie, jak wyku� 'El Bastardo' � jedn� z najlepszych znanych broni jednor�cznych.");
	};
	PrintScreen(PRINT_LEARNSMITH,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	return TRUE;
};

