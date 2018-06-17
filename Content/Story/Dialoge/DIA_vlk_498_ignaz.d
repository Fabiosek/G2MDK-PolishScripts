
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
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_00");	//O, przychodzisz w sam¹ porê. W³aœnie poszukujê asystenta do mojego magicznego eksperymentu.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_01");	//Jestem pewien, ¿e zgodzisz siê pomóc w imiê nauki.
	AI_Output(other,self,"DIA_Ignaz_Hallo_15_02");	//Powoli, przyjacielu. Najpierw powiedz mi dok³adnie, o co chodzi.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_03");	//Stworzy³em nowe zaklêcie. Zaklêcie Zapomnienia.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_04");	//Przeprowadzi³em ju¿ parê udanych testów, ale wci¹¿ brakuje mi czasu na jedn¹, ostateczn¹ próbê.
};


instance DIA_IGNAZ_TRAENKE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 3;
	condition = dia_ignaz_traenke_condition;
	information = dia_ignaz_traenke_info;
	permanent = FALSE;
	description = "Co bêdê z tego mia³?";
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
	AI_Output(other,self,"DIA_Ignaz_Traenke_15_00");	//Co bêdê z tego mia³?
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_01");	//Móg³bym ciê nauczyæ przygotowywaæ ró¿ne mikstury.
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_02");	//Znam przepisy na esencje lecznicze, regeneruj¹ce manê i zwiêkszaj¹ce szybkoœæ.
};


instance DIA_IGNAZ_EXPERIMENT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 4;
	condition = dia_ignaz_experiment_condition;
	information = dia_ignaz_experiment_info;
	permanent = FALSE;
	description = "Powiedz mi wiêcej o tym eksperymencie i o samym zaklêciu.";
};


func int dia_ignaz_experiment_condition()
{
	return TRUE;
};

func void dia_ignaz_experiment_info()
{
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_00");	//Powiedz mi wiêcej o tym eksperymencie i o samym zaklêciu.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_01");	//Zaklêcie s³u¿y do wymazywania z pamiêci ró¿nych wspomnieñ.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_02");	//Jak na razie uda³o mi siê ustaliæ, ¿e dzia³a ono tylko i wy³¹cznie wtedy, gdy ofiara jest wœciek³a - na przyk³ad zosta³a ostatnio pobita lub okradziona.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_03");	//Nawet jeœli ktoœ by³ jedynie œwiadkiem takiego wydarzenia, zostanie ono usuniête z jego pamiêci.
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_04");	//Wiêc mam kogoœ pobiæ, a potem wypróbowaæ na nim zaklêcie?
	AI_Output(other,self,"DIA_Ignaz_Add_15_00");	//Ma to sens tylko i wy³¹cznie wtedy, kiedy ofiara jest NAPRAWDÊ wœciek³a.
	AI_Output(other,self,"DIA_Ignaz_Add_15_01");	//Tutaj, w dzielnicy portowej, ludzie s¹ przyzwyczajeni do bójek. Lepiej spróbujê gdzie indziej.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_05");	//Tak, masz s³usznoœæ. Ale ¿eby kogoœ rozwœcieczyæ, wystarczy go zaatakowaæ - nie musisz od razu ³amaæ mu wszystkich koœci.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_06");	//Lepiej wybierz sobie jak¹œ samotn¹ ofiarê - jeœli ktoœ zobaczy bójkê, mo¿esz mieæ problemy z Lordem Andre.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_07");	//Nie ma równie¿ sensu rzucaæ zaklêcia na osobê, która w³aœnie ciê atakuje. Musisz poczekaæ na w³aœciwy moment.
};


instance DIA_IGNAZ_TEILNEHMEN(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 5;
	condition = dia_ignaz_teilnehmen_condition;
	information = dia_ignaz_teilnehmen_info;
	permanent = FALSE;
	description = "Dobrze, wypróbujê to zaklêcie.";
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
	AI_Output(other,self,"DIA_Ignaz_teilnehmen_15_00");	//Dobrze, wypróbujê to zaklêcie.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_01");	//A zatem weŸ ten zwój i poszukaj sobie dobrej œwinki doœwiadczalnej.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_02");	//Kiedy ju¿ skoñczysz, wróæ do mnie i powiedz, jak ci posz³o.
	b_giveinvitems(self,other,itsc_charm,1);
	MIS_IGNAZ_CHARM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_IGNAZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGNAZ,LOG_RUNNING);
	b_logentry(TOPIC_IGNAZ,"Mam wypróbowaæ nowe zaklêcie Ignaza. Jest to czar zapomnienia. Osoby, które s¹ na mnie obra¿one z jakiegoœ powodu, nie bêd¹ chcia³y ze mn¹ rozmawiaæ. W takim przypadku zaklêcie Ignaza mo¿e okazaæ siê naprawdê przydatne.");
	b_logentry(TOPIC_IGNAZ,"Pobity nie bêdzie nawet pamiêta³, ¿e zg³osi³ swoje pobicie stra¿y. Teraz mogê zaatakowaæ ka¿dego w dzielnicy portowej bez obaw, ¿e siê na mnie obrazi.");
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
	AI_Output(self,other,"DIA_Ignaz_Running_14_01");	//Czy próba siê powiod³a? Czy tylko zmarnowa³eœ zwój? Co? Mów szybko.
	AI_Output(self,other,"DIA_Ignaz_Running_14_02");	//Jeœli potrzebujesz wiêcej zwojów z czarami, mo¿esz je kupiæ ode mnie.
};


instance DIA_IGNAZ_DANACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_danach_condition;
	information = dia_ignaz_danach_info;
	permanent = FALSE;
	description = "U¿y³em zwoju z twoim zaklêciem.";
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
	AI_Output(other,self,"DIA_Ignaz_Danach_15_00");	//U¿y³em zwoju z twoim zaklêciem.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_01");	//Dobrze, dobrze. I co, zadzia³a³o?
	AI_Output(other,self,"DIA_Ignaz_Danach_15_02");	//Tak, zadzia³a³o.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_03");	//Doskonale! Jeden ma³y krok dla nauki, jeden ogromny krok dla mojej kariery.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_04");	//Teraz mogê ciê nauczyæ paru rzeczy o sztuce alchemii.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_05");	//Mogê ci równie¿ daæ kilka przydatnych przedmiotów, jeœli chcesz.
	IGNAZ_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Ignaz mo¿e mi pokazaæ receptury na ró¿ne mikstury. Mieszka w dzielnicy portowej.");
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
	description = "Poka¿ mi swoje towary.";
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
	AI_Output(other,self,"DIA_Ignaz_Trade_15_00");	//Poka¿ mi swoje towary.
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
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Mikstura szybkoœci",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED)),dia_ignaz_teach_speed);
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
			AI_Output(self,other,"DIA_Ignaz_Teach_14_01");	//Aby przygotowaæ miksturê, potrzebujesz menzurki.
			AI_Output(self,other,"DIA_Ignaz_Teach_14_02");	//Bêd¹ ci równie¿ potrzebne odpowiednie sk³adniki.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_04");	//Co chcesz wiedzieæ?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ignaz_Teach_14_05");	//Wiesz ju¿ wszystko, czego móg³bym ciê nauczyæ.
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

