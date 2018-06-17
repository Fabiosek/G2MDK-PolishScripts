
instance DIA_ADDON_SKINNER_EXIT(C_INFO)
{
	npc = bdt_1082_addon_skinner;
	nr = 999;
	condition = dia_addon_skinner_exit_condition;
	information = dia_addon_skinner_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_skinner_exit_condition()
{
	return TRUE;
};

func void dia_addon_skinner_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKINNER_PICKPOCKET(C_INFO)
{
	npc = bdt_1082_addon_skinner;
	nr = 900;
	condition = dia_addon_skinner_pickpocket_condition;
	information = dia_addon_skinner_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_skinner_pickpocket_condition()
{
	return c_beklauen(100,200);
};

func void dia_addon_skinner_pickpocket_info()
{
	Info_ClearChoices(dia_addon_skinner_pickpocket);
	Info_AddChoice(dia_addon_skinner_pickpocket,DIALOG_BACK,dia_addon_skinner_pickpocket_back);
	Info_AddChoice(dia_addon_skinner_pickpocket,DIALOG_PICKPOCKET,dia_addon_skinner_pickpocket_doit);
};

func void dia_addon_skinner_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
};

func void dia_addon_skinner_pickpocket_back()
{
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
	b_say(self,self,"$AWAKE");
};


instance DIA_ADDON_SKINNER_HI(C_INFO)
{
	npc = bdt_1082_addon_skinner;
	nr = 2;
	condition = dia_addon_skinner_hi_condition;
	information = dia_addon_skinner_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_skinner_hi_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_skinner_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_00");	//Po co mnie obudzi³eœ? Za³o¿ê siê, ¿e nawet nie wiesz....
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_01");	//Nie, nie odpowiadaj. Za póŸno na wymówki.
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_02");	//Masz teraz dwie mo¿liwoœci. Walczyæ ze mn¹ i moj¹ Betty... albo spróbowaæ ucieczki.
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_03");	//Ja na twoim miejscu próbowa³bym uciekaæ...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_SKINNER_ATTENTAT(C_INFO)
{
	npc = bdt_1082_addon_skinner;
	nr = 9;
	condition = dia_addon_skinner_attentat_condition;
	information = dia_addon_skinner_attentat_info;
	permanent = FALSE;
	description = "A co do próby zabójstwa...";
};


func int dia_addon_skinner_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_skinner_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Skinner_Attentat_15_00");	//A co do próby zabójstwa...
	AI_Output(self,other,"DIA_Addon_Skinner_Attentat_08_01");	//Czego ode mnie chcesz?
	Info_ClearChoices(dia_addon_skinner_attentat);
	Info_AddChoice(dia_addon_skinner_attentat,"Chcê siê pozbyæ Estebana.",dia_addon_skinner_attentat_addon_contra);
	Info_AddChoice(dia_addon_skinner_attentat,"Zabijê zdrajcê.",dia_addon_skinner_attentat_addon_pro);
};

func void dia_addon_skinner_attentat_addon_contra()
{
	AI_Output(other,self,"DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_15_00");	//Chcê siê pozbyæ Estebana.
	AI_Output(self,other,"DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_08_01");	//Znakomicie.
	JUDAS_COUNTER = JUDAS_COUNTER + 1;
	Info_ClearChoices(dia_addon_skinner_attentat);
};

func void dia_addon_skinner_attentat_addon_pro()
{
	AI_Output(other,self,"DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_15_00");	//Zabijê zdrajcê.
	AI_Output(self,other,"DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_08_01");	//Cholera.
	Info_ClearChoices(dia_addon_skinner_attentat);
};

