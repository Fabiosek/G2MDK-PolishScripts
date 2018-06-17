
instance DIA_SENGRATH_EXIT(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 999;
	condition = dia_sengrath_exit_condition;
	information = dia_sengrath_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sengrath_exit_condition()
{
	return TRUE;
};

func void dia_sengrath_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SENGRATH_HELLO(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 2;
	condition = dia_sengrath_hello_condition;
	information = dia_sengrath_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sengrath_hello_condition()
{
	return TRUE;
};

func void dia_sengrath_hello_info()
{
	AI_Output(self,other,"DIA_Sengrath_Hello_03_00");	//Wiedzia�em, wiedzia�em, �e komu� si� uda!
	AI_Output(self,other,"DIA_Sengrath_Hello_03_01");	//Przybywasz zza prze��czy? W takim razie naszemu pos�a�cowi uda�o si� przej��?
	AI_Output(other,self,"DIA_Sengrath_Hello_15_02");	//Nie, wasz pos�aniec poleg�. Przybywam tu z rozkazu Lorda Hagena.
	AI_Output(self,other,"DIA_Sengrath_Hello_03_03");	//Przekl�ci orkowie...
	AI_Output(self,other,"DIA_Sengrath_Hello_03_04");	//Kapitan Garond na pewno zechce z tob� porozmawia�. Znajdziesz go w wielkim budynku, chronionym przez dw�ch stra�nik�w.
};


instance DIA_SENGRATH_EQUIPMENT(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 2;
	condition = dia_sengrath_equipment_condition;
	information = dia_sengrath_equipment_info;
	permanent = FALSE;
	description = "Czy mog� uzupe�ni� tu gdzie� zapasy?";
};


func int dia_sengrath_equipment_condition()
{
	return TRUE;
};

func void dia_sengrath_equipment_info()
{
	AI_Output(other,self,"DIA_Sengrath_Equipment_15_00");	//Czy gdzie� tu mo�na uzupe�ni� zapasy?
	AI_Output(self,other,"DIA_Sengrath_Equipment_03_01");	//Wydawaniem broni zajmuje si� Tandor. Pozosta�e sprawy to dzia�ka ochmistrza Engora.
	AI_Output(other,self,"DIA_Sengrath_Equipment_15_02");	//A magiczne przedmioty?
	AI_Output(self,other,"DIA_Sengrath_Equipment_03_03");	//Mamy troch� magicznych zwoj�w. Je�li b�dziesz chcia� kilka z nich, zg�o� si� do mnie.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Sengrath sprzedaje w zamku magiczne zwoje.");
};


instance DIA_SENGRATH_PERM(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 2;
	condition = dia_sengrath_perm_condition;
	information = dia_sengrath_perm_info;
	permanent = FALSE;
	description = "Kto mo�e mnie czego� tutaj nauczy�?";
};


func int dia_sengrath_perm_condition()
{
	return TRUE;
};

func void dia_sengrath_perm_info()
{
	AI_Output(other,self,"DIA_Sengrath_Perm_15_00");	//Kto m�g�by mnie tu czego� nauczy�?
	if((other.guild == GIL_KDF) && (KAPITEL == 2))
	{
		AI_Output(self,other,"DIA_Sengrath_Perm_03_01");	//Pogadaj z Miltenem - jest tu jedynym magiem.
	}
	else
	{
		AI_Output(self,other,"DIA_Sengrath_Perm_03_02");	//Pom�w z Kerolothem. To on trenuje ch�opc�w w walce mieczem, mo�e i ciebie czego� nauczy.
		Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
		b_logentry(TOPIC_TEACHER_OC,"Keroloth udziela na zamku lekcji walki mieczem.");
	};
};


instance DIA_SENGRATH_SCROLLS(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 9;
	condition = dia_sengrath_scrolls_condition;
	information = dia_sengrath_scrolls_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka� mi, jakie zwoje oferujesz.";
};


func int dia_sengrath_scrolls_condition()
{
	if(Npc_KnowsInfo(other,dia_sengrath_equipment))
	{
		return TRUE;
	};
};

func void dia_sengrath_scrolls_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Sengrath_Scrolls_15_00");	//Poka� mi, jakie zwoje oferujesz.
};


instance DIA_SENGRATH_PICKPOCKET(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 900;
	condition = dia_sengrath_pickpocket_condition;
	information = dia_sengrath_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_sengrath_pickpocket_condition()
{
	return c_beklauen(32,35);
};

func void dia_sengrath_pickpocket_info()
{
	Info_ClearChoices(dia_sengrath_pickpocket);
	Info_AddChoice(dia_sengrath_pickpocket,DIALOG_BACK,dia_sengrath_pickpocket_back);
	Info_AddChoice(dia_sengrath_pickpocket,DIALOG_PICKPOCKET,dia_sengrath_pickpocket_doit);
};

func void dia_sengrath_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sengrath_pickpocket);
};

func void dia_sengrath_pickpocket_back()
{
	Info_ClearChoices(dia_sengrath_pickpocket);
};

