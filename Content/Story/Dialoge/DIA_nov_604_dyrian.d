
instance DIA_DYRIAN_EXIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 999;
	condition = dia_dyrian_exit_condition;
	information = dia_dyrian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dyrian_exit_condition()
{
	return TRUE;
};

func void dia_dyrian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_HELLO(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_hello_condition;
	information = dia_dyrian_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_hello_info()
{
	AI_Output(self,other,"DIA_Dyrian_Hello_13_00");	//Czego chcesz?
};


instance DIA_DYRIAN_WURST(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_wurst_condition;
	information = dia_dyrian_wurst_info;
	permanent = FALSE;
	description = "Jestem zaj�ty roznoszeniem kie�bas.";
};


func int dia_dyrian_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_dyrian_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Dyrian_Wurst_15_00");	//Jestem zaj�ty roznoszeniem kie�bas.
	AI_Output(self,other,"DIA_Dyrian_Wurst_13_01");	//Dzi�kuj�. Mam nadziej�, �e to nie jest ostatnia kie�basa, jak� przyjdzie mi tutaj zje��.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_DYRIAN_JOB(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_job_condition;
	information = dia_dyrian_job_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_dyrian_job_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_hello) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_job_info()
{
	AI_Output(other,self,"DIA_Dyrian_Job_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Dyrian_Job_13_01");	//Pope�ni�em wykroczenie przeciw spo�eczno�ci.
	AI_Output(self,other,"DIA_Dyrian_Job_13_02");	//Teraz oczekuj�, a� Najwy�sza Rada zdecyduje, czy b�d� m�g� pozosta� w klasztorze.
};


instance DIA_DYRIAN_WHATDONE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_whatdone_condition;
	information = dia_dyrian_whatdone_info;
	permanent = FALSE;
	description = "Opowiedz mi, co zasz�o.";
};


func int dia_dyrian_whatdone_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_whatdone_info()
{
	AI_Output(other,self,"DIA_Dyrian_WhatDone_15_00");	//Opowiedz mi, co zasz�o.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_01");	//Podczas zamiatania zabra�em z pokoju jednego z mag�w ksi��k�, aby j� p�niej przeczyta�.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_02");	//Mistrz Hyglas oczywi�cie od razu to zauwa�y� i poprosi� mnie o jej zwrot.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_03");	//Poniewa� obawia�em si� kary, powiedzia�em mu, �e jej nie mam, ale jeszcze tego samego dnia Mistrz przy�apa� mnie z ksi�g� w mojej komnacie.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_04");	//Bardzo si� zdenerwowa� i powiadomi� Najwy�sz� Rad�. Teraz obraduj� nad tym, czy pozwoli� mi tu zosta�.
};


instance DIA_DYRIAN_CANHELP(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_canhelp_condition;
	information = dia_dyrian_canhelp_info;
	permanent = TRUE;
	description = "Czy mog� ci jako� pom�c?";
};


func int dia_dyrian_canhelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_canhelp_info()
{
	AI_Output(other,self,"DIA_Dyrian_CanHelp_15_00");	//Czy mog� ci jako� pom�c?
	AI_Output(self,other,"DIA_Dyrian_CanHelp_13_01");	//Nie, m�j los zale�y jedynie od �aski Innosa i mag�w.
};


