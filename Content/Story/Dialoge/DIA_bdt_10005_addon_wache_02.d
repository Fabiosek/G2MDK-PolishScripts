
instance DIA_ADDON_WACHE_02_EXIT(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 999;
	condition = dia_addon_wache_02_exit_condition;
	information = dia_addon_wache_02_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_wache_02_exit_condition()
{
	return TRUE;
};

func void dia_addon_wache_02_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_WACHE_02_PICKPOCKET(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 900;
	condition = dia_addon_wache_02_pickpocket_condition;
	information = dia_addon_wache_02_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_wache_02_pickpocket_condition()
{
	return c_beklauen(38,101);
};

func void dia_addon_wache_02_pickpocket_info()
{
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
	Info_AddChoice(dia_addon_wache_02_pickpocket,DIALOG_BACK,dia_addon_wache_02_pickpocket_back);
	Info_AddChoice(dia_addon_wache_02_pickpocket,DIALOG_PICKPOCKET,dia_addon_wache_02_pickpocket_doit);
};

func void dia_addon_wache_02_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
};

func void dia_addon_wache_02_pickpocket_back()
{
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
};


instance DIA_ADDON_WACHE_02_HI(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 2;
	condition = dia_addon_wache_02_hi_condition;
	information = dia_addon_wache_02_hi_info;
	permanent = FALSE;
	description = "Wszystko w porz�dku?";
};


func int dia_addon_wache_02_hi_condition()
{
	return TRUE;
};

func void dia_addon_wache_02_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_Hi_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Addon_Wache_02_Hi_13_01");	//Czekaj chwil� - czy ja ci� sk�d� nie znam?
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Wache_02_Hi_13_02");	//Hmm... Nie. To nie ty. Spadaj.
};


instance DIA_ADDON_WACHE_02_ATTENTAT(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 2;
	condition = dia_addon_wache_02_attentat_condition;
	information = dia_addon_wache_02_attentat_info;
	permanent = FALSE;
	description = "Co wiesz o pr�bie zab�jstwa?";
};


func int dia_addon_wache_02_attentat_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_wache_02_hi) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_wache_02_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_Attentat_15_00");	//Co wiesz o pr�bie zab�jstwa?
	AI_Output(self,other,"DIA_Addon_Wache_02_Attentat_13_01");	//Co o tym wiem? To ja po�ama�em kolesiowi nogi.
	AI_Output(self,other,"DIA_Addon_Wache_02_Attentat_13_02");	//I to samo zrobi� ka�demu, kto b�dzie pr�bowa� bru�dzi� Estebanowi...
};


instance DIA_ADDON_WACHE_02_PERM(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 99;
	condition = dia_addon_wache_02_perm_condition;
	information = dia_addon_wache_02_perm_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_addon_wache_02_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_wache_02_hi))
	{
		return TRUE;
	};
};

func void dia_addon_wache_02_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_perm_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Addon_Wache_02_perm_13_01");	//Spok�j.
	if(MIS_JUDAS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Wache_02_perm_13_02");	//Znajd� zdrajc� - my si� nim zajmiemy...
	};
};

