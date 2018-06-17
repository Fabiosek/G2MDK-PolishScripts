
instance DIA_ADDON_TELBOR_NW_EXIT(C_INFO)
{
	npc = strf_1126_addon_telbor_nw;
	nr = 999;
	condition = dia_addon_telbor_nw_exit_condition;
	information = dia_addon_telbor_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_telbor_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_telbor_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TELBOR_NW_PICKPOCKET(C_INFO)
{
	npc = strf_1126_addon_telbor_nw;
	nr = 900;
	condition = dia_addon_telbor_nw_pickpocket_condition;
	information = dia_addon_telbor_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_telbor_nw_pickpocket_condition()
{
	return c_beklauen(60,55);
};

func void dia_addon_telbor_nw_pickpocket_info()
{
	Info_ClearChoices(dia_addon_telbor_nw_pickpocket);
	Info_AddChoice(dia_addon_telbor_nw_pickpocket,DIALOG_BACK,dia_addon_telbor_nw_pickpocket_back);
	Info_AddChoice(dia_addon_telbor_nw_pickpocket,DIALOG_PICKPOCKET,dia_addon_telbor_nw_pickpocket_doit);
};

func void dia_addon_telbor_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_telbor_nw_pickpocket);
};

func void dia_addon_telbor_nw_pickpocket_back()
{
	Info_ClearChoices(dia_addon_telbor_nw_pickpocket);
};


instance DIA_ADDON_TELBOR_NW_HI(C_INFO)
{
	npc = strf_1126_addon_telbor_nw;
	nr = 2;
	condition = dia_addon_telbor_nw_hi_condition;
	information = dia_addon_telbor_nw_hi_info;
	permanent = FALSE;
	description = "Wracasz do pracy na polu?";
};


func int dia_addon_telbor_nw_hi_condition()
{
	return TRUE;
};

func void dia_addon_telbor_nw_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Telbor_NW_Hi_15_00");	//Z powrotem na pole, co?
	AI_Output(self,other,"DIA_Addon_Telbor_NW_Hi_12_01");	//Mój wybawca, niech mnie kule bij¹! Tak, wracam zmagaæ siê z codziennym trudem.
	if(!Npc_IsDead(egill) && !Npc_IsDead(ehnim))
	{
		AI_Output(self,other,"DIA_Addon_Telbor_NW_Hi_12_02");	//I z tymi dwoma kopniêtymi braæmi. Nawet bandyci nie byli tak denerwuj¹cy.
	};
};