instance DIA_DYRIAN_SCROLL(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_scroll_condition;
	information = dia_dyrian_scroll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_scroll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) || (MIS_RUNE == LOG_RUNNING) || (MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dyrian_scroll_info()
{
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_00");	//Hej, czy to prawda, �e za��da�e� Pr�by Ognia?
	AI_Output(other,self,"DIA_Dyrian_Scroll_15_01");	//Tak. I zamierzam j� przej��.
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_02");	//Dobrze. Mo�e b�d� w stanie ci pom�c. Mam tu bardzo przydatny zw�j magiczny. Zw�j SNU. Zainteresowany?
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"Nie, nie potrzebuj� twojej pomocy.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"Czego ��dasz?",dia_dyrian_scroll_how);
	Info_AddChoice(dia_dyrian_scroll,"Co mog� z tym zrobi�?",dia_dyrian_scroll_what);
};

func void dia_dyrian_scroll_what()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_00");	//Co mog� z tym zrobi�?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_01");	//Przy pomocy tego zakl�cia b�dziesz m�g� u�pi� na kr�tki czas ka�dego, kto posiada wol� s�absz� od twojej.
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_02");	//To mo�e okaza� si� niezwykle przydatne, je�li kto� stanie ci na drodze...
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_03");	//A sk�d b�d� wiedzia�, czy kto� ma wol� s�absz� od mojej?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_04");	//Mo�esz sobie darowa� pr�by u�pienia mag�w. Ale na wi�kszo�� nowicjuszy powinno podzia�a�.
};

func void dia_dyrian_scroll_no()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_No_15_00");	//Nie, nie potrzebuj� twojej pomocy.
	AI_Output(self,other,"DIA_Dyrian_Scroll_No_13_01");	//Je�li zmienisz zdanie, mo�esz w ka�dej chwili wr�ci�.
	Info_ClearChoices(dia_dyrian_scroll);
};

func void dia_dyrian_scroll_how()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_How_15_00");	//Co za to chcesz?
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_01");	//Ka�dy nowy mag ma prawo do jednego �yczenia.
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_02");	//Je�li rzeczywi�cie uda ci si� przej�� Pr�b� Ognia, mo�esz sobie za�yczy�, aby pozwolono mi zosta� w klasztorze.
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"Nie, nie potrzebuj� twojej pomocy.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"Dobrze, daj mi ten zw�j.",dia_dyrian_scroll_yes);
};

func void dia_dyrian_scroll_yes()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_Yes_15_00");	//Dobrze, daj mi ten zw�j.
	AI_Output(self,other,"DIA_Dyrian_Scroll_Yes_13_01");	//Powodzenia w czasie pr�by. Niech ci� Innos prowadzi.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_DYRIANDRIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DYRIANDRIN,LOG_RUNNING);
	b_logentry(TOPIC_DYRIANDRIN,"Dyrian da� mi magiczny zw�j snu. Je�li zostan� magiem, mam si� odwdzi�czy�, zapewniaj�c mu miejsce w klasztorze.");
	Info_ClearChoices(dia_dyrian_scroll);
};


instance DIA_DYRIAN_DOCH(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_doch_condition;
	information = dia_dyrian_doch_info;
	permanent = TRUE;
	description = "Zmieni�em zdanie. Daj mi zakl�cie nasenne.";
};


func int dia_dyrian_doch_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_scroll) && (MIS_HELPDYRIAN != LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_doch_info()
{
	AI_Output(other,self,"DIA_Dyrian_Doch_15_00");	//Zmieni�em zdanie. Daj mi zakl�cie nasenne.
	AI_Output(self,other,"DIA_Dyrian_Doch_13_01");	//Dobrze, je�li przejdziesz pr�b�, b�dziesz m�g� dopilnowa�, aby pozwolono mi zosta� w klasztorze.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
};


instance DIA_DYRIAN_HELLOAGAIN(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_helloagain_condition;
	information = dia_dyrian_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_helloagain_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_KDF) && (MIS_HELPDYRIAN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_dyrian_helloagain_info()
{
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_00");	//Dzi�kuj�, uratowa�e� mnie!
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_01");	//Och - wybacz, Mistrzu - nie chcia�em si� narzuca�.
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_02");	//Dzi�kuj� z ca�ego serca za umo�liwienie mi pozostania w klasztorze. Od dzi� moje �ycie si� zmieni...
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};

func void b_dyrian_playerhowisit()
{
	AI_Output(other,self,"DIA_Dyrian_HowIsIt_15_00");	//Jak leci?
};


instance DIA_DYRIAN_HOWISIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_howisit_condition;
	information = dia_dyrian_howisit_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_dyrian_howisit_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_helloagain))
	{
		return TRUE;
	};
};

