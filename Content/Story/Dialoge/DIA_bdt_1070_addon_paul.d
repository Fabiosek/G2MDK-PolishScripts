
instance DIA_ADDON_PAUL_EXIT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 999;
	condition = dia_addon_paul_exit_condition;
	information = dia_addon_paul_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_paul_exit_condition()
{
	return TRUE;
};

func void dia_addon_paul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PAUL_PICKPOCKET(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 900;
	condition = dia_addon_paul_pickpocket_condition;
	information = dia_addon_paul_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_paul_pickpocket_condition()
{
	return c_beklauen(22,19);
};

func void dia_addon_paul_pickpocket_info()
{
	Info_ClearChoices(dia_addon_paul_pickpocket);
	Info_AddChoice(dia_addon_paul_pickpocket,DIALOG_BACK,dia_addon_paul_pickpocket_back);
	Info_AddChoice(dia_addon_paul_pickpocket,DIALOG_PICKPOCKET,dia_addon_paul_pickpocket_doit);
};

func void dia_addon_paul_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_paul_pickpocket);
};

func void dia_addon_paul_pickpocket_back()
{
	Info_ClearChoices(dia_addon_paul_pickpocket);
};


instance DIA_ADDON_PAUL_HI(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 1;
	condition = dia_addon_paul_hi_condition;
	information = dia_addon_paul_hi_info;
	permanent = FALSE;
	description = "Handlujesz mo�e sprz�tem kowalskim?";
};


func int dia_addon_paul_hi_condition()
{
	return TRUE;
};

func void dia_addon_paul_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Hi_15_00");	//Handlujesz mo�e sprz�tem kowalskim?
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_01");	//Huno chyba ma stal. Ja mam tylko kilka kawa�k�w rudy.
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_02");	//Ale one nie s� na sprzeda�. Ruda to jedyna cenna rzecz, jak� posiadam.
};


instance DIA_ADDON_PAUL_HUNO(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 2;
	condition = dia_addon_paul_huno_condition;
	information = dia_addon_paul_huno_info;
	permanent = FALSE;
	description = "Pracujesz dla Huno?";
};


func int dia_addon_paul_huno_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_hi))
	{
		return TRUE;
	};
};

func void dia_addon_paul_huno_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Huno_15_00");	//Pracujesz dla Huno?
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_01");	//Chcia�em zarobi� troch� z�ota, zacz��em wi�c pracowa� dla Huno. Od tamtej pory od Estebana nie dosta�em ju� nic.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_02");	//Powiedzia� mi, �e nie jestem ju� potrzebny.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_03");	//Tak wi�c praca dla Huno to moja jedyna szansa.
};


instance DIA_ADDON_PAUL_ATTENTAT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 3;
	condition = dia_addon_paul_attentat_condition;
	information = dia_addon_paul_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_paul_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_paul_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Paul_Attentat_03_00");	//Nic! Nie mam z tym nic wsp�lnego. Czego ode mnie chcesz?
};


instance DIA_ADDON_PAUL_HUNOVERDACHT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 4;
	condition = dia_addon_paul_hunoverdacht_condition;
	information = dia_addon_paul_hunoverdacht_info;
	permanent = FALSE;
	description = "Huno jest podejrzanym w sprawie usi�owania zab�jstwa...";
};


func int dia_addon_paul_hunoverdacht_condition()
{
	if(((FINN_TELLALL == TRUE) || (EMILIO_TELLALL == TRUE)) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_paul_hunoverdacht_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoVerdacht_15_00");	//Huno jest podejrzanym w sprawie usi�owania zab�jstwa...
	AI_Output(self,other,"DIA_Addon_Paul_HunoVerdacht_03_01");	//Nic o tym nie wiem!
};


instance DIA_ADDON_PAUL_HUNOARBEIT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 5;
	condition = dia_addon_paul_hunoarbeit_condition;
	information = dia_addon_paul_hunoarbeit_info;
	permanent = FALSE;
	description = "Pracujesz dla niego! MUSISZ co� wiedzie�!";
};


func int dia_addon_paul_hunoarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_huno) && Npc_KnowsInfo(other,dia_addon_paul_hunoverdacht) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_paul_hunoarbeit_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoArbeit_15_00");	//Pracujesz dla niego! MUSISZ co� wiedzie�!
	AI_Output(self,other,"DIA_Addon_Paul_HunoArbeit_03_01");	//Nic nie wiem - naprawd�! Musz� dalej pracowa�.
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PAUL_FEARESTEBAN(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 5;
	condition = dia_addon_paul_fearesteban_condition;
	information = dia_addon_paul_fearesteban_info;
	permanent = FALSE;
	description = "Wiesz, co zrobi Esteban, gdy si� dowie, �e kryjesz Huno?";
};


func int dia_addon_paul_fearesteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_hunoarbeit) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_paul_fearesteban_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_FearEsteban_15_00");	//Wiesz, co zrobi Esteban, gdy si� dowie, �e kryjesz Huno?
	AI_Output(self,other,"DIA_Addon_Paul_FearEsteban_03_01");	//Cz�owieku, zostaw mnie w spokoju! Nie mia�em z tym nic wsp�lnego!
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PAUL_MAULPAUL(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 5;
	condition = dia_addon_paul_maulpaul_condition;
	information = dia_addon_paul_maulpaul_info;
	permanent = FALSE;
	description = "Dobrze, a teraz powiesz mi wszystko, co wiesz!";
};


func int dia_addon_paul_maulpaul_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_fearesteban) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_paul_maulpaul_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_00");	//Dobrze, a teraz powiesz mi wszystko, co wiesz, albo st�uk� ci� na kwa�ne jab�ko!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_01");	//N-nie, nie mo�esz mnie tak traktowa� tylko dlatego, �e pracujesz dla szefa!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_02");	//Ale� oczywi�cie, �e mog�!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_03");	//Nie zbli�aj si�!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_04");	//Paul...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_05");	//Wiem tylko tyle, �e Huno nie lubi Estebana.
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_06");	//Dzia�a mi na nerwy, opowiadaj�c, �e Esteban ca�y czas psuje mu interes...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_07");	//Nigdy nie komentowa�em tych spraw.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_08");	//Mog�em si� domy�li�. Widzisz, to nie by�o takie trudne, prawda?
	Npc_ExchangeRoutine(self,"START");
	PAUL_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Paul m�wi, �e Huno nienawidzi Estebana za zrujnowanie jego interesu.");
};


instance DIA_ADDON_BDT_1070_PAUL_MINE(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 2;
	condition = dia_addon_paul_mine_condition;
	information = dia_addon_paul_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_paul_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_paul_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1070_Paul_Mine_03_00");	//W ko�cu! Oto twoja ruda.
	b_giveinvitems(self,other,itmi_nugget,2);
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_PAUL_PERM(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 99;
	condition = dia_addon_paul_perm_condition;
	information = dia_addon_paul_perm_info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
};


func int dia_addon_paul_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_huno))
	{
		return TRUE;
	};
};

func void dia_addon_paul_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_PERM_15_00");	//Wszystko w porz�dku?
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_01");	//Tak, zamierzam wydoby� z tej ska�y troch� z�ota.
	}
	else if((PAUL_TELLALL == TRUE) && (HUNO_ZUSNAF == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_02");	//Powiedzia�em ci wszystko, co wiem!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_03");	//Cz�owieku, ja chc� tylko spokojnie pracowa�.
	};
};

