
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
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_00");	//NIE bud� go!
	AI_Output(other,self,"DIA_Addon_10008_Bandit_Hi_15_01");	//Co?!
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_02");	//Dla swojego dobra trzymaj si� z daleka od Skinnera.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_03");	//Ten kole� jest nieprzewidywalny. Niedawno zabi� go�cia, kt�ry go obudzi�.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_04");	//Niech �pi. Tak b�dzie najlepiej dla nas wszystkich.
};


instance DIA_ADDON_10008_BANDIT_SOUP(C_INFO)
{
	npc = bdt_10008_addon_bandit;
	nr = 2;
	condition = dia_addon_10008_bandit_soup_condition;
	information = dia_addon_10008_bandit_soup_info;
	permanent = FALSE;
	description = "Jeste� kopaczem?";
};


func int dia_addon_10008_bandit_soup_condition()
{
	return TRUE;
};

func void dia_addon_10008_bandit_soup_info()
{
	AI_Output(other,self,"DIA_Addon_10008_Bandit_soup_15_00");	//Jeste� kopaczem?
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_01");	//To przez te spodnie? Nie, nosz� je, bo s� wygodne.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_02");	//Gotuj� gulasz. Masz, spr�buj, nabierzesz si�.
	b_giveinvitems(self,other,itfo_addon_meatsoup,1);
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_03");	//Trzeba zawsze �wiczy�, �eby nabra� si� - na zewn�trz czyha wiele niebezpiecze�stw.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_04");	//Je�li chcesz, mog� ci pom�c nabra� si�.
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Bandyta przy kotle mo�e pom�c mi odzyska� si�y.");
};


instance DIA_ADDON_10008_BANDIT_TEACH(C_INFO)
{
	npc = bdt_10008_addon_bandit;
	nr = 7;
	condition = dia_addon_10008_bandit_teach_condition;
	information = dia_addon_10008_bandit_teach_info;
	permanent = TRUE;
	description = "Chc� by� silniejszy.";
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
	AI_Output(other,self,"DIA_Addon_10008_Bandit_Teach_15_00");	//Chc� by� silniejszy.
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

