
instance DIA_BILGOT_EXIT(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 999;
	condition = dia_bilgot_exit_condition;
	information = dia_bilgot_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bilgot_exit_condition()
{
	return TRUE;
};

func void dia_bilgot_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_HALLO(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_hallo_condition;
	information = dia_bilgot_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bilgot_hallo_condition()
{
	return TRUE;
};

func void dia_bilgot_hallo_info()
{
	AI_Output(self,other,"DIA_Bilgot_HALLO_05_00");	//Hej, sk�d przyszed�e�? Mo�e z zamku?
	Info_AddChoice(dia_bilgot_hallo,"Tak, przyszed�em z zamku, a co?",dia_bilgot_hallo_burg);
	Info_AddChoice(dia_bilgot_hallo,"Wpad�em tu przez przypadek...",dia_bilgot_hallo_zufall);
};

func void dia_bilgot_hallo_zufall()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Zufall_15_00");	//Wpad�em tu przez przypadek...
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_01");	//Ej, nikt tu nie trafia przez PRZYPADEK. Wszyscy jeste�my skazani - otoczeni przez z�bacze!
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_02");	//Codziennie kolejny z nas gryzie ziemi�.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_03");	//Nie chcesz mi powiedzie�, sk�d przyszed�e�? Dobra - w takim razie niech ci� z�bacze ze�r�!
	AI_StopProcessInfos(self);
};

func void dia_bilgot_hallo_burg()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_00");	//Tak, przyszed�em z zamku, a co?
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_01");	//Jak wygl�da sytuacja?
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_02");	//Nie lepiej ni� tu. Orkowie nadal tam s�, je�li o to pytasz.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_03");	//Cholera. Nigdzie nie jeste� bezpieczny.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_04");	//Co� ci powiem. Gdybym nie by� tak przera�ony, ju� dawno bym si� st�d zmy�.
	Info_ClearChoices(dia_bilgot_hallo);
};


instance DIA_BILGOT_JOB(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_job_condition;
	information = dia_bilgot_job_info;
	permanent = FALSE;
	description = "A co tu w�a�ciwie robisz?";
};


func int dia_bilgot_job_condition()
{
	return TRUE;
};

func void dia_bilgot_job_info()
{
	AI_Output(other,self,"DIA_Bilgot_Job_15_00");	//A co tu w�a�ciwie robisz?
	AI_Output(self,other,"DIA_Bilgot_Job_05_01");	//A, robi� tu za ch�opca na posy�ki. Zanie� to tam, miej na oku z�bacze, Bilgot chod� tu, Bilgot id� tam...
	AI_Output(self,other,"DIA_Bilgot_Job_05_02");	//Mog�em zosta� w domu z moj� star�. Tam by�o tak samo, ale mog�em przynajmniej porz�dnie zje��.
	AI_Output(self,other,"DIA_Bilgot_Job_05_03");	//A teraz jestem ostatnim niedobitkiem z kontyngentu przydzielonego do Fajetha.
	AI_Output(self,other,"DIA_Bilgot_Job_05_04");	//Sk�d mia�em wiedzie�, �e ta ekspedycja nie wr�ci?
	AI_Output(self,other,"DIA_Bilgot_Job_05_05");	//M�j kumpel, Olav, ulotni� si�. Mo�e JEMU si� uda�o...
};


instance DIA_BILGOT_HILFE(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_hilfe_condition;
	information = dia_bilgot_hilfe_info;
	permanent = FALSE;
	description = "Co wiesz o z�baczach?";
};


func int dia_bilgot_hilfe_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bilgot_hilfe_info()
{
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_00");	//Co wiesz o z�baczach?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_01");	//A czemu chcesz to wiedzie�? Tylko nie m�w, �e jeste� po prostu ciekawy!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_02");	//Zamierzam zapolowa� na te z�bacze.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_03");	//To szale�stwo. Obserwowa�em je - to krwio�ercze bestie.
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_04");	//No to powiedz mi, co o nich wiesz.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_05");	//Hmmm... M�g�bym ci pom�c, ale pod jednym warunkiem!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_06");	//Czego chcesz?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_07");	//Je�li uda ci si� pozabija� z�bacze, to mnie st�d wyci�gniesz!
	if(Npc_IsDead(fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Bilgot_Hilfe_05_08");	//Nie wytrzymam tu d�u�ej. Rozmawia�e� z Fedem? Ten facet to kompletny wrak - nie chc� sko�czy� jak on.
	};
};


instance DIA_BILGOT_KNOWSLEADSNAPPER(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 4;
	condition = dia_bilgot_knowsleadsnapper_condition;
	information = dia_bilgot_knowsleadsnapper_info;
	permanent = FALSE;
	description = "Powiedz mi, co wiesz. Wtedy ci� st�d zabior�.";
};


