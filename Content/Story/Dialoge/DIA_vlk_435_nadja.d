
instance DIA_NADJA_EXIT(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 999;
	condition = dia_nadja_exit_condition;
	information = dia_nadja_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nadja_exit_condition()
{
	return TRUE;
};

func void dia_nadja_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_PICKPOCKET(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 900;
	condition = dia_nadja_pickpocket_condition;
	information = dia_nadja_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_nadja_pickpocket_condition()
{
	return c_beklauen(40,40);
};

func void dia_nadja_pickpocket_info()
{
	Info_ClearChoices(dia_nadja_pickpocket);
	Info_AddChoice(dia_nadja_pickpocket,DIALOG_BACK,dia_nadja_pickpocket_back);
	Info_AddChoice(dia_nadja_pickpocket,DIALOG_PICKPOCKET,dia_nadja_pickpocket_doit);
};

func void dia_nadja_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_nadja_pickpocket);
};

func void dia_nadja_pickpocket_back()
{
	Info_ClearChoices(dia_nadja_pickpocket);
};


instance DIA_NADJA_STANDARD(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_standard_condition;
	information = dia_nadja_standard_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_nadja_standard_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BROMOR_PAY == FALSE))
	{
		return TRUE;
	};
};


var int nadja_luciainfo;

func void dia_nadja_standard_info()
{
	if(NADJA_LUCIAINFO == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_00");	//Najpierw musisz pom�wi� z Bromorem.
	}
	else
	{
		AI_Output(self,other,"DIA_Nadja_STANDARD_16_00");	//Skarbie, nie mog� si� teraz tob� zaj��. Je�li chcesz si� zabawi�, porozmawiaj z Bromorem.
	};
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE) && (NADJA_LUCIAINFO == FALSE))
	{
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_01");	//Mam kilka pyta� w sprawie zaginionych.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_02");	//Mog�abym ci co nieco powiedzie�, ale nie tutaj, kotku.
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_03");	//Chod�my wi�c na g�r�.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_04");	//Dobra, ale musisz to najpierw za�atwi� z Bromorem - nie chc� �adnych k�opot�w.
		NADJA_LUCIAINFO = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_DANACH(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_danach_condition;
	information = dia_nadja_danach_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_nadja_danach_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BROMOR_PAY == FALSE) && (NADJA_NACHT == TRUE))
	{
		return TRUE;
	};
};

func void dia_nadja_danach_info()
{
	AI_Output(self,other,"DIA_Nadja_Danach_16_00");	//Zapraszam ponownie.
	NADJA_NACHT = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_HOCHGEHEN(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_hochgehen_condition;
	information = dia_nadja_hochgehen_info;
	important = FALSE;
	permanent = TRUE;
	description = "Chod�my na g�r�.";
};


func int dia_nadja_hochgehen_condition()
{
	if(BROMOR_PAY == 1)
	{
		return TRUE;
	};
};

func void dia_nadja_hochgehen_info()
{
	AI_Output(other,self,"DIA_Nadja_hochgehen_15_00");	//Chod�my na g�r�.
	AI_Output(self,other,"DIA_Nadja_hochgehen_16_01");	//To tw�j szcz�liwy dzie� skarbie, chod�my.
	BROMOR_PAY = 2;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DANCE");
};


instance DIA_ADDON_NADJA_LUCIAINFO(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 5;
	condition = dia_addon_nadja_luciainfo_condition;
	information = dia_addon_nadja_luciainfo_info;
	description = "Mo�emy ju� porozmawia�?";
};


func int dia_addon_nadja_luciainfo_condition()
{
	if((BROMOR_PAY == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 200) && (NADJA_LUCIAINFO == TRUE))
	{
		return TRUE;
	};
};


var int nadja_gaveluciainfo;

func void dia_addon_nadja_luciainfo_info()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_15_00");	//Mo�emy ju� porozmawia�?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_01");	//Tutaj nikt nam nie b�dzie przeszkadza�.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_02");	//Bromor nie lubi, gdy gadamy z klientami w godzinach pracy, a on nic z tego nie ma.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_03");	//Chcesz wiedzie� wi�cej o zaginionych mieszka�cach portu, co?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_04");	//Nie wiem, czy b�d� w stanie ci pom�c... Ale wiem, gdzie znikn�a Lucia.
	NADJA_GAVELUCIAINFO = TRUE;
	Info_ClearChoices(dia_addon_nadja_luciainfo);
	Info_AddChoice(dia_addon_nadja_luciainfo,"To gdzie si� zmy�a?",dia_addon_nadja_luciainfo_wo);
	Info_AddChoice(dia_addon_nadja_luciainfo,"Co z t� Luci�?",dia_addon_nadja_luciainfo_lucia);
};

func void dia_addon_nadja_luciainfo_lucia()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_00");	//Co z t� Luci�?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_01");	//Nikogo nie smuci, �e jej ju� tu nie ma.
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_02");	//Czemu?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_03");	//Wykorzystywa�a wszystko i wszystkich.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_04");	//By�a dziwk� nie tylko z zawodu...
};

func void dia_addon_nadja_luciainfo_wo()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_wo_15_00");	//To gdzie si� zmy�a?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_01");	//Cz�sto zadawa�a si� z Elvrichem, czeladnikiem Thorbena - stolarza z dolnego miasta.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_02");	//Za�o�� si�, �e to w�a�nie z nim uciek�a.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Panienka lekkich obyczaj�w, Lucia, znikn�a w nocy z burdelu Bromora. Podobno uciek�a z czeladnikiem stolarza, Elvrichem.");
	Info_AddChoice(dia_addon_nadja_luciainfo,"Gdzie mogli si� zaszy�?",dia_addon_nadja_luciainfo_elvrich);
};

