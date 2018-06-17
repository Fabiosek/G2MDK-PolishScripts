
instance DIA_TENGRON_EXIT(C_INFO)
{
	npc = pal_280_tengron;
	nr = 999;
	condition = dia_tengron_exit_condition;
	information = dia_tengron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tengron_exit_condition()
{
	return TRUE;
};

func void dia_tengron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TENGRON_FIRST(C_INFO)
{
	npc = pal_280_tengron;
	nr = 2;
	condition = dia_tengron_first_condition;
	information = dia_tengron_first_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tengron_first_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SCOUTMINE != LOG_RUNNING) && (MIS_SCOUTMINE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_tengron_first_info()
{
	AI_Output(self,other,"DIA_Tengron_First_07_00");	//Co tu robisz?
	AI_Output(other,self,"DIA_Tengron_First_15_01");	//Jestem tu z rozkazu Lorda Hagena.
	AI_Output(self,other,"DIA_Tengron_First_07_02");	//Musisz za wszelk� cen� dotrze� do zamku i porozmawia� z Kapitanem Garondem.
};


instance DIA_TENGRON_HALLO(C_INFO)
{
	npc = pal_280_tengron;
	nr = 2;
	condition = dia_tengron_hallo_condition;
	information = dia_tengron_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tengron_hallo_condition()
{
	if((Npc_IsInState(self,zs_talk) && (MIS_SCOUTMINE == LOG_RUNNING)) || (MIS_SCOUTMINE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_tengron_hallo_info()
{
	AI_Output(self,other,"DIA_Tengron_HALLO_07_00");	//Niech Innos b�dzie z tob�! Przynosisz wie�ci z zamku? Czy w ko�cu przyb�d� posi�ki?
	if(Npc_IsDead(fajeth) == FALSE)
	{
		AI_Output(other,self,"DIA_Tengron_HALLO_15_01");	//Nie przychodz� z wie�ciami, przychodz� po wie�ci.
		AI_Output(self,other,"DIA_Tengron_HALLO_07_02");	//W takim razie porozmawiaj z Fajethem. On tutaj dowodzi. Je�li b�dziesz mia� jakie� wie�ci z zamku, natychmiast przyjd� z nimi do mnie.
	};
};


instance DIA_TENGRON_NEWS(C_INFO)
{
	npc = pal_280_tengron;
	nr = 7;
	condition = dia_tengron_news_condition;
	information = dia_tengron_news_info;
	permanent = FALSE;
	description = "Ja w sprawie informacji...";
};


func int dia_tengron_news_condition()
{
	if(Npc_KnowsInfo(other,dia_tengron_hallo))
	{
		return TRUE;
	};
};

func void dia_tengron_news_info()
{
	AI_Output(other,self,"DIA_Tengron_News_15_00");	//Ja w sprawie informacji...
	AI_Output(self,other,"DIA_Tengron_News_07_01");	//Tak - jak wygl�da sytuacja w zamku?
	AI_Output(other,self,"DIA_Tengron_News_15_02");	//Jest oblegany przez ork�w i wci�� nara�ony na ataki smok�w.
	AI_Output(self,other,"DIA_Tengron_News_07_03");	//Cholera, mam nadziej�, �e ch�opcy wytrzymaj�.
	AI_Output(self,other,"DIA_Tengron_News_07_04");	//Pos�uchaj, na zamku stacjonuje m�j przyjaciel. Ma na imi� Udar. Znamy si� od dawna, walczyli�my rami� w rami� w niejednej bitwie.
	AI_Output(self,other,"DIA_Tengron_News_07_05");	//Chc�, by� zani�s� mu ten pier�cie�, niech go dla mnie przechowa. Przeka� mu, �e odbior� pier�cie�, gdy wr�c�.
	Info_ClearChoices(dia_tengron_news);
	Info_AddChoice(dia_tengron_news,"Obawiam si�, �e nie mam na to czasu.",dia_tengron_news_no);
	Info_AddChoice(dia_tengron_news,"Nie ma sprawy...",dia_tengron_news_yes);
};

func void dia_tengron_news_no()
{
	AI_Output(other,self,"DIA_Tengron_News_No_15_00");	//Nie mam na to czasu.
	AI_Output(self,other,"DIA_Tengron_News_No_07_01");	//Rozumiem.
	Info_ClearChoices(dia_tengron_news);
};

func void dia_tengron_news_yes()
{
	AI_Output(other,self,"DIA_Tengron_News_Yes_15_00");	//�aden problem, kiedy tylko dotr� do zamku, przeka�� pier�cie� Udarowi.
	AI_Output(self,other,"DIA_Tengron_News_Yes_07_01");	//Wspaniale. Magia pier�cienia doda Udarowi si�. I nie zapomnij mu powiedzie�, �e odbior� pier�cie�, kiedy b�d� w zamku.
	b_giveinvitems(self,other,itri_tengron,1);
	Info_ClearChoices(dia_tengron_news);
	Log_CreateTopic(TOPIC_TENGRONRING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TENGRONRING,LOG_RUNNING);
	b_logentry(TOPIC_TENGRONRING,"Tengron da� mi pier�cie�, kt�ry mam zanie�� do zamku i wr�czy� Udarowi.");
};


instance DIA_TENGRON_SITUATION(C_INFO)
{
	npc = pal_280_tengron;
	nr = 70;
	condition = dia_tengron_situation_condition;
	information = dia_tengron_situation_info;
	permanent = TRUE;
	description = "Jak wygl�da wasza sytuacja?";
};


func int dia_tengron_situation_condition()
{
	if(Npc_KnowsInfo(other,dia_tengron_hallo))
	{
		return TRUE;
	};
};

func void dia_tengron_situation_info()
{
	AI_Output(other,self,"DIA_Tengron_Situation_15_00");	//Jak wygl�da wasza sytuacja?
	AI_Output(self,other,"DIA_Tengron_Situation_07_01");	//Jeste�my otoczeni przez potwory, wydobycie rudy idzie bardzo s�abo. Co gorsza, stracili�my wielu dobrych ludzi.
	AI_Output(self,other,"DIA_Tengron_Situation_07_02");	//Nie wiem, jak d�ugo uda nam si� utrzyma�, ale nie poddamy si�!
};


instance DIA_TENGRON_HELP(C_INFO)
{
	npc = pal_280_tengron;
	nr = 9;
	condition = dia_tengron_help_condition;
	information = dia_tengron_help_info;
	permanent = FALSE;
	description = "Przyda�aby mi si� twoja pomoc...";
};


func int dia_tengron_help_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING) && Npc_KnowsInfo(other,dia_tengron_hallo))
	{
		return TRUE;
	};
};

func void dia_tengron_help_info()
{
	AI_Output(other,self,"DIA_Tengron_HELP_15_00");	//Przyda�aby mi si� twoja pomoc. Fajeth chce, bym zapolowa� na z�bacze, i...
	AI_Output(self,other,"DIA_Tengron_HELP_07_01");	//Przyjmuj� rozkazy JEDYNIE od Fajetha. One za� s� jednoznaczne, mam broni� kopalni. To w�a�nie robi�.
	AI_Output(self,other,"DIA_Tengron_HELP_07_02");	//Mo�e kto� inny zechce ci pom�c.
};


instance DIA_TENGRON_PICKPOCKET(C_INFO)
{
	npc = pal_280_tengron;
	nr = 900;
	condition = dia_tengron_pickpocket_condition;
	information = dia_tengron_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_tengron_pickpocket_condition()
{
	return c_beklauen(32,50);
};

func void dia_tengron_pickpocket_info()
{
	Info_ClearChoices(dia_tengron_pickpocket);
	Info_AddChoice(dia_tengron_pickpocket,DIALOG_BACK,dia_tengron_pickpocket_back);
	Info_AddChoice(dia_tengron_pickpocket,DIALOG_PICKPOCKET,dia_tengron_pickpocket_doit);
};

func void dia_tengron_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_tengron_pickpocket);
};

func void dia_tengron_pickpocket_back()
{
	Info_ClearChoices(dia_tengron_pickpocket);
};

