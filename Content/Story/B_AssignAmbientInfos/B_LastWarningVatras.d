
func void b_lastwarningvatras()
{
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_00");	//Co uczyni³eœ, nieszczêœniku?
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_01");	//W zakonie wody wiele razy ostrzegaliœmy ciê, byœ wyrzek³ siê z³a.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_02");	//Dosz³y mnie jednak s³uchy, ¿e opuœci³eœ œcie¿kê wszystkich, którzy podtrzymuj¹ równowagê.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_03");	//Wêdrowa³eœ, morduj¹c i ³upi¹c. Masz na sumieniu straszliwe zbrodnie.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_04");	//Z twojej rêki zginê³a niezliczona liczba niewinnych ludzi!
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_05");	//A teraz sprzymierzy³eœ siê z si³ami ciemnoœci.
};

func void b_vatraspissedoff()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_00");	//Odt¹d nie mo¿esz liczyæ na moje poparcie.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_01");	//OdejdŸ. Dla mnie jesteœ teraz wyrzutkiem.
	if(VATRAS_ISONBOARD == LOG_SUCCESS)
	{
		CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	};
	VATRAS_ISONBOARD = LOG_FAILED;
	self.flags = 0;
	VATRASPISSEDOFFFOREVER = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PRAY");
};