func void dia_dyrian_howisit_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_01");	//Dobrze. Naprawd� lubi� t� prac�, Mistrzu.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_OTHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_other_condition;
	information = dia_dyrian_other_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_dyrian_other_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_dyrian_other_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_02");	//Dzi�kuj� Innosowi, �e mog� przebywa� tutaj, w klasztorze.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_KNEIPE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_kneipe_condition;
	information = dia_dyrian_kneipe_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_dyrian_kneipe_condition()
{
	if((MIS_HELPDYRIAN == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_dyrian_kneipe_info()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_01");	//�e te� w og�le o to pytasz... Pok�ada�em w tobie wszystkie moje nadzieje, a ty zostawi�e� mnie na lodzie.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_02");	//Nic mi ju� nie pozosta�o, opr�cz alkoholu. I to wszystko twoja wina!
	Info_ClearChoices(dia_dyrian_kneipe);
	Info_AddChoice(dia_dyrian_kneipe,"Prosz�, oto 5 sztuk z�ota dla ciebie.",dia_dyrian_kneipe_gold);
	Info_AddChoice(dia_dyrian_kneipe,"Mog� wszystko wyja�ni�.",dia_dyrian_kneipe_canexplain);
	Info_AddChoice(dia_dyrian_kneipe,"Uwa�aj, co m�wisz.",dia_dyrian_kneipe_shutup);
};

func void dia_dyrian_kneipe_gold()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_Gold_15_00");	//Prosz�, oto 5 sztuk z�ota.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_01");	//5 sztuk z�ota? Dajesz mi 5 sztuk z�ota i uwa�asz, �e to wystarczaj�ca rekompensata za moje zmarnowane �ycie?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_02");	//Zabior� ca�e twoje z�oto!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,0);
};

func void dia_dyrian_kneipe_canexplain()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_CanExplain_15_00");	//Mog� wszystko wyja�ni�.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_01");	//Oszcz�d� sobie naiwnych wym�wek.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_02");	//K�amiesz za ka�dym razem, kiedy tylko otwierasz usta. Zostaw mnie w spokoju.
	AI_StopProcessInfos(self);
};

func void dia_dyrian_kneipe_shutup()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_ShutUp_15_00");	//Uwa�aj, co m�wisz.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_01");	//Bardzo prosz�, mo�esz mi grozi�. Nic ci to nie da.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_02");	//Powiem ca�emu �wiatu, jaki z ciebie bezduszny, zak�amany dra�! Tylko najpierw sko�cz� t� flaszk�...
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_03");	//Zejd� mi z oczu! Brzydz� si� tob�!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_NACHHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_nachher_condition;
	information = dia_dyrian_nachher_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_dyrian_nachher_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_kneipe))
	{
		return TRUE;
	};
};

func void dia_dyrian_nachher_info()
{
	AI_Output(other,self,"DIA_Dyrian_nachher_15_00");	//Co tam?
	AI_Output(self,other,"DIA_Dyrian_nachher_13_01");	//Po prostu zostaw mnie w spokoju! Nie chc� mie� z tob� wi�cej nic wsp�lnego!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_PICKPOCKET(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 900;
	condition = dia_dyrian_pickpocket_condition;
	information = dia_dyrian_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_dyrian_pickpocket_condition()
{
	return c_beklauen(10,15);
};

func void dia_dyrian_pickpocket_info()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_BACK,dia_dyrian_pickpocket_back);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_PICKPOCKET,dia_dyrian_pickpocket_doit);
};

func void dia_dyrian_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dyrian_pickpocket);
};

func void dia_dyrian_pickpocket_back()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
};

