
func int b_teachmagiccircle(var C_NPC slf,var C_NPC oth,var int circle)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_MAGE,circle);
	if((circle < 1) || (circle > 6))
	{
		Print("*** B³¹d: Z³y parametr ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLP,-1,-1,FONT_SCREEN,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Npc_SetTalentSkill(oth,NPC_TALENT_MAGE,circle);
	Log_CreateTopic(TOPIC_TALENTMAGICCIRCLE,LOG_NOTE);
	b_logentry(TOPIC_TALENTMAGICCIRCLE,"Magiczne runy, do których mam dostêp, s¹ podzielone na krêgi. Nie mogê korzystaæ z zaklêæ wymagaj¹cych stopnia wtajemniczenia przekraczaj¹cego moj¹ aktualn¹ wiedzê.");
	if(circle == 1)
	{
		PrintScreen(PRINT_LEARNCIRCLE_1,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Zaklêcia z pierwszego krêgu to: œwiat³o, Ognista strza³a, Ma³a b³yskawica, Leczenie lekkich ran i Przyzwanie szkieletu-goblina.");
		return TRUE;
	};
	if(circle == 2)
	{
		PrintScreen(PRINT_LEARNCIRCLE_2,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Zaklêcia z drugiego krêgu to: Kula ognia, Lodowa strza³a, Przyzwanie wilka, Piêœæ wichru i Sen.");
		return TRUE;
	};
	if(circle == 3)
	{
		PrintScreen(PRINT_LEARNCIRCLE_3,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Zaklêcia z trzeciego krêgu to: Leczenie œrednich ran, Piorun kulisty, Ma³a burza ognista, Tworzenie szkieletu, Strach i Bry³a lodu.");
		return TRUE;
	};
	if(circle == 4)
	{
		PrintScreen(PRINT_LEARNCIRCLE_4,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Zaklêcia z czwartego krêgu to: B³yskawica, Tworzenie kamiennego golema, Zniszczenie o¿ywieñca i Du¿a kula ognia.");
		return TRUE;
	};
	if(circle == 5)
	{
		PrintScreen(PRINT_LEARNCIRCLE_5,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Zaklêcia z pi¹tego krêgu to: Du¿a burza ognista, Lodowa fala, Przyzwanie demona i Leczenie ciê¿kich ran.");
		return TRUE;
	};
	if(circle == 6)
	{
		PrintScreen(PRINT_LEARNCIRCLE_6,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Zaklêcia z szóstego krêgu to: Deszcz ognia, Tchnienie œmierci, Œmiertelna fala, Armia ciemnoœci i Zmniejszenie potwora.");
		return TRUE;
	};
};

