
instance DIA_TORLOF_DI_KAP3_EXIT(C_INFO)
{
	npc = sld_801_torlof_di;
	nr = 999;
	condition = dia_torlof_di_kap3_exit_condition;
	information = dia_torlof_di_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_di_kap3_exit_condition()
{
	return TRUE;
};

func void dia_torlof_di_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_DI_HALLO(C_INFO)
{
	npc = sld_801_torlof_di;
	nr = 4;
	condition = dia_torlof_di_hallo_condition;
	information = dia_torlof_di_hallo_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_torlof_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_torlof_di_hallo_info()
{
	AI_Output(other,self,"DIA_Torlof_DI_Hallo_15_00");	//Wszystko w porz¹dku?
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_DI_Hallo_01_01");	//Jak na razie... Ale to siê mo¿e szybko zmieniæ. Uwa¿aj na siebie.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_DI_Hallo_01_02");	//Jeœli ci przeklêci orkowie bêd¹ siê trzymaæ z dala, wszystko bêdzie w porz¹dku.
		b_startotherroutine(torlof_di,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_DI_TEACH(C_INFO)
{
	npc = sld_801_torlof_di;
	nr = 150;
	condition = dia_torlof_di_teach_condition;
	information = dia_torlof_di_teach_info;
	permanent = TRUE;
	description = "Pomó¿ mi popracowaæ nad moimi umiejêtnoœciami.";
};


func int dia_torlof_di_teach_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_torlof_di_teach_info()
{
	AI_Output(other,self,"DIA_Torlof_DI_Teach_15_00");	//Pomó¿ mi popracowaæ nad moimi umiejêtnoœciami.
	Info_ClearChoices(dia_torlof_di_teach);
	Info_AddChoice(dia_torlof_di_teach,DIALOG_BACK,dia_torlof_di_teach_back);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_di_teach_dex_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_di_teach_dex_5);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_di_teach_str_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_di_teach_str_5);
};

func void dia_torlof_di_teach_back()
{
	Info_ClearChoices(dia_torlof_di_teach);
};

func void dia_torlof_di_teach_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_torlof_di_teach);
	Info_AddChoice(dia_torlof_di_teach,DIALOG_BACK,dia_torlof_di_teach_back);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_di_teach_dex_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_di_teach_dex_5);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_di_teach_str_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_di_teach_str_5);
};

func void dia_torlof_di_teach_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_torlof_di_teach);
	Info_AddChoice(dia_torlof_di_teach,DIALOG_BACK,dia_torlof_di_teach_back);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_di_teach_dex_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_di_teach_dex_5);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_di_teach_str_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_di_teach_str_5);
};

func void dia_torlof_di_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_torlof_di_teach);
	Info_AddChoice(dia_torlof_di_teach,DIALOG_BACK,dia_torlof_di_teach_back);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_di_teach_dex_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_di_teach_dex_5);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_di_teach_str_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_di_teach_str_5);
};

func void dia_torlof_di_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_torlof_di_teach);
	Info_AddChoice(dia_torlof_di_teach,DIALOG_BACK,dia_torlof_di_teach_back);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_di_teach_dex_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_di_teach_dex_5);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_di_teach_str_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_di_teach_str_5);
};


instance DIA_TORLOF_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = sld_801_torlof_di;
	nr = 4;
	condition = dia_torlof_di_undeaddragondead_condition;
	information = dia_torlof_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Wróg zosta³ pokonany.";
};


func int dia_torlof_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_torlof_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Torlof_DI_UndeadDragonDead_15_00");	//Wróg zosta³ pokonany.
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_01_01");	//Wcale mnie to nie dziwi. To jak? Mo¿emy ju¿ odbijaæ od brzegu?
	Info_ClearChoices(dia_torlof_di_undeaddragondead);
	Info_AddChoice(dia_torlof_di_undeaddragondead,"Muszê jeszcze coœ za³atwiæ.",dia_torlof_di_undeaddragondead_moment);
	Info_AddChoice(dia_torlof_di_undeaddragondead,"Tak, to ju¿ koniec. ChodŸmy.",dia_torlof_di_undeaddragondead_over);
};

func void dia_torlof_di_undeaddragondead_moment()
{
	AI_Output(other,self,"DIA_Torlof_DI_UndeadDragonDead_moment_15_00");	//Muszê jeszcze coœ za³atwiæ.
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_moment_01_01");	//No to siê poœpiesz!
	AI_StopProcessInfos(self);
};

func void dia_torlof_di_undeaddragondead_over()
{
	AI_StopProcessInfos(self);
	b_extro_avi();
};


instance DIA_TORLOF_DI_PICKPOCKET(C_INFO)
{
	npc = sld_801_torlof_di;
	nr = 900;
	condition = dia_torlof_di_pickpocket_condition;
	information = dia_torlof_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_torlof_di_pickpocket_condition()
{
	return c_beklauen(76,120);
};

func void dia_torlof_di_pickpocket_info()
{
	Info_ClearChoices(dia_torlof_di_pickpocket);
	Info_AddChoice(dia_torlof_di_pickpocket,DIALOG_BACK,dia_torlof_di_pickpocket_back);
	Info_AddChoice(dia_torlof_di_pickpocket,DIALOG_PICKPOCKET,dia_torlof_di_pickpocket_doit);
};

func void dia_torlof_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_torlof_di_pickpocket);
};

func void dia_torlof_di_pickpocket_back()
{
	Info_ClearChoices(dia_torlof_di_pickpocket);
};

