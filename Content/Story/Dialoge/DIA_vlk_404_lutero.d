
instance DIA_LUTERO_EXIT(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 999;
	condition = dia_lutero_exit_condition;
	information = dia_lutero_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lutero_exit_condition()
{
	return TRUE;
};

func void dia_lutero_exit_info()
{
	AI_StopProcessInfos(self);
	if((LUTERO_KRALLEN == LOG_RUNNING) && (MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) && (Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper) == FALSE))
	{
		LUTERO_KRALLEN = LOG_OBSOLETE;
		b_checklog();
	};
};


instance DIA_LUTERO_HALLO(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_hallo_condition;
	information = dia_lutero_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lutero_hallo_condition()
{
	if(((other.guild != GIL_NONE) || (other.guild != GIL_NOV)) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lutero_hallo_info()
{
	AI_Output(self,other,"DIA_Lutero_Hallo_13_00");	//Nazywam si� Lutero. Zajmuj� si� skupem i sprzeda�� najr�niejszych rzeczy.
	AI_Output(other,self,"DIA_Lutero_Hallo_15_01");	//Co mo�esz mi zaoferowa�?
	AI_Output(self,other,"DIA_Lutero_Hallo_13_02");	//Mam tu wyj�tkowo rzadkie i niespotykane towary. Jeszcze nigdy nie zdarzy�o mi si� zawie�� oczekiwa� klienta.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Lutero sprzedaje w g�rnym mie�cie rzadkie towary.");
};


instance DIA_LUTERO_GETLOST(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_getlost_condition;
	information = dia_lutero_getlost_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lutero_getlost_condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_NOV)) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lutero_getlost_info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_00");	//Wynocha st�d! Nie masz co robi�? Znajd� sobie jak�� prac�, darmozjadzie - tylko jak najdalej st�d!
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_01");	//Czego tu szukasz, nowicjuszu? Czy nie powiniene� przebywa� w klasztorze?
	};
	AI_StopProcessInfos(self);
};


instance DIA_LUTERO_SNAPPER(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_snapper_condition;
	information = dia_lutero_snapper_info;
	permanent = FALSE;
	description = "Szukasz czego� konkretnego?";
};


func int dia_lutero_snapper_condition()
{
	if((other.guild != GIL_NONE) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_lutero_snapper_info()
{
	AI_Output(other,self,"DIA_Lutero_Snapper_15_00");	//Szukasz czego� konkretnego?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_01");	//Tak, potrzebne mi s� pazury z�bacza.
	AI_Output(self,other,"DIA_Lutero_Snapper_13_02");	//Jednak nie chodzi mi o jakiekolwiek pazury. To musi by� co� specjalnego, szpony pot�nej bestii, kt�ra zabi�a dziesi�tki my�liwych, albo co� takiego.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_03");	//Gdzie mog� znale�� z�bacze?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_04");	//Kilka z nich zamieszkuje t� wysp�, ale wi�kszo�� grasuje w G�rniczej Dolinie.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_05");	//Co z tego b�d� mia�?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_06");	//Mog� dla ciebie znale�� kamie� runiczny.
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_07");	//Mog� da� ci pier�cie� nietykalno�ci.
	};
	AI_Output(other,self,"DIA_Lutero_Hello_15_08");	//Zobacz�, co si� da zrobi�.
	Log_CreateTopic(TOPIC_LUTERO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LUTERO,LOG_RUNNING);
	b_logentry(TOPIC_LUTERO,"Kupiec Lutero poszukuje pazur�w wyj�tkowo silnego z�bacza.");
	LUTERO_KRALLEN = LOG_RUNNING;
};


instance DIA_LUTERO_KRALLE(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_kralle_condition;
	information = dia_lutero_kralle_info;
	permanent = FALSE;
	description = "Mam tu dla ciebie pazury bardzo niezwyk�ego z�bacza.";
};


func int dia_lutero_kralle_condition()
{
	if((Npc_HasItems(other,itat_clawleader) >= 1) && Npc_KnowsInfo(other,dia_lutero_snapper))
	{
		return TRUE;
	};
};

func void dia_lutero_kralle_info()
{
	AI_Output(other,self,"DIA_Lutero_Kralle_15_00");	//Mam tu dla ciebie pazury bardzo niezwyk�ego z�bacza.
	LUTERO_KRALLEN = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Lutero_Kralle_13_01");	//Moi klienci si� uciesz�.
	b_giveinvitems(other,self,itat_clawleader,1);
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_02");	//Nie mam tutaj kamienia runicznego. Ale wiem, gdzie go mo�na znale��.
		AI_Output(self,other,"DIA_Lutero_Hello_13_03");	//W drodze z miasta do gospody, b�dziesz przechodzi� pod mostem.
		AI_Output(self,other,"DIA_Lutero_Hello_13_04");	//Jest tam jaskinia, w kt�rej jeden z moich przyjaci� ukry� skrzyni� z kamieniem runicznym. Oto klucz.
		b_giveinvitems(self,other,itke_rune_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_05");	//Oto pier�cie�, kt�ry ci obieca�em.
		b_giveinvitems(self,other,itri_prot_total_01,1);
	};
};


instance DIA_LUTERO_TRADE(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_trade_condition;
	information = dia_lutero_trade_info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
	trade = TRUE;
};


func int dia_lutero_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_lutero_hallo))
	{
		return TRUE;
	};
};

func void dia_lutero_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Poka� mi swoje towary.
};


instance DIA_LUTERO_PICKPOCKET(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 900;
	condition = dia_lutero_pickpocket_condition;
	information = dia_lutero_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_lutero_pickpocket_condition()
{
	return c_beklauen(58,65);
};

func void dia_lutero_pickpocket_info()
{
	Info_ClearChoices(dia_lutero_pickpocket);
	Info_AddChoice(dia_lutero_pickpocket,DIALOG_BACK,dia_lutero_pickpocket_back);
	Info_AddChoice(dia_lutero_pickpocket,DIALOG_PICKPOCKET,dia_lutero_pickpocket_doit);
};

func void dia_lutero_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lutero_pickpocket);
};

func void dia_lutero_pickpocket_back()
{
	Info_ClearChoices(dia_lutero_pickpocket);
};

