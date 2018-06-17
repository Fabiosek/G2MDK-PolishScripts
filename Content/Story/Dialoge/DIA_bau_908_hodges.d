
instance DIA_HODGES_KAP1_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap1_exit_condition;
	information = dia_hodges_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hodges_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_HALLO(C_INFO)
{
	npc = bau_908_hodges;
	nr = 1;
	condition = dia_hodges_hallo_condition;
	information = dia_hodges_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hodges_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_hallo_info()
{
	AI_Output(other,self,"DIA_Hodges_HALLO_15_00");	//Witaj, jestem tu nowy.
	AI_Output(self,other,"DIA_Hodges_HALLO_03_01");	//Nie chcia�bym, �eby� to odebra� w niew�a�ciwy spos�b, ale nie mam teraz ochoty na pogaw�dk� - jestem zupe�nie wyko�czony.
	AI_Output(other,self,"DIA_Hodges_HALLO_15_02");	//Masz strasznie du�o pracy, co?
	AI_Output(self,other,"DIA_Hodges_HALLO_03_03");	//Racja. Bennet wyrabia tyle broni, �e ledwie nad��am z jej polerowaniem.
};


instance DIA_HODGES_TELLABOUTFARM(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_tellaboutfarm_condition;
	information = dia_hodges_tellaboutfarm_info;
	permanent = FALSE;
	description = "Co mo�esz mi powiedzie� o farmie?";
};


func int dia_hodges_tellaboutfarm_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_tellaboutfarm_info()
{
	AI_Output(other,self,"DIA_Hodges_TellAboutFarm_15_00");	//Co mo�esz mi powiedzie� o farmie?
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_01");	//To jest farma Onara.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_02");	//A ten du�y budynek to jego dom. Jedno skrzyd�o zajmuj� najemnicy.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_03");	//Odk�d si� sprowadzili, my, farmerzy, musimy mieszka� w stodole.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_04");	//Ale mi to nie przeszkadza, to dobrze, �e kto� pilnuje farmy.
	if(Npc_GetDistToWP(self,"NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_05");	//Ten budynek to kuchnia.
	}
	else
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_06");	//Kuchnia znajduje si� na ty�ach ku�ni.
	};
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_07");	//Przy odrobinie szcz�cia mo�e za�apiesz si� na co� do jedzenia.
};


instance DIA_HODGES_ABOUTSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_aboutsld_condition;
	information = dia_hodges_aboutsld_info;
	permanent = FALSE;
	description = "A o co chodzi z tymi najemnikami?";
};


func int dia_hodges_aboutsld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_aboutsld_info()
{
	AI_Output(other,self,"DIA_Hodges_AboutSld_15_00");	//A o co chodzi z tymi najemnikami?
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_01");	//Onar wynaj�� ich, �eby obroni� si� przed stra��.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_02");	//Najemnicy chroni� tak�e farm�, trzod� i farmer�w.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_03");	//Wi�c �eby ci nie przysz�o do g�owy co� ukra��.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_04");	//Oni tylko czekaj� na pretekst, �eby ci� zbi� na kwa�ne jab�ko.
};


instance DIA_HODGES_TRADE(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_trade_condition;
	information = dia_hodges_trade_info;
	permanent = TRUE;
	description = "Mog� od ciebie kupi� bro�?";
	trade = TRUE;
};


func int dia_hodges_trade_condition()
{
	return TRUE;
};

func void dia_hodges_trade_info()
{
	AI_Output(other,self,"DIA_Hodges_TRADE_15_00");	//Mog� kupi� u ciebie jak�� bro�?
	AI_Output(self,other,"DIA_Hodges_TRADE_03_01");	//Wyb�r jest do�� ubogi. Wi�kszo�� mieczy i topor�w trafia do Onara.
	Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
};


instance DIA_HODGES_KAP2_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap2_exit_condition;
	information = dia_hodges_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hodges_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP3_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap3_exit_condition;
	information = dia_hodges_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hodges_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_DONTWORK(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_dontwork_condition;
	information = dia_hodges_dontwork_info;
	permanent = FALSE;
	description = "Dlaczego nie pracujesz?";
};


