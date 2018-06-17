
instance DIA_RUPERT_EXIT(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 999;
	condition = dia_rupert_exit_condition;
	information = dia_rupert_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rupert_exit_condition()
{
	return TRUE;
};

func void dia_rupert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUPERT_PICKPOCKET(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 900;
	condition = dia_rupert_pickpocket_condition;
	information = dia_rupert_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rupert_pickpocket_condition()
{
	return c_beklauen(18,10);
};

func void dia_rupert_pickpocket_info()
{
	Info_ClearChoices(dia_rupert_pickpocket);
	Info_AddChoice(dia_rupert_pickpocket,DIALOG_BACK,dia_rupert_pickpocket_back);
	Info_AddChoice(dia_rupert_pickpocket,DIALOG_PICKPOCKET,dia_rupert_pickpocket_doit);
};

func void dia_rupert_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rupert_pickpocket);
};

func void dia_rupert_pickpocket_back()
{
	Info_ClearChoices(dia_rupert_pickpocket);
};


instance DIA_RUPERT_HELLO(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_hello_condition;
	information = dia_rupert_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_rupert_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_rupert_hello_info()
{
	AI_Output(self,other,"DIA_Rupert_Hello_03_00");	//Witaj, nieznajomy!
	AI_Output(self,other,"DIA_Rupert_Hello_03_01");	//Pewnie jeste� g�odny i spragniony - a mo�e zerkniesz okiem na moje towary?
};


instance DIA_RUPERT_ZUPAL(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_zupal_condition;
	information = dia_rupert_zupal_info;
	permanent = FALSE;
	description = "W�a�ciwie, to chcia�em si� widzie� z paladynami...";
};


func int dia_rupert_zupal_condition()
{
	if(KAPITEL < 2)
	{
		return TRUE;
	};
};

func void dia_rupert_zupal_info()
{
	AI_Output(other,self,"DIA_Rupert_ZuPal_15_00");	//W�a�ciwie, to chcia�em si� widzie� z paladynami...
	AI_Output(self,other,"DIA_Rupert_ZuPal_03_01");	//Niewielka jest na to szansa. Od kiedy paladyni urz�dzili swoj� siedzib� w g�rnym mie�cie, ci�ko jest si� tam dosta�.
};


instance DIA_RUPERT_HELPMEINTOOV(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_helpmeintoov_condition;
	information = dia_rupert_helpmeintoov_info;
	permanent = FALSE;
	description = "Czy mo�esz mi pom�c dosta� si� do g�rnego miasta?";
};


func int dia_rupert_helpmeintoov_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_zupal) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_helpmeintoov_info()
{
	AI_Output(other,self,"DIA_Rupert_HelpMeIntoOV_15_00");	//Czy mo�esz mi pom�c dosta� si� do g�rnego miasta?
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_01");	//Ja? Niemo�liwe, nie mam tu w�a�ciwie nic do powiedzenia.
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_02");	//W dolnej cz�ci miasta jest tylko kilka os�b, kt�rych wp�ywy mog�yby ci zapewni� wst�p do g�rnego miasta.
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_03");	//Jedn� z nich jest m�j szef, Matteo. To z nim powiniene� porozmawia�.
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"Je�li chc� si� dosta� do g�rnego miasta, b�d� potrzebowa� pomocy jakiej� wp�ywowej osobisto�ci z dolnej cz�ci miasta.");
	b_logentry(TOPIC_OV,"Kupiec Matteo to jeden z bardziej wp�ywowych mieszka�c�w dolnej cz�ci miasta.");
};


instance DIA_RUPERT_WOMATTEO(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_womatteo_condition;
	information = dia_rupert_womatteo_info;
	permanent = FALSE;
	description = "Gdzie go znajd�?";
};


func int dia_rupert_womatteo_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_helpmeintoov) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_womatteo_info()
{
	AI_Output(other,self,"DIA_Rupert_WoMatteo_15_00");	//Gdzie go znajd�?
	AI_Output(self,other,"DIA_Rupert_WoMatteo_03_01");	//Stoisz w�a�nie przed jego sklepem. Prawie go nie opuszcza. Wejd� do �rodka.
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Sklep Mattea znajduje si� przy po�udniowej bramie miasta. Mo�na tam kupi� or�, �ywno�� oraz wyposa�enie.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_RUPERT_WEREINFLUSS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 2;
	condition = dia_rupert_wereinfluss_condition;
	information = dia_rupert_wereinfluss_info;
	permanent = FALSE;
	description = "Jakich innych wp�ywowych obywateli mia�e� na my�li?";
};


