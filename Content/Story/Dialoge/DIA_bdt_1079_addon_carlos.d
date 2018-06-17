
instance DIA_ADDON_CARLOS_EXIT(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 999;
	condition = dia_addon_carlos_exit_condition;
	information = dia_addon_carlos_exit_info;
	permanent = TRUE;
	description = "Do zobaczenia.";
};


func int dia_addon_carlos_exit_condition()
{
	return TRUE;
};

func void dia_addon_carlos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CARLOS_PICKPOCKET(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 900;
	condition = dia_addon_carlos_pickpocket_condition;
	information = dia_addon_carlos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_carlos_pickpocket_condition()
{
	return c_beklauen(71,85);
};

func void dia_addon_carlos_pickpocket_info()
{
	Info_ClearChoices(dia_addon_carlos_pickpocket);
	Info_AddChoice(dia_addon_carlos_pickpocket,DIALOG_BACK,dia_addon_carlos_pickpocket_back);
	Info_AddChoice(dia_addon_carlos_pickpocket,DIALOG_PICKPOCKET,dia_addon_carlos_pickpocket_doit);
};

func void dia_addon_carlos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_carlos_pickpocket);
};

func void dia_addon_carlos_pickpocket_back()
{
	Info_ClearChoices(dia_addon_carlos_pickpocket);
};


instance DIA_ADDON_CARLOS_HI(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 1;
	condition = dia_addon_carlos_hi_condition;
	information = dia_addon_carlos_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_carlos_hi_condition()
{
	if(Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_carlos_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Carlos_HI_12_00");	//Hej, to ty jesteœ tym nowym, który pobi³ Franka?
	Info_ClearChoices(dia_addon_carlos_hi);
	Info_AddChoice(dia_addon_carlos_hi,"Co? Ja? Nie!",dia_addon_carlos_hi_no);
	Info_AddChoice(dia_addon_carlos_hi,"Tak, o co chodzi?",dia_addon_carlos_hi_yes);
};

func void dia_addon_carlos_hi_yes()
{
	AI_Output(other,self,"DIA_Addon_Carlos_HI_Yes_15_00");	//Tak, o co chodzi?
	AI_Output(self,other,"DIA_Addon_Carlos_HI_Yes_12_01");	//Bo teraz ja muszê odwalaæ jego robotê. Wielkie dziêki!
	Info_ClearChoices(dia_addon_carlos_hi);
};

func void dia_addon_carlos_hi_no()
{
	AI_Output(other,self,"DIA_Addon_Carlos_HI_No_15_00");	//Co? Ja? Nie!
	AI_Output(self,other,"DIA_Addon_Carlos_HI_No_12_01");	//Ach, rozumiem. Nie chcia³em przeszkadzaæ.
	Info_ClearChoices(dia_addon_carlos_hi);
};


instance DIA_ADDON_CARLOS_ATTENTAT(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 2;
	condition = dia_addon_carlos_attentat_condition;
	information = dia_addon_carlos_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_carlos_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_carlos_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_00");	//Thorus kaza³ mi wpuœciæ do obozu kogoœ nowego, gdy zabójca bêdzie ju¿ gryz³ ziemiê.
	if(LOGAN_INSIDE == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_01");	//A Franko przys³a³ Logana.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_02");	//A Franko przys³a³ nowych kolesi.
	};
	AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_03");	//Hej, ja tylko wykonujê rozkazy Thorusa. Nie wiem nic o samej próbie zabójstwa.
};


instance DIA_ADDON_CARLOS_PERM(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 3;
	condition = dia_addon_carlos_perm_condition;
	information = dia_addon_carlos_perm_info;
	permanent = TRUE;
	description = "Jak to jest byæ szefem myœliwych?";
};


func int dia_addon_carlos_perm_condition()
{
	return TRUE;
};

func void dia_addon_carlos_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Carlos_PERM_15_00");	//Jak to jest byæ szefem myœliwych?
	AI_Output(self,other,"DIA_Addon_Carlos_PERM_12_00");	//Nie przypominaj mi o tym!
	AI_StopProcessInfos(self);
};