func int dia_bilgot_knowsleadsnapper_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_hilfe) && (MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bilgot_knowsleadsnapper_info()
{
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_00");	//Powiedz mi, co wiesz. Wtedy ci� st�d zabior�.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_01");	//Wiedzia�em, �e mog� na ciebie liczy�. No to s�uchaj. Do�� d�ugo obserwowa�em z�bacze.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_02");	//S� bardzo sprytne i jako� si�... porozumiewaj�. Nigdy nie chodz� same. Atakuj� ca�ym stadem.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_03");	//Ale jest co� jeszcze. W�r�d nich jest jaki� inny jaszczur. Rzadko si� pokazuje, ale go widzia�em.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_04");	//Inne z�bacze pochylaj� �by, kiedy przechodzi, ale ci�gle go obserwuj�.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_05");	//Dop�ki ten jeden si� nie ruszy, reszta te� nie.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_06");	//Gdzie znajd� to cholerne bydl�?
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_07");	//Widzia�em go ko�o schod�w prowadz�cych do starej wie�y stra�niczej.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_08");	//�wietnie. Chyba zrozumia�em. Dzi�kuj�!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_09");	//Pami�taj, da�e� mi s�owo!
	Wld_InsertNpc(newmine_leadsnapper,"OW_ORC_LOOKOUT_2_01");
	b_logentry(TOPIC_FAJETHKILLSNAPPER,"Bilgot opowiedzia� mi o przyw�dcy stada z�baczy. Znajd� go na schodach starej wie�y stra�niczej.");
	Log_CreateTopic(TOPIC_BILGOTESCORT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BILGOTESCORT,LOG_RUNNING);
	b_logentry(TOPIC_BILGOTESCORT,"Bilgot chce, abym pom�g� mu wydosta� si� z doliny.");
};


instance DIA_BILGOT_TAKEYOUWITHME(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_takeyouwithme_condition;
	information = dia_bilgot_takeyouwithme_info;
	permanent = FALSE;
	description = "(Dotrzymaj obietnicy)";
};


func int dia_bilgot_takeyouwithme_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper))
	{
		return TRUE;
	};
};

func void dia_bilgot_takeyouwithme_info()
{
	AI_Output(other,self,"DIA_Bilgot_TAKEYOUWITHME_15_00");	//Pora rusza�, Bilgot! Pakuj manatki.
	AI_Output(self,other,"DIA_Bilgot_TAKEYOUWITHME_05_03");	//Jestem gotowy!
	Npc_ExchangeRoutine(self,"FOLLOWTOOCBRIDGE");
	bilgot.flags = 0;
	MIS_RESCUEBILGOT = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_LAUFSCHNELLER(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 5;
	condition = dia_bilgot_laufschneller_condition;
	information = dia_bilgot_laufschneller_info;
	permanent = FALSE;
	description = "Nie mo�esz i�� troch� szybciej?!";
};


func int dia_bilgot_laufschneller_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_takeyouwithme) && (Npc_KnowsInfo(other,dia_bilgot_beibrueckeangekommen) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bilgot_laufschneller_info()
{
	AI_Output(other,self,"DIA_Bilgot_LAUFSCHNELLER_15_00");	//Nie mo�esz i�� troch� szybciej?!
	AI_Output(self,other,"DIA_Bilgot_LAUFSCHNELLER_05_01");	//Id� tak szybko, jak daj� rad�.
};


instance DIA_BILGOT_BEIBRUECKEANGEKOMMEN(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_beibrueckeangekommen_condition;
	information = dia_bilgot_beibrueckeangekommen_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bilgot_beibrueckeangekommen_condition()
{
	if(Npc_GetDistToWP(self,"START") < 8000)
	{
		return TRUE;
	};
};

func void dia_bilgot_beibrueckeangekommen_info()
{
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00");	//Dobra, jeste�my. A teraz szybko. Ten teren jest niepewny!
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01");	//Dzi�kuj�!
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02");	//Nie daj si� zje��. Szkoda by ci� by�o.
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03");	//�egnaj!
	AI_StopProcessInfos(self);
	TSCHUESSBILGOT = TRUE;
	MIS_RESCUEBILGOT = LOG_SUCCESS;
	b_giveplayerxp(XP_BILGOTESCORT);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"FLEEOUTOFOW");
};


instance DIA_BILGOT_LETZTEPAUSE(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_letztepause_condition;
	information = dia_bilgot_letztepause_info;
	permanent = TRUE;
	description = "Co tu robisz? My�la�em, �e szed�e� do prze��czy?";
};


func int dia_bilgot_letztepause_condition()
{
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		return TRUE;
	};
};

func void dia_bilgot_letztepause_info()
{
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_00");	//Co tu robisz? My�la�em, �e szed�e� do prze��czy?
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_01");	//Ju� nie mog�. Pozw�l mi chwil� odpocz��. Dam rad�. Nie martw si�!
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_02");	//Skoro tak twierdzisz.
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_03");	//Tylko kr�tka przerwa.
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_OLAV(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_olav_condition;
	information = dia_bilgot_olav_info;
	permanent = FALSE;
	description = "Znalaz�em Olava.";
};


func int dia_bilgot_olav_condition()
{
	if((Npc_HasItems(olav,itse_olav) == 0) && Npc_KnowsInfo(other,dia_bilgot_job))
	{
		return TRUE;
	};
};

func void dia_bilgot_olav_info()
{
	AI_Output(other,self,"DIA_Bilgot_Olav_15_00");	//Znalaz�em Olava.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_01");	//Jak si� ma?
	AI_Output(other,self,"DIA_Bilgot_Olav_15_02");	//Nie �yje. Wilki go zjad�y.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_03");	//O, cholera. Mam nadziej�, �e chocia� ja zdo�am si� st�d wyrwa�.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BILGOT_PICKPOCKET(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 900;
	condition = dia_bilgot_pickpocket_condition;
	information = dia_bilgot_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_bilgot_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_bilgot_pickpocket_info()
{
	Info_ClearChoices(dia_bilgot_pickpocket);
	Info_AddChoice(dia_bilgot_pickpocket,DIALOG_BACK,dia_bilgot_pickpocket_back);
	Info_AddChoice(dia_bilgot_pickpocket,DIALOG_PICKPOCKET,dia_bilgot_pickpocket_doit);
};

func void dia_bilgot_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bilgot_pickpocket);
};

func void dia_bilgot_pickpocket_back()
{
	Info_ClearChoices(dia_bilgot_pickpocket);
};