func int dia_rupert_wereinfluss_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_helpmeintoov) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_wereinfluss_info()
{
	AI_Output(other,self,"DIA_Rupert_WerEinfluss_15_00");	//Jakich innych wp�ywowych obywateli mia�e� na my�li?
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_01");	//Najwa�niejszymi osobami w tej cz�ci miasta s� dzia�aj�cy na tej ulicy kupcy i rzemie�lnicy.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_02");	//Powiniene� naj�� si� u kt�rego� jako czeladnik - tak jak ja.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_03");	//Od kiedy pracuj� dla Mattea, miastowi nabrali do mnie szacunku.
	b_logentry(TOPIC_OV,"Spr�buj� zatrudni� si� jako czeladnik u jednego z mistrz�w.");
};


instance DIA_RUPERT_WORK(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 3;
	condition = dia_rupert_work_condition;
	information = dia_rupert_work_info;
	permanent = FALSE;
	description = "Potrzebuj� pieni�dzy. Szukam pracy.";
};


func int dia_rupert_work_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_rupert_work_info()
{
	AI_Output(other,self,"DIA_Rupert_Work_15_00");	//Potrzebuj� pieni�dzy. Szukam pracy.
	AI_Output(self,other,"DIA_Rupert_Work_03_01");	//S�ysza�em, �e Bosper ma jakie� problemy z zaopatrzeniem. Jego sklep znajduje si� kilka krok�w st�d.
	AI_Output(self,other,"DIA_Rupert_Work_03_02");	//M�wi�, �e pono� dobrze p�aci.
};


instance DIA_RUPERT_YOUROFFER(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_youroffer_condition;
	information = dia_rupert_youroffer_info;
	permanent = FALSE;
	description = "Co chcesz mi zaproponowa�?";
};


func int dia_rupert_youroffer_condition()
{
	return TRUE;
};

func void dia_rupert_youroffer_info()
{
	AI_Output(other,self,"DIA_Rupert_YourOffer_15_00");	//Co sprzedajesz?
	AI_Output(self,other,"DIA_Rupert_YourOffer_03_01");	//W tej chwili wyb�r jest niewielki.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rupert_YourOffer_03_02");	//Ten cholerny w�a�ciciel ziemski przerwa� dostawy, a to co skupujemy z ma�ych farm, nie wystarcza, by zaspokoi� potrzeby miasta.
	};
};


instance DIA_RUPERT_TRADE(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 900;
	condition = dia_rupert_trade_condition;
	information = dia_rupert_trade_info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
	trade = TRUE;
};


func int dia_rupert_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_youroffer))
	{
		return TRUE;
	};
};

func void dia_rupert_trade_info()
{
	if(Npc_HasItems(self,itfo_cheese) < 5)
	{
		CreateInvItems(self,itfo_cheese,5);
	};
	AI_Output(other,self,"DIA_Rupert_Trade_15_00");	//Poka� mi swoje towary.
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rupert_Trade_03_01");	//Musisz mi wybaczy� niewielki wyb�r, cz�owiek z twoj� pozycj� z pewno�ci� przywyk� do czego� wi�cej.
	};
};


instance DIA_RUPERT_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_bauernaufstand_condition;
	information = dia_rupert_bauernaufstand_info;
	permanent = FALSE;
	description = "Powiedz mi prosz� co� wi�cej o buncie ch�op�w.";
};


func int dia_rupert_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_youroffer) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Rupert_Bauernaufstand_15_00");	//Powiedz mi prosz� co� wi�cej o buncie ch�op�w.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_01");	//To do�� proste: Onar, bogaty w�a�ciciel ziemski, przesta� p�aci� miastu podatki.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_02");	//Wyobra� sobie! Jeste�my w stanie wojny z orkami, a ten snob chce zagarn�� wszystko dla siebie.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_03");	//W zwyk�ych okoliczno�ciach stra� miejska szybko zaj�aby si� t� spraw�.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_04");	//Ale uwa�aj, bo teraz b�dzie najlepsze: powiadaj�, �e Onar zatrudni� najemnik�w, kt�rych zadaniem jest odp�dzanie oddzia��w stra�y miejskiej!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_05");	//NAJEMNICY! M�wi� ci, to wszystko sko�czy si� wojn�! Jakby JEDNEJ by�o nam za ma�o!
};


instance DIA_RUPERT_MERCS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_mercs_condition;
	information = dia_rupert_mercs_info;
	permanent = FALSE;
	description = "Co wiesz o najemnikach Onara?";
};


func int dia_rupert_mercs_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_bauernaufstand) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_rupert_mercs_info()
{
	AI_Output(other,self,"DIA_Rupert_Mercs_15_00");	//Co wiesz o najemnikach Onara?
	AI_Output(self,other,"DIA_Rupert_Mercs_03_01");	//S�ysza�em, �e wi�kszo�� z nich to byli skaza�cy z kolonii g�rniczej.
	AI_Output(self,other,"DIA_Rupert_Mercs_03_02");	//Ich przyw�dca by� chyba jak�� grub� ryb� na kr�lewskim dworze - genera�em, czy kim� takim. Wygnano go jako zdrajc�.
	AI_Output(self,other,"DIA_Rupert_Mercs_03_03");	//Ci�kie czasy nasta�y.
};

