
instance DIA_IGNAZ_EXIT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 999;
	condition = dia_ignaz_exit_condition;
	information = dia_ignaz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ignaz_exit_condition()
{
	return TRUE;
};

func void dia_ignaz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_PICKPOCKET(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 900;
	condition = dia_ignaz_pickpocket_condition;
	information = dia_ignaz_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ignaz_pickpocket_condition()
{
	return c_beklauen(38,50);
};

func void dia_ignaz_pickpocket_info()
{
	Info_ClearChoices(dia_ignaz_pickpocket);
	Info_AddChoice(dia_ignaz_pickpocket,DIALOG_BACK,dia_ignaz_pickpocket_back);
	Info_AddChoice(dia_ignaz_pickpocket,DIALOG_PICKPOCKET,dia_ignaz_pickpocket_doit);
};

func void dia_ignaz_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ignaz_pickpocket);
};

func void dia_ignaz_pickpocket_back()
{
	Info_ClearChoices(dia_ignaz_pickpocket);
};


instance DIA_IGNAZ_HALLO(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_hallo_condition;
	information = dia_ignaz_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ignaz_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ignaz_hallo_info()
{
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_00");	//O, przychodzisz w sam� por�. W�a�nie poszukuj� asystenta do mojego magicznego eksperymentu.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_01");	//Jestem pewien, �e zgodzisz si� pom�c w imi� nauki.
	AI_Output(other,self,"DIA_Ignaz_Hallo_15_02");	//Powoli, przyjacielu. Najpierw powiedz mi dok�adnie, o co chodzi.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_03");	//Stworzy�em nowe zakl�cie. Zakl�cie Zapomnienia.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_04");	//Przeprowadzi�em ju� par� udanych test�w, ale wci�� brakuje mi czasu na jedn�, ostateczn� pr�b�.
};


instance DIA_IGNAZ_TRAENKE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 3;
	condition = dia_ignaz_traenke_condition;
	information = dia_ignaz_traenke_info;
	permanent = FALSE;
	description = "Co b�d� z tego mia�?";
};


func int dia_ignaz_traenke_condition()
{
	if(MIS_IGNAZ_CHARM != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ignaz_traenke_info()
{
	AI_Output(other,self,"DIA_Ignaz_Traenke_15_00");	//Co b�d� z tego mia�?
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_01");	//M�g�bym ci� nauczy� przygotowywa� r�ne mikstury.
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_02");	//Znam przepisy na esencje lecznicze, regeneruj�ce man� i zwi�kszaj�ce szybko��.
};


instance DIA_IGNAZ_EXPERIMENT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 4;
	condition = dia_ignaz_experiment_condition;
	information = dia_ignaz_experiment_info;
	permanent = FALSE;
	description = "Powiedz mi wi�cej o tym eksperymencie i o samym zakl�ciu.";
};


func int dia_ignaz_experiment_condition()
{
	return TRUE;
};

func void dia_ignaz_experiment_info()
{
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_00");	//Powiedz mi wi�cej o tym eksperymencie i o samym zakl�ciu.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_01");	//Zakl�cie s�u�y do wymazywania z pami�ci r�nych wspomnie�.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_02");	//Jak na razie uda�o mi si� ustali�, �e dzia�a ono tylko i wy��cznie wtedy, gdy ofiara jest w�ciek�a - na przyk�ad zosta�a ostatnio pobita lub okradziona.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_03");	//Nawet je�li kto� by� jedynie �wiadkiem takiego wydarzenia, zostanie ono usuni�te z jego pami�ci.
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_04");	//Wi�c mam kogo� pobi�, a potem wypr�bowa� na nim zakl�cie?
	AI_Output(other,self,"DIA_Ignaz_Add_15_00");	//Ma to sens tylko i wy��cznie wtedy, kiedy ofiara jest NAPRAWD� w�ciek�a.
	AI_Output(other,self,"DIA_Ignaz_Add_15_01");	//Tutaj, w dzielnicy portowej, ludzie s� przyzwyczajeni do b�jek. Lepiej spr�buj� gdzie indziej.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_05");	//Tak, masz s�uszno��. Ale �eby kogo� rozw�cieczy�, wystarczy go zaatakowa� - nie musisz od razu �ama� mu wszystkich ko�ci.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_06");	//Lepiej wybierz sobie jak�� samotn� ofiar� - je�li kto� zobaczy b�jk�, mo�esz mie� problemy z Lordem Andre.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_07");	//Nie ma r�wnie� sensu rzuca� zakl�cia na osob�, kt�ra w�a�nie ci� atakuje. Musisz poczeka� na w�a�ciwy moment.
};


instance DIA_IGNAZ_TEILNEHMEN(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 5;
	condition = dia_ignaz_teilnehmen_condition;
	information = dia_ignaz_teilnehmen_info;
	permanent = FALSE;
	description = "Dobrze, wypr�buj� to zakl�cie.";
};


func int dia_ignaz_teilnehmen_condition()
{
	if(Npc_KnowsInfo(other,dia_ignaz_experiment))
	{
		return TRUE;
	};
};

