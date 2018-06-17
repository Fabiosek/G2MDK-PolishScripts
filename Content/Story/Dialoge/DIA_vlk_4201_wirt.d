
instance DIA_WIRT_EXIT(C_INFO)
{
	npc = vlk_4201_wirt;
	nr = 999;
	condition = dia_wirt_exit_condition;
	information = dia_wirt_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wirt_exit_condition()
{
	return TRUE;
};

func void dia_wirt_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WIRT_PICKPOCKET(C_INFO)
{
	npc = vlk_4201_wirt;
	nr = 900;
	condition = dia_wirt_pickpocket_condition;
	information = dia_wirt_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_wirt_pickpocket_condition()
{
	return c_beklauen(60,65);
};

func void dia_wirt_pickpocket_info()
{
	Info_ClearChoices(dia_wirt_pickpocket);
	Info_AddChoice(dia_wirt_pickpocket,DIALOG_BACK,dia_wirt_pickpocket_back);
	Info_AddChoice(dia_wirt_pickpocket,DIALOG_PICKPOCKET,dia_wirt_pickpocket_doit);
};

func void dia_wirt_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wirt_pickpocket);
};

func void dia_wirt_pickpocket_back()
{
	Info_ClearChoices(dia_wirt_pickpocket);
};


instance DIA_WIRT_HALLO(C_INFO)
{
	npc = vlk_4201_wirt;
	nr = 2;
	condition = dia_wirt_hallo_condition;
	information = dia_wirt_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_wirt_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_wirt_hallo_info()
{
	var int randy;
	randy = Hlp_Random(2);
	AI_Output(self,other,"DIA_Wirt_Hallo_14_00");	//Hej, podejd� bli�ej. Zr�b sobie przerw� i napij si� ch�odnego piwka.
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_01");	//Lord Andre stawia kilka bary�ek przedniego piwa.
		AI_StopProcessInfos(self);
	}
	else if(randy == 0)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_02");	//Nic tak nie orze�wia po pracy jak kufelek zimnego, z�ocistego piwa.
		AI_StopProcessInfos(self);
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_03");	//Paladyni wszystkim si� zajm�. Nalej sobie jeszcze jednego i baw si� dobrze.
		b_giveinvitems(self,other,itfo_beer,1);
		AI_StopProcessInfos(self);
	}
	else if(randy == 2)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_04");	//Gadaj, co chcesz, o Khorinis, ale lepszego 'Mrocznego Paladyna' pr�no by szuka� w ca�ej Myrtanie.
		AI_StopProcessInfos(self);
	};
};

