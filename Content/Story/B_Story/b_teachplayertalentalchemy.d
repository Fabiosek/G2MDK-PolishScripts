
func int b_teachplayertalentalchemy(var C_NPC slf,var C_NPC oth,var int potion)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_ALCHEMY,potion);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTALCHEMY,LOG_NOTE);
	b_logentry(TOPIC_TALENTALCHEMY,"Je�li zechc� uwarzy� mikstur�, to b�d� potrzebowa� pustej menzurki oraz w�a�ciwych sk�adnik�w. Dzi�ki nim mog� przygotowa� na stole alchemicznym w�a�ciw� mieszank�.");
	if(potion == POTION_HEALTH_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Sk�adniki �ESENCJI LECZNICZEJ�: 2 ro�liny lecznicze i 1 rdest polny.");
	};
	if(potion == POTION_HEALTH_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Sk�adniki �EKSTRAKTU LECZNICZEGO�: 2 zio�a lecznicze i 1 rdest polny.");
	};
	if(potion == POTION_HEALTH_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Sk�adniki �ELIKSIRU LECZNICZEGO�: 2 korzenie lecznicze i 1 rdest polny.");
	};
	if(potion == POTION_MANA_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_01] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Sk�adniki �ESENCJI MANY�: 2 ogniste pokrzywy i 1 rdest polny.");
	};
	if(potion == POTION_MANA_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_02] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Sk�adniki �EKSTRAKTU MANY�: 2 ogniste zio�a i 1 rdest polny.");
	};
	if(potion == POTION_MANA_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_03] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Sk�adniki �ELIKSIRU MANY�: 2 ogniste korzenie i 1 rdest polny");
	};
	if(potion == POTION_SPEED)
	{
		PLAYER_TALENT_ALCHEMY[POTION_SPEED] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Sk�adniki �MIKSTURY SZYBKO�CI�: 1 z�bate ziele i 1 rdest polny");
	};
	if(potion == POTION_PERM_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Sk�adniki �ELIKSIRU SI�Y�: 1 smoczy korze� i 1 szczaw kr�lewski.");
	};
	if(potion == POTION_PERM_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Sk�adniki �ELIKSIRU ZR�CZNO�CI�: 1 goblinia jagoda i 1 szczaw kr�lewski.");
	};
	if(potion == POTION_PERM_MANA)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Sk�adniki �ELIKSIRU MAGII�: 1 ognisty korze� i 1 szczaw kr�lewski.");
	};
	if(potion == POTION_PERM_HEALTH)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"Sk�adniki �ELIKSIRU �YCIA�: 1 korze� leczniczy i 1 szczaw kr�lewski.");
	};
	PrintScreen(PRINT_LEARNALCHEMY,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
	return TRUE;
};