func void dia_ignaz_teilnehmen_info()
{
	AI_Output(other,self,"DIA_Ignaz_teilnehmen_15_00");	//Dobrze, wypr�buj� to zakl�cie.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_01");	//A zatem we� ten zw�j i poszukaj sobie dobrej �winki do�wiadczalnej.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_02");	//Kiedy ju� sko�czysz, wr�� do mnie i powiedz, jak ci posz�o.
	b_giveinvitems(self,other,itsc_charm,1);
	MIS_IGNAZ_CHARM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_IGNAZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGNAZ,LOG_RUNNING);
	b_logentry(TOPIC_IGNAZ,"Mam wypr�bowa� nowe zakl�cie Ignaza. Jest to czar zapomnienia. Osoby, kt�re s� na mnie obra�one z jakiego� powodu, nie b�d� chcia�y ze mn� rozmawia�. W takim przypadku zakl�cie Ignaza mo�e okaza� si� naprawd� przydatne.");
	b_logentry(TOPIC_IGNAZ,"Pobity nie b�dzie nawet pami�ta�, �e zg�osi� swoje pobicie stra�y. Teraz mog� zaatakowa� ka�dego w dzielnicy portowej bez obaw, �e si� na mnie obrazi.");
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_RUNNING(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_running_condition;
	information = dia_ignaz_running_info;
	permanent = FALSE;
	description = "Co do eksperymentu...";
};


func int dia_ignaz_running_condition()
{
	if((MIS_IGNAZ_CHARM == LOG_RUNNING) && (CHARM_TEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_running_info()
{
	AI_Output(other,self,"DIA_Ignaz_Running_15_00");	//Co do eksperymentu...
	AI_Output(self,other,"DIA_Ignaz_Running_14_01");	//Czy pr�ba si� powiod�a? Czy tylko zmarnowa�e� zw�j? Co? M�w szybko.
	AI_Output(self,other,"DIA_Ignaz_Running_14_02");	//Je�li potrzebujesz wi�cej zwoj�w z czarami, mo�esz je kupi� ode mnie.
};


instance DIA_IGNAZ_DANACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_danach_condition;
	information = dia_ignaz_danach_info;
	permanent = FALSE;
	description = "U�y�em zwoju z twoim zakl�ciem.";
};


func int dia_ignaz_danach_condition()
{
	if((CHARM_TEST == TRUE) && (MIS_IGNAZ_CHARM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_ignaz_danach_info()
{
	AI_Output(other,self,"DIA_Ignaz_Danach_15_00");	//U�y�em zwoju z twoim zakl�ciem.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_01");	//Dobrze, dobrze. I co, zadzia�a�o?
	AI_Output(other,self,"DIA_Ignaz_Danach_15_02");	//Tak, zadzia�a�o.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_03");	//Doskonale! Jeden ma�y krok dla nauki, jeden ogromny krok dla mojej kariery.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_04");	//Teraz mog� ci� nauczy� paru rzeczy o sztuce alchemii.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_05");	//Mog� ci r�wnie� da� kilka przydatnych przedmiot�w, je�li chcesz.
	IGNAZ_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Ignaz mo�e mi pokaza� receptury na r�ne mikstury. Mieszka w dzielnicy portowej.");
	MIS_IGNAZ_CHARM = LOG_SUCCESS;
	b_giveplayerxp(XP_MIS_IGNAZ_CHARM);
	CreateInvItems(self,itsc_charm,3);
};


instance DIA_IGNAZ_TRADE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_trade_condition;
	information = dia_ignaz_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka� mi swoje towary.";
};


func int dia_ignaz_trade_condition()
{
	if((MIS_IGNAZ_CHARM == LOG_SUCCESS) || Npc_KnowsInfo(other,dia_ignaz_running))
	{
		return TRUE;
	};
};

func void dia_ignaz_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Ignaz_Trade_15_00");	//Poka� mi swoje towary.
};


instance DIA_IGNAZ_TEACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_teach_condition;
	information = dia_ignaz_teach_info;
	permanent = TRUE;
	description = "Opowiedz mi o sztuce alchemii.";
};


var int dia_ignaz_teach_permanent;

func int dia_ignaz_teach_condition()
{
	if((DIA_IGNAZ_TEACH_PERMANENT == FALSE) && (IGNAZ_TEACHALCHEMY == TRUE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Ignaz_Teach_15_00");	//Opowiedz mi o sztuce alchemii.
	if((PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE))
	{
		Info_ClearChoices(dia_ignaz_teach);
		Info_AddChoice(dia_ignaz_teach,DIALOG_BACK,dia_ignaz_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Mikstura szybko�ci",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED)),dia_ignaz_teach_speed);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Esencja many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_ignaz_teach_mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Esencja lecznicza",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_ignaz_teach_health);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_01");	//Aby przygotowa� mikstur�, potrzebujesz menzurki.
			AI_Output(self,other,"DIA_Ignaz_Teach_14_02");	//B�d� ci r�wnie� potrzebne odpowiednie sk�adniki.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_04");	//Co chcesz wiedzie�?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ignaz_Teach_14_05");	//Wiesz ju� wszystko, czego m�g�bym ci� nauczy�.
		DIA_IGNAZ_TEACH_PERMANENT = TRUE;
	};
};

func void dia_ignaz_teach_health()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_speed()
{
	b_teachplayertalentalchemy(self,other,POTION_SPEED);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_back()
{
	Info_ClearChoices(dia_ignaz_teach);
};

