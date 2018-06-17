
instance DIA_ADDON_WACHE_01_EXIT(C_INFO)
{
	npc = bdt_1081_addon_wache_01;
	nr = 999;
	condition = dia_addon_wache_01_exit_condition;
	information = dia_addon_wache_01_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_wache_01_exit_condition()
{
	return TRUE;
};

func void dia_addon_wache_01_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_WACHE_01_PICKPOCKET(C_INFO)
{
	npc = bdt_1081_addon_wache_01;
	nr = 900;
	condition = dia_addon_wache_01_pickpocket_condition;
	information = dia_addon_wache_01_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_wache_01_pickpocket_condition()
{
	return c_beklauen(38,99);
};

func void dia_addon_wache_01_pickpocket_info()
{
	Info_ClearChoices(dia_addon_wache_01_pickpocket);
	Info_AddChoice(dia_addon_wache_01_pickpocket,DIALOG_BACK,dia_addon_wache_01_pickpocket_back);
	Info_AddChoice(dia_addon_wache_01_pickpocket,DIALOG_PICKPOCKET,dia_addon_wache_01_pickpocket_doit);
};

func void dia_addon_wache_01_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_wache_01_pickpocket);
};

func void dia_addon_wache_01_pickpocket_back()
{
	Info_ClearChoices(dia_addon_wache_01_pickpocket);
};


instance DIA_ADDON_WACHE_01_HI(C_INFO)
{
	npc = bdt_1081_addon_wache_01;
	nr = 2;
	condition = dia_addon_wache_01_hi_condition;
	information = dia_addon_wache_01_hi_info;
	permanent = TRUE;
	description = "W porz¹dku?";
};


func int dia_addon_wache_01_hi_condition()
{
	return TRUE;
};

func void dia_addon_wache_01_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_01_Hi_15_00");	//W porz¹dku?
	AI_Output(self,other,"DIA_Addon_Wache_01_Hi_04_01");	//Dotknij tylko Estebana, a zginiesz.
	AI_StopProcessInfos(self);
};

