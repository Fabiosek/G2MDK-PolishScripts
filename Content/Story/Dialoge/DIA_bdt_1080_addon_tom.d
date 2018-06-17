
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
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_01");	//Mam trochê k³opotów. Powrót do obozu nie by³by teraz najlepszym wyjœciem.
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_02");	//Co siê sta³o?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_03");	//Mia³em ca³kiem niez³e kontakty z piratami, wiesz?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_04");	//Zawsze spotykaliœmy siê nieopodal obozu, ¿eby pohandlowaæ.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_05");	//Ch³opie, kupowa³em graty dla po³owy ludzi z obozu. "Tom, za³atw mi to, Tom za³atw mi tamto".
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_06");	//A ten bydlak Esteban wszystko zrujnowa³!
};


instance DIA_ADDON_TOM_JUAN(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 2;
	condition = dia_addon_tom_juan_condition;
	information = dia_addon_tom_juan_info;
	permanent = FALSE;
	description = "W jaki sposób?";
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
	AI_Output(other,self,"DIA_Addon_Tom_Juan_15_00");	//W jaki sposób?
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_01");	//Esteban wys³a³ jednego ze swoich ludzi, Juana. Koleœ obserwowa³ nas.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_02");	//A póŸniej, jak omawia³em interes z piratami, wyszed³ z ciemnoœci i ich pobi³.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_03");	//Ch³opie, ale ten goœæ by³ szybki! Na szczêœcie zdo³a³em uciec.
	SC_KNOWS_JUANMURDEREDANGUS = TRUE;
	b_logentry(TOPIC_ADDON_KILLJUAN,"A wiêc to Juan jest odpowiedzialny za zabójstwo Hanka i Angusa. Urz¹dzi³ na nich zasadzkê, a nastêpnie zamordowa³.");
};


instance DIA_ADDON_TOM_ESTEBAN(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 3;
	condition = dia_addon_tom_esteban_condition;
	information = dia_addon_tom_esteban_info;
	permanent = FALSE;
	description = "I od tamtej pory siê tu ukrywasz?";
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
	AI_Output(other,self,"DIA_Addon_Tom_Esteban_15_00");	//I od tamtej pory siê tu ukrywasz?
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_01");	//Najpierw wróci³em do obozu i powiedzia³em Fiskowi, Huno i innym ch³opakom, ¿eby nie spodziewali siê dostawy.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_02");	//I ¿e mog¹ za to podziêkowaæ Estebanowi.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_03");	//Jeœli Esteban dowie siê, kto doniós³ ch³opakom, ¿e to on za tym stoi, bêdê martwy.
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
	description = "Esteban nie ¿yje.";
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
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_00");	//Esteban nie ¿yje.
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_01");	//Naprawdê? Ch³opie, TO siê nazywa mieæ szczêœcie.
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_02");	//Kto go zabi³?
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_03");	//Powiedzmy, ¿e ktoœ, kogo znasz...
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_04");	//Dziêkujê, ¿e tu przyszed³eœ. Teraz mogê wróciæ do obozu...
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
	description = "Coœ jeszcze?";
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
	AI_Output(other,self,"DIA_Addon_Tom_PERM_15_00");	//Coœ jeszcze?
	if(Npc_GetDistToWP(self,"BL_INN_05_B") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_01");	//Teraz bêdê móg³ siê cieszyæ gorza³¹ Lucii.
	}
	else if(Npc_KnowsInfo(other,dia_addon_tom_dead))
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_02");	//W koñcu mogê wróciæ!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_03");	//Hê? Przewa¿nie siedzê tutaj i liczê kamienie...
	};
};

