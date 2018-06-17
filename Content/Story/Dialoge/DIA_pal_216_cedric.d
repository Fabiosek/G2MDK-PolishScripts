
instance DIA_CEDRIC_EXIT(C_INFO)
{
	npc = pal_216_cedric;
	nr = 999;
	condition = dia_cedric_exit_condition;
	information = dia_cedric_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cedric_exit_condition()
{
	return TRUE;
};

func void dia_cedric_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CEDRIC_HALLO(C_INFO)
{
	npc = pal_216_cedric;
	nr = 2;
	condition = dia_cedric_hallo_condition;
	information = dia_cedric_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cedric_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_cedric_hallo_info()
{
	AI_Output(self,other,"DIA_Cedric_Hallo_12_00");	//Jestem Cedrik, mistrz miecza i kr�lewski paladyn.
};


instance DIA_CEDRIC_CANTEACH(C_INFO)
{
	npc = pal_216_cedric;
	nr = 5;
	condition = dia_cedric_canteach_condition;
	information = dia_cedric_canteach_info;
	permanent = TRUE;
	description = "Czy mo�esz mnie wyszkoli�?";
};


func int dia_cedric_canteach_condition()
{
	if(CEDRIC_TEACH1H == FALSE)
	{
		return TRUE;
	};
};

func void dia_cedric_canteach_info()
{
	AI_Output(other,self,"DIA_Cedric_CanTeach_15_00");	//Mo�esz mnie wyszkoli�?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Cedric_CanTeach_12_01");	//Mog� ci� nauczy� walki broniami jednor�cznymi.
		CEDRIC_TEACH1H = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladyn Cedrik mo�e mnie nauczy� walki or�em jednor�cznym.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cedric_CanTeach_12_02");	//Szkol� tylko paladyn�w.
	};
};


instance DIA_CEDRIC_TEACH(C_INFO)
{
	npc = pal_216_cedric;
	nr = 100;
	condition = dia_cedric_teach_condition;
	information = dia_cedric_teach_info;
	permanent = TRUE;
	description = "Chc� si� wyszkoli�.";
};


var int dia_cedric_teach_permanent;

func int dia_cedric_teach_condition()
{
	if((CEDRIC_TEACH1H == TRUE) && (DIA_CEDRIC_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_cedric_teach_info()
{
	AI_Output(other,self,"DIA_Cedric_Teach_15_00");	//Chc� si� wyszkoli�.
	if(other.hitchance[NPC_TALENT_1H] >= 90)
	{
		AI_Output(self,other,"DIA_DIA_Cedric_Teach_12_01");	//Wiesz ju� wszystko o walce mieczem. Nie potrafi� ci przekaza� nic wi�cej.
	}
	else
	{
		Info_ClearChoices(dia_cedric_teach);
		Info_AddChoice(dia_cedric_teach,DIALOG_BACK,dia_cedric_teach_back);
		Info_AddChoice(dia_cedric_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cedric_teach_2h_1);
		Info_AddChoice(dia_cedric_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cedric_teach_2h_5);
	};
};

func void dia_cedric_teach_back()
{
	Info_ClearChoices(dia_cedric_teach);
};

func void dia_cedric_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,90);
	Info_ClearChoices(dia_cedric_teach);
	Info_AddChoice(dia_cedric_teach,DIALOG_BACK,dia_cedric_teach_back);
	Info_AddChoice(dia_cedric_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cedric_teach_2h_1);
	Info_AddChoice(dia_cedric_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cedric_teach_2h_5);
};

func void dia_cedric_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,90);
	Info_ClearChoices(dia_cedric_teach);
	Info_AddChoice(dia_cedric_teach,DIALOG_BACK,dia_cedric_teach_back);
	Info_AddChoice(dia_cedric_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cedric_teach_2h_1);
	Info_AddChoice(dia_cedric_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cedric_teach_2h_5);
};


instance DIA_CEDRIC_PICKPOCKET(C_INFO)
{
	npc = pal_216_cedric;
	nr = 900;
	condition = dia_cedric_pickpocket_condition;
	information = dia_cedric_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_cedric_pickpocket_condition()
{
	return c_beklauen(37,55);
};

func void dia_cedric_pickpocket_info()
{
	Info_ClearChoices(dia_cedric_pickpocket);
	Info_AddChoice(dia_cedric_pickpocket,DIALOG_BACK,dia_cedric_pickpocket_back);
	Info_AddChoice(dia_cedric_pickpocket,DIALOG_PICKPOCKET,dia_cedric_pickpocket_doit);
};

func void dia_cedric_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cedric_pickpocket);
};

func void dia_cedric_pickpocket_back()
{
	Info_ClearChoices(dia_cedric_pickpocket);
};

