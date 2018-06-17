
instance DIA_ADDON_TOM_EXIT(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 999;
	condition = dia_addon_tom_exit_condition;
	information = dia_addon_tom_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tom_exit_condition()
{
	return TRUE;
};

func void dia_addon_tom_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TOM_PICKPOCKET(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 900;
	condition = dia_addon_tom_pickpocket_condition;
	information = dia_addon_tom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_tom_pickpocket_condition()
{
	return c_beklauen(40,52);
};

func void dia_addon_tom_pickpocket_info()
{
	Info_ClearChoices(dia_addon_tom_pickpocket);
	Info_AddChoice(dia_addon_tom_pickpocket,DIALOG_BACK,dia_addon_tom_pickpocket_back);
	Info_AddChoice(dia_addon_tom_pickpocket,DIALOG_PICKPOCKET,dia_addon_tom_pickpocket_doit);
};

func void dia_addon_tom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_tom_pickpocket);
};

func void dia_addon_tom_pickpocket_back()
{
	Info_ClearChoices(dia_addon_tom_pickpocket);
};


instance DIA_ADDON_TOM_HI(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 1;
	condition = dia_addon_tom_hi_condition;
	information = dia_addon_tom_hi_info;
	permanent = FALSE;
	description = "Dlaczego tu siedzisz?";
};


func int dia_addon_tom_hi_condition()
{
	return TRUE;
};

func void dia_addon_tom_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_00");	//Dlaczego tu siedzisz?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_01");	//Mam troch� k�opot�w. Powr�t do obozu nie by�by teraz najlepszym wyj�ciem.
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_02");	//Co si� sta�o?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_03");	//Mia�em ca�kiem niez�e kontakty z piratami, wiesz?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_04");	//Zawsze spotykali�my si� nieopodal obozu, �eby pohandlowa�.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_05");	//Ch�opie, kupowa�em graty dla po�owy ludzi z obozu. "Tom, za�atw mi to, Tom za�atw mi tamto".
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_06");	//A ten bydlak Esteban wszystko zrujnowa�!
};


instance DIA_ADDON_TOM_JUAN(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 2;
	condition = dia_addon_tom_juan_condition;
	information = dia_addon_tom_juan_info;
	permanent = FALSE;
	description = "W jaki spos�b?";
};


func int dia_addon_tom_juan_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_tom_hi))
	{
		return TRUE;
	};
};

func void dia_addon_tom_juan_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Juan_15_00");	//W jaki spos�b?
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_01");	//Esteban wys�a� jednego ze swoich ludzi, Juana. Kole� obserwowa� nas.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_02");	//A p�niej, jak omawia�em interes z piratami, wyszed� z ciemno�ci i ich pobi�.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_03");	//Ch�opie, ale ten go�� by� szybki! Na szcz�cie zdo�a�em uciec.
	SC_KNOWS_JUANMURDEREDANGUS = TRUE;
	b_logentry(TOPIC_ADDON_KILLJUAN,"A wi�c to Juan jest odpowiedzialny za zab�jstwo Hanka i Angusa. Urz�dzi� na nich zasadzk�, a nast�pnie zamordowa�.");
};


instance DIA_ADDON_TOM_ESTEBAN(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 3;
	condition = dia_addon_tom_esteban_condition;
	information = dia_addon_tom_esteban_info;
	permanent = FALSE;
	description = "I od tamtej pory si� tu ukrywasz?";
};


func int dia_addon_tom_esteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_tom_juan))
	{
		return TRUE;
	};
};

func void dia_addon_tom_esteban_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Esteban_15_00");	//I od tamtej pory si� tu ukrywasz?
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_01");	//Najpierw wr�ci�em do obozu i powiedzia�em Fiskowi, Huno i innym ch�opakom, �eby nie spodziewali si� dostawy.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_02");	//I �e mog� za to podzi�kowa� Estebanowi.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_03");	//Je�li Esteban dowie si�, kto doni�s� ch�opakom, �e to on za tym stoi, b�d� martwy.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_04");	//Dlatego nie wracam do obozu.
	TOM_TELLS = TRUE;
};


instance DIA_ADDON_TOM_DEAD(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 4;
	condition = dia_addon_tom_dead_condition;
	information = dia_addon_tom_dead_info;
	permanent = FALSE;
	description = "Esteban nie �yje.";
};


func int dia_addon_tom_dead_condition()
{
	if(Npc_IsDead(esteban) && Npc_KnowsInfo(other,dia_addon_tom_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_tom_dead_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_00");	//Esteban nie �yje.
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_01");	//Naprawd�? Ch�opie, TO si� nazywa mie� szcz�cie.
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_02");	//Kto go zabi�?
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_03");	//Powiedzmy, �e kto�, kogo znasz...
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_04");	//Dzi�kuj�, �e tu przyszed�e�. Teraz mog� wr�ci� do obozu...
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LAGER");
};


instance DIA_ADDON_TOM_PERM(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 5;
	condition = dia_addon_tom_perm_condition;
	information = dia_addon_tom_perm_info;
	permanent = TRUE;
	description = "Co� jeszcze?";
};


func int dia_addon_tom_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_tom_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_tom_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_PERM_15_00");	//Co� jeszcze?
	if(Npc_GetDistToWP(self,"BL_INN_05_B") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_01");	//Teraz b�d� m�g� si� cieszy� gorza�� Lucii.
	}
	else if(Npc_KnowsInfo(other,dia_addon_tom_dead))
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_02");	//W ko�cu mog� wr�ci�!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_03");	//H�? Przewa�nie siedz� tutaj i licz� kamienie...
	};
};