func int dia_hodges_dontwork_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_dontwork_info()
{
	AI_Output(other,self,"DIA_Hodges_DontWork_15_00");	//Dlaczego nie pracujesz?
	AI_Output(self,other,"DIA_Hodges_DontWork_03_01");	//Jeszcze nie s�ysza�e�? Paladyni aresztowali Benneta.
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"Kowal Bennet zosta� aresztowany w mie�cie przez paladyn�w.");
};


instance DIA_HODGES_WHATHAPPENED(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_whathappened_condition;
	information = dia_hodges_whathappened_info;
	permanent = FALSE;
	description = "Co si� sta�o?";
};


func int dia_hodges_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_whathappened_info()
{
	AI_Output(other,self,"DIA_Hodges_WhatHappened_15_00");	//Co si� sta�o?
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_01");	//Byli�my na zakupach w mie�cie, kiedy nagle us�yszeli�my krzyk: 'Tu s�, pojma� ich!'
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_02");	//O rany, ale si� przestraszy�em! Ucieka�em, jakby �ciga�o mnie ca�e stado demon�w.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_03");	//Bennet by� tu� za mn�. Nie wiem, co si� sta�o, ale kiedy dotar�em do bram miasta, jego ju� nie by�o.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_04");	//Musia� si� zgubi� gdzie� po drodze.
};


instance DIA_HODGES_BENNETSCRIME(C_INFO)
{
	npc = bau_908_hodges;
	nr = 32;
	condition = dia_hodges_bennetscrime_condition;
	information = dia_hodges_bennetscrime_info;
	permanent = FALSE;
	description = "Jaki zarzut postawiono Bennetowi?";
};


func int dia_hodges_bennetscrime_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetscrime_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_00");	//Jaki zarzut postawiono Bennetowi?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_01");	//Morderstwo! Podobno zabi� paladyna. Co za wierutna bzdura! Przez ca�y czas by� tu� obok mnie.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_02");	//Wi�c dlaczego nie p�jdziesz do miasta i nie wyja�nisz ca�ej sprawy?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_03");	//Zamkn�liby mnie do pud�a jako jego wsp�lnika. Szczeg�lnie w obecnej sytuacji.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_04");	//Sytuacji?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_05");	//No wiesz, Onar. To si� musia�o tak sko�czy�.
	b_logentry(TOPIC_RESCUEBENNET,"Podobno Bennet zamordowa� paladyna. Jego czeladnik Hodges twierdzi, �e to nieprawda, jednak boi si� o�wiadczy� to w mie�cie.");
};


instance DIA_HODGES_BENNETANDSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 33;
	condition = dia_hodges_bennetandsld_condition;
	information = dia_hodges_bennetandsld_info;
	permanent = FALSE;
	description = "Jak zareagowali na to wasi najemnicy?";
};


func int dia_hodges_bennetandsld_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetandsld_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_00");	//Jak zareagowali na to wasi najemnicy?
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_01");	//Oczywi�cie nie wiem dok�adnie, co zamierzaj�, ale niekt�rzy z nich s� naprawd� wkurzeni.
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_02");	//Domy�lam si�.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_03");	//Gdyby to zale�a�o od nich, natychmiast zaatakowaliby miasto, �eby odbi� Benneta.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_04");	//Porozmawiaj z Lee, mo�e co� da si� zrobi�.
};


instance DIA_HODGES_KAP4_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap4_exit_condition;
	information = dia_hodges_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hodges_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP5_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap5_exit_condition;
	information = dia_hodges_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hodges_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_PICKPOCKET(C_INFO)
{
	npc = bau_908_hodges;
	nr = 900;
	condition = dia_hodges_pickpocket_condition;
	information = dia_hodges_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_hodges_pickpocket_condition()
{
	return c_beklauen(15,10);
};

func void dia_hodges_pickpocket_info()
{
	Info_ClearChoices(dia_hodges_pickpocket);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_BACK,dia_hodges_pickpocket_back);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_PICKPOCKET,dia_hodges_pickpocket_doit);
};

func void dia_hodges_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hodges_pickpocket);
};

func void dia_hodges_pickpocket_back()
{
	Info_ClearChoices(dia_hodges_pickpocket);
};