func void dia_addon_nadja_luciainfo_elvrich()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00");	//Gdzie mogli si� zaszy�?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01");	//Pewnie na jednej z okolicznych farm - o ile nie ze�ar�y ich wilki.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02");	//Gdzie jeszcze mogli uciec?
	Info_AddChoice(dia_addon_nadja_luciainfo,"Mo�esz mi powiedzie� co� jeszcze?",dia_addon_nadja_luciainfo_sonst);
};

func void dia_addon_nadja_luciainfo_sonst()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_sonst_15_00");	//Mo�esz mi powiedzie� co� jeszcze?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_01");	//S�ysza�am wiele o ludziach gin�cych w porcie.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_02");	//Problem polega na tym, �e nie wiem, na ile wiarygodne s� te historie.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_03");	//Lepiej pom�w z tamtejszymi kupcami.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_04");	//Przykro mi, nic wi�cej nie wiem.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_05");	//Co z nami, kotku? Zap�aci�e� w ko�cu nie tylko za gadanie...
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_06");	//Na pewno nie chcesz si� troszeczk� zabawi�?
	Info_ClearChoices(dia_addon_nadja_luciainfo);
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KNOWS_BORKA_DEALER == FALSE))
	{
		Info_AddChoice(dia_addon_nadja_luciainfo,PRINT_ADDON_NADJAWAIT,dia_addon_nadja_wait);
	};
	Info_AddChoice(dia_addon_nadja_luciainfo,"Przykro mi - musz� ju� i��.",dia_addon_nadja_luciainfo_weiter);
	Info_AddChoice(dia_addon_nadja_luciainfo,"Czemu nie?...",dia_nadja_poppen_start);
};

func void dia_addon_nadja_luciainfo_weiter()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_weiter_15_00");	//Przykro mi - musz� ju� i��.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_weiter_16_01");	//Szkoda. Mo�e p�niej...
	BROMOR_PAY = FALSE;
	NADJA_NACHT = NADJA_NACHT + 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void dia_addon_nadja_wait()
{
	Info_ClearChoices(dia_addon_nadja_luciainfo);
};


instance DIA_NADJA_POPPEN(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_poppen_condition;
	information = dia_nadja_poppen_info;
	permanent = TRUE;
	description = "(Zabaw si�)";
};


func int dia_nadja_poppen_condition()
{
	if((BROMOR_PAY == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 300))
	{
		return TRUE;
	};
};

func void dia_nadja_poppen_info()
{
	AI_Output(self,other,"DIA_Nadja_Poppen_16_00");	//Nast�pne kilka godzin nale�y do nas.
	AI_Output(self,other,"DIA_Nadja_Poppen_16_01");	//Czas si� troch� odpr�y� i zrelaksowa�.
	Info_ClearChoices(dia_nadja_poppen);
	Info_AddChoice(dia_nadja_poppen,"Dobra...",dia_nadja_poppen_start);
};

func void dia_nadja_poppen_start()
{
	BROMOR_PAY = FALSE;
	NADJA_NACHT = NADJA_NACHT + 1;
	PlayVideo("LOVESCENE.BIK");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void dia_addon_nadja_luciainfo_pop()
{
	dia_nadja_poppen_start();
};


instance DIA_NADJA_BUYHERB(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_buyherb_condition;
	information = dia_nadja_buyherb_info;
	permanent = TRUE;
	description = "Nie wiesz, gdzie m�g�bym kupi� troch� ziela?";
};


func int dia_nadja_buyherb_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (Npc_KnowsInfo(other,dia_nadja_want_herb) == FALSE) && (NADJA_MONEY == FALSE) && (UNDERCOVER_FAILED == FALSE))
	{
		return TRUE;
	};
};

func void dia_nadja_buyherb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_BUYHERB_15_00");	//Czy mog� tu gdzie� kupi� ziele?
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 500)
	{
		if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_01");	//A sk�d ja mam to wiedzie�? Zreszt�, nawet gdybym wiedzia�a, to i tak nie powiedzia�abym stra�nikowi miejskiemu.
			UNDERCOVER_FAILED = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_02");	//Je�li mam ci co� powiedzie�, to lepiej wytrz��nij kilka sztuk z�ota z sakiewki.
			AI_Output(other,self,"DIA_Nadja_BUYHERB_15_03");	//Ile chcesz?
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_04");	//50 sztuk z�ota powinno wystarczy�.
			NADJA_MONEY = TRUE;
		};
	}
	else
	{
		b_say(self,other,"$NOTNOW");
	};
};


instance DIA_NADJA_WANT_HERB(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_want_herb_condition;
	information = dia_nadja_want_herb_info;
	permanent = FALSE;
	description = "Powiedz mi, gdzie tu kupi� ziele (zap�a� 50 sztuk z�ota).";
};


func int dia_nadja_want_herb_condition()
{
	if((Npc_HasItems(other,itmi_gold) >= 50) && (NADJA_MONEY == TRUE) && (MIS_ANDRE_REDLIGHT == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_nadja_want_herb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_WANT_HERB_15_00");	//Teraz m�w, gdzie mog� zdoby� ziele.
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_01");	//Wybacz, jako� nie mog� sobie przypomnie�.
	}
	else
	{
		b_giveinvitems(other,self,itmi_gold,50);
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_02");	//Porozmawiaj z Bork�, skarbie. Powinien mie� jakie� ziele.
		KNOWS_BORKA_DEALER = TRUE;
	};
};

