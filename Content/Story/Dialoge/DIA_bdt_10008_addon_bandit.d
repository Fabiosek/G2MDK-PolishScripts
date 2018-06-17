
instance ADDON_10008_BANDIT_EXIT(C_INFO)
{
	npc = bdt_10008_addon_bandit;
	nr = 999;
	condition = addon_10008_bandit_exit_condition;
	information = addon_10008_bandit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int addon_10008_bandit_exit_condition()
{
	return TRUE;
};

func void addon_10008_bandit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_10008_BANDIT_PICKPOCKET(C_INFO)
{
	npc = bdt_10008_addon_bandit;
	nr = 900;
	condition = dia_addon_10008_bandit_pickpocket_condition;
	information = dia_addon_10008_bandit_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_10008_bandit_pickpocket_condition()
{
	return c_beklauen(55,99);
};

func void dia_addon_10008_bandit_pickpocket_info()
{
	Info_ClearChoices(dia_addon_10008_bandit_pickpocket);
	Info_AddChoice(dia_addon_10008_bandit_pickpocket,DIALOG_BACK,dia_addon_10008_bandit_pickpocket_back);
	Info_AddChoice(dia_addon_10008_bandit_pickpocket,DIALOG_PICKPOCKET,dia_addon_10008_bandit_pickpocket_doit);
};

func void dia_addon_10008_bandit_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_10008_bandit_pickpocket);
};

func void dia_addon_10008_bandit_pickpocket_back()
{
	Info_ClearChoices(dia_addon_10008_bandit_pickpocket);
};


instance DIA_ADDON_10008_BANDIT_HI(C_INFO)
{
	npc = bdt_10008_addon_bandit;
	nr = 2;
	condition = dia_addon_10008_bandit_hi_condition;
	information = dia_addon_10008_bandit_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_10008_bandit_hi_condition()
{
	if((Npc_GetDistToNpc(other,skinner) <= 600) && !Npc_IsDead(skinner) && (skinner.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_10008_bandit_hi_info()
{
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_00");	//NIE budŸ go!
	AI_Output(other,self,"DIA_Addon_10008_Bandit_Hi_15_01");	//Co?!
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_02");	//Dla swojego dobra trzymaj siê z daleka od Skinnera.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_03");	//Ten koleœ jest nieprzewidywalny. Niedawno zabi³ goœcia, który go obudzi³.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_04");	//Niech œpi. Tak bêdzie najlepiej dla nas wszystkich.
};


instance DIA_ADDON_10008_BANDIT_SOUP(C_INFO)
{
	npc = bdt_10008_addon_bandit;
	nr = 2;
	condition = dia_addon_10008_bandit_soup_condition;
	information = dia_addon_10008_bandit_soup_info;
	permanent = FALSE;
	description = "Jesteœ kopaczem?";
};


func int dia_addon_10008_bandit_soup_condition()
{
	return TRUE;
};

func void dia_addon_10008_bandit_soup_info()
{
	AI_Output(other,self,"DIA_Addon_10008_Bandit_soup_15_00");	//Jesteœ kopaczem?
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_01");	//To przez te spodnie? Nie, noszê je, bo s¹ wygodne.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_02");	//Gotujê gulasz. Masz, spróbuj, nabierzesz si³.
	b_giveinvitems(self,other,itfo_addon_meatsoup,1);
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_03");	//Trzeba zawsze æwiczyæ, ¿eby nabraæ si³ - na zewn¹trz czyha wiele niebezpieczeñstw.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_04");	//Jeœli chcesz, mogê ci pomóc nabraæ si³.
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Bandyta przy kotle mo¿e pomóc mi odzyskaæ si³y.");
};


instance DIA_ADDON_10008_BANDIT_TEACH(C_INFO)
{
	npc = bdt_10008_addon_bandit;
	nr = 7;
	condition = dia_addon_10008_bandit_teach_condition;
	information = dia_addon_10008_bandit_teach_info;
	permanent = TRUE;
	description = "Chcê byæ silniejszy.";
};


func int dia_addon_10008_bandit_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_10008_bandit_soup))
	{
		return TRUE;
	};
};

func void dia_addon_10008_bandit_teach_info()
{
	AI_Output(other,self,"DIA_Addon_10008_Bandit_Teach_15_00");	//Chcê byæ silniejszy.
	Info_ClearChoices(dia_addon_10008_bandit_teach);
	Info_AddChoice(dia_addon_10008_bandit_teach,DIALOG_BACK,dia_addon_10008_bandit_teach_back);
	Info_AddChoice(dia_addon_10008_bandit_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_10008_bandit_teach_str_1);
	Info_AddChoice(dia_addon_10008_bandit_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_10008_bandit_teach_str_5);
};

func void dia_addon_10008_bandit_teach_back()
{
	Info_ClearChoices(dia_addon_10008_bandit_teach);
};

func void dia_addon_10008_bandit_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_addon_10008_bandit_teach);
	Info_AddChoice(dia_addon_10008_bandit_teach,DIALOG_BACK,dia_addon_10008_bandit_teach_back);
	Info_AddChoice(dia_addon_10008_bandit_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_10008_bandit_teach_str_1);
	Info_AddChoice(dia_addon_10008_bandit_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_10008_bandit_teach_str_5);
};

func void dia_addon_10008_bandit_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_addon_10008_bandit_teach);
	Info_AddChoice(dia_addon_10008_bandit_teach,DIALOG_BACK,dia_addon_10008_bandit_teach_back);
	Info_AddChoice(dia_addon_10008_bandit_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_10008_bandit_teach_str_1);
	Info_AddChoice(dia_addon_10008_bandit_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_10008_bandit_teach_str_5);
};

