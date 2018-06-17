
instance DIA_JORGEN_DI_KAP3_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen_di;
	nr = 999;
	condition = dia_jorgen_di_kap3_exit_condition;
	information = dia_jorgen_di_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_di_kap3_exit_condition()
{
	return TRUE;
};

func void dia_jorgen_di_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_DI_HALLO(C_INFO)
{
	npc = vlk_4250_jorgen_di;
	nr = 4;
	condition = dia_jorgen_di_hallo_condition;
	information = dia_jorgen_di_hallo_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_jorgen_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_jorgen_di_hallo_info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_Hallo_15_00");	//Wszystko w porz¹dku?
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_01");	//Jasne. Przynajmniej tak d³ugo, jak te potwory trzymaj¹ siê od nas z dala...
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_02");	//Nastêpnego ataku orków mo¿emy nie przetrzymaæ, wiêc lepiej siê poœpiesz. Czas siê st¹d wynosiæ!
		b_startotherroutine(jorgen_di,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = vlk_4250_jorgen_di;
	nr = 4;
	condition = dia_jorgen_di_undeaddragondead_condition;
	information = dia_jorgen_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Nieprzyjaciel nie ¿yje.";
};


func int dia_jorgen_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_jorgen_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_15_00");	//Nieprzyjaciel nie ¿yje.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_07_01");	//To œwietna wiadomoœæ. Czyli sprawa jest ju¿ za³atwiona?
	Info_ClearChoices(dia_jorgen_di_undeaddragondead);
	Info_AddChoice(dia_jorgen_di_undeaddragondead,"Jeszcze chwila.",dia_jorgen_di_undeaddragondead_moment);
	Info_AddChoice(dia_jorgen_di_undeaddragondead,"Tak, to jest to. ChodŸmy.",dia_jorgen_di_undeaddragondead_over);
};

func void dia_jorgen_di_undeaddragondead_moment()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_moment_15_00");	//Jeszcze chwila. Muszê siê najpierw czymœ zaj¹æ.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_moment_07_01");	//Dobra. Tylko siê poœpiesz!
	AI_StopProcessInfos(self);
};

func void dia_jorgen_di_undeaddragondead_over()
{
	AI_StopProcessInfos(self);
	b_extro_avi();
};

