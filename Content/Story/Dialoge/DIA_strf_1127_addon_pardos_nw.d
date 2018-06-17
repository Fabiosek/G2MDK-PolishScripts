
instance DIA_ADDON_PARDOS_NW_EXIT(C_INFO)
{
	npc = strf_1127_addon_pardos_nw;
	nr = 999;
	condition = dia_addon_pardos_nw_exit_condition;
	information = dia_addon_pardos_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_pardos_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_pardos_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PARDOS_NW_HI(C_INFO)
{
	npc = strf_1127_addon_pardos_nw;
	nr = 2;
	condition = dia_addon_pardos_nw_hi_condition;
	information = dia_addon_pardos_nw_hi_info;
	permanent = TRUE;
	description = "Dobrze siê czujesz?";
};


func int dia_addon_pardos_nw_hi_condition()
{
	return TRUE;
};

func void dia_addon_pardos_nw_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_NW_Hi_15_00");	//Dobrze siê czujesz?
	AI_Output(self,other,"DIA_Addon_Pardos_NW_Hi_03_01");	//Ej, wybawco... Jeszcze raz dziêkujê. Teraz mogê ca³y dzieñ odpoczywaæ.
	AI_Output(other,self,"DIA_Addon_Pardos_NW_Hi_15_02");	//Widzê. No có¿, na mnie ju¿ czas.
};


instance DIA_ADDON_PARDOS_NW_PICKPOCKET(C_INFO)
{
	npc = strf_1127_addon_pardos_nw;
	nr = 900;
	condition = dia_addon_pardos_nw_pickpocket_condition;
	information = dia_addon_pardos_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_pardos_nw_pickpocket_condition()
{
	return c_beklauen(85,10);
};

func void dia_addon_pardos_nw_pickpocket_info()
{
	Info_ClearChoices(dia_addon_pardos_nw_pickpocket);
	Info_AddChoice(dia_addon_pardos_nw_pickpocket,DIALOG_BACK,dia_addon_pardos_nw_pickpocket_back);
	Info_AddChoice(dia_addon_pardos_nw_pickpocket,DIALOG_PICKPOCKET,dia_addon_pardos_nw_pickpocket_doit);
};

func void dia_addon_pardos_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_pardos_nw_pickpocket);
};

func void dia_addon_pardos_nw_pickpocket_back()
{
	Info_ClearChoices(dia_addon_pardos_nw_pickpocket);
};

