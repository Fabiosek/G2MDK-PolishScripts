
instance DIA_ADDON_MYXIR_CITY_EXIT(C_INFO)
{
	npc = kdw_140300_addon_myxir_city;
	nr = 999;
	condition = dia_addon_myxir_city_exit_condition;
	information = dia_addon_myxir_city_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_myxir_city_exit_condition()
{
	return TRUE;
};

func void dia_addon_myxir_city_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MYXIR_CITY_HELLOCITY(C_INFO)
{
	npc = kdw_140300_addon_myxir_city;
	nr = 5;
	condition = dia_addon_myxir_city_hellocity_condition;
	information = dia_addon_myxir_city_hellocity_info;
	permanent = TRUE;
	description = "Zostaniesz w mieœcie?";
};


func int dia_addon_myxir_city_hellocity_condition()
{
	return TRUE;
};


var int dia_addon_myxir_city_hellocity_onetime;

func void dia_addon_myxir_city_hellocity_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_00");	//Zostaniesz w mieœcie?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_01");	//Jeden z nas musi TU zostaæ, jeœli Vatras opuœci miasto.
	VATRASABLOESEISTDA = TRUE;
	if((RAVENISDEAD == TRUE) && (DIA_ADDON_MYXIR_CITY_HELLOCITY_ONETIME == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_02");	//Chcê ci powiedzieæ jeszcze jedno.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_03");	//To, czego dokona³eœ w Jarkendarze, to by³ naprawdê bohaterski wyczyn.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_04");	//Niestety, nie skoñczy³em jeszcze moich zadañ w Khorinis.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_05");	//Jestem pewien, ¿e sobie poradzisz, Stra¿niku.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_06");	//Zobaczymy.
		DIA_ADDON_MYXIR_CITY_HELLOCITY_ONETIME = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	};
};


instance DIA_ADDON_MYXIR_CITY_TEACH(C_INFO)
{
	npc = kdw_140300_addon_myxir_city;
	nr = 90;
	condition = dia_addon_myxir_city_teach_condition;
	information = dia_addon_myxir_city_teach_info;
	permanent = TRUE;
	description = "Naucz mnie tego dziwnego jêzyka.";
};


var int dia_addon_myxir_city_teach_noperm;
var int dia_addon_myxir_city_teach_onetime;

func int dia_addon_myxir_city_teach_condition()
{
	if((MYXIR_ADDON_TEACHPLAYER == TRUE) && (DIA_ADDON_MYXIR_CITY_TEACH_NOPERM == FALSE) && (DIA_ADDON_MYXIR_TEACH_NOPERM == FALSE) && (DIA_ADDON_MYXIR_ADW_TEACH_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_city_teach_info()
{
	b_dia_addon_myxir_teachrequest();
	if(DIA_ADDON_MYXIR_CITY_TEACH_ONETIME == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
		b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_MYXIRTEACH);
		DIA_ADDON_MYXIR_CITY_TEACH_ONETIME = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(dia_addon_myxir_city_teach);
		Info_AddChoice(dia_addon_myxir_city_teach,DIALOG_BACK,dia_addon_myxir_city_teach_back);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		b_dia_addon_myxir_teachl1();
		Info_AddChoice(dia_addon_myxir_city_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_1,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),dia_addon_myxir_city_teach_language_1);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		b_dia_addon_myxir_teachl2();
		Info_AddChoice(dia_addon_myxir_city_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_2,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),dia_addon_myxir_city_teach_language_2);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		b_dia_addon_myxir_teachl3();
		Info_AddChoice(dia_addon_myxir_city_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_3,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),dia_addon_myxir_city_teach_language_3);
	}
	else
	{
		b_dia_addon_myxir_teachnomore();
		DIA_ADDON_MYXIR_CITY_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_myxir_city_teach_language_x()
{
	b_dia_addon_myxir_teach_language_x();
};

func void dia_addon_myxir_city_teach_back()
{
	Info_ClearChoices(dia_addon_myxir_city_teach);
};

func void dia_addon_myxir_city_teach_language_1()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_1))
	{
		dia_addon_myxir_city_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_city_teach);
};

func void dia_addon_myxir_city_teach_language_2()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_2))
	{
		dia_addon_myxir_city_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_city_teach);
};

func void dia_addon_myxir_city_teach_language_3()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_3))
	{
		dia_addon_myxir_city_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_city_teach);
};

