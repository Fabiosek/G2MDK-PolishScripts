
instance DIA_WOLF_DI_EXIT(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 999;
	condition = dia_wolf_di_exit_condition;
	information = dia_wolf_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_di_exit_condition()
{
	return TRUE;
};

func void dia_wolf_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_DI_HALLO(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 4;
	condition = dia_wolf_di_hallo_condition;
	information = dia_wolf_di_hallo_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_wolf_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};


var int dia_wolf_di_hallo_onetime;

func void dia_wolf_di_hallo_info()
{
	AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_00");	//Co s�ycha�?
	if((BENNET_ISONBOARD == LOG_SUCCESS) && (Npc_IsDead(bennet_di) == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_01");	//Cholera! Musia�e� bra� ze sob� Benneta?
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_02");	//Jaki� problem?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_03");	//Ech... nie, �aden. R�b, co masz do zrobienia i wyno�my si� st�d, dobra?
	}
	else if(DIA_WOLF_DI_HALLO_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_04");	//Ku�nia nie jest w najlepszym stanie, ale zrobi� co w mojej mocy.
		b_giveplayerxp(XP_AMBIENT);
		DIA_WOLF_DI_HALLO_ONETIME = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SmithDI");
	}
	else
	{
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_05");	//M�g�by� sporz�dzi� dla mnie now� zbroj�?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_06");	//Przykro mi, ale nie z tymi narz�dziami. Musisz poczeka�, a� wyl�dujemy na kontynencie.
	};
};


instance DIA_WOLF_DI_TRAINING(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 10;
	condition = dia_wolf_di_training_condition;
	information = dia_wolf_di_training_info;
	permanent = TRUE;
	description = "Naucz mnie czego� o walce na dystans.";
};


func int dia_wolf_di_training_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_wolf_di_training_info()
{
	AI_Output(other,self,"DIA_Wolf_DI_Training_15_00");	//Naucz mnie czego� o walce na dystans.
	AI_Output(self,other,"DIA_Wolf_DI_Training_08_01");	//A czego konkretnie?
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_bow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,90))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_1_08_00");	//W odr�nieniu od kuszy do pos�ugiwania si� �ukiem potrzeba du�o miejsca. Pami�taj, �eby w trakcie walki zachowa� odpowiedni� odleg�o�� od przeciwnika.
	};
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_bow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,90))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_5_08_00");	//Ci�ciwa musi si� prze�lizgn�� mi�dzy twoimi palcami. Zaciskaj�c kurczowo palce, wypaczysz kierunek lotu strza�y.
	};
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_crossbow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00");	//Strzelaj�c z kuszy, musisz pozostawa� w ca�kowitym bezruchu. Dlatego zawsze staraj si� powoli naciska� spust.
	};
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_crossbow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00");	//Sprytny strzelec zawsze wykorzystuje powiewy powietrza i stara si� nie strzela� pod wiatr.
	};
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_back()
{
	Info_ClearChoices(dia_wolf_di_training);
};


instance DIA_WOLF_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 2;
	condition = dia_wolf_di_undeaddragondead_condition;
	information = dia_wolf_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
};


func int dia_wolf_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_wolf_di_undeaddragondead_onetime;

func void dia_wolf_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_01");	//U mnie tak, a u ciebie? Nie by�o lekko, co?
	if(DIA_WOLF_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_02");	//Dok�d zamierzasz si� teraz uda�?
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_03");	//Gdziekolwiek, byle nie z powrotem. Mam ju� serdecznie do�� Khorinis.
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_04");	//Nie obchodzi mnie, dok�d pop�yniemy, byle jak najdalej st�d.
		DIA_WOLF_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_DI_PICKPOCKET(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 900;
	condition = dia_wolf_di_pickpocket_condition;
	information = dia_wolf_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_wolf_di_pickpocket_condition()
{
	return c_beklauen(32,45);
};

func void dia_wolf_di_pickpocket_info()
{
	Info_ClearChoices(dia_wolf_di_pickpocket);
	Info_AddChoice(dia_wolf_di_pickpocket,DIALOG_BACK,dia_wolf_di_pickpocket_back);
	Info_AddChoice(dia_wolf_di_pickpocket,DIALOG_PICKPOCKET,dia_wolf_di_pickpocket_doit);
};

func void dia_wolf_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wolf_di_pickpocket);
};

func void dia_wolf_di_pickpocket_back()
{
	Info_ClearChoices(dia_wolf_di_pickpocket);
};

