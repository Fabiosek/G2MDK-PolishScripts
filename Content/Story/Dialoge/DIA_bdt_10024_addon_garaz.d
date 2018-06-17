
instance DIA_ADDON_GARAZ_EXIT(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 999;
	condition = dia_addon_garaz_exit_condition;
	information = dia_addon_garaz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_garaz_exit_condition()
{
	return TRUE;
};

func void dia_addon_garaz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GARAZ_PICKPOCKET(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 900;
	condition = dia_addon_garaz_pickpocket_condition;
	information = dia_addon_garaz_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_garaz_pickpocket_condition()
{
	return c_beklauen(66,80);
};

func void dia_addon_garaz_pickpocket_info()
{
	Info_ClearChoices(dia_addon_garaz_pickpocket);
	Info_AddChoice(dia_addon_garaz_pickpocket,DIALOG_BACK,dia_addon_garaz_pickpocket_back);
	Info_AddChoice(dia_addon_garaz_pickpocket,DIALOG_PICKPOCKET,dia_addon_garaz_pickpocket_doit);
};

func void dia_addon_garaz_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_garaz_pickpocket);
};

func void dia_addon_garaz_pickpocket_back()
{
	Info_ClearChoices(dia_addon_garaz_pickpocket);
};


instance DIA_ADDON_GARAZ_PROBLEME(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 2;
	condition = dia_addon_garaz_probleme_condition;
	information = dia_addon_garaz_probleme_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_garaz_probleme_condition()
{
	return TRUE;
};

func void dia_addon_garaz_probleme_info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_00");	//Poczekaj chwil�.
	AI_Output(other,self,"DIA_Addon_Garaz_Probleme_15_01");	//Jaki� problem?
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_02");	//Pe�zacz. A w zasadzie kilka. Wygl�da na to, �e trafili�my na gniazdo.
};


instance DIA_ADDON_GARAZ_HI(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_hi_condition;
	information = dia_addon_garaz_hi_info;
	permanent = FALSE;
	description = "Dlaczego nie zaatakujemy pe�zaczy?";
};


func int dia_addon_garaz_hi_condition()
{
	if(!Npc_IsDead(bloodwyn) && (MINECRAWLER_KILLED < 9))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_00");	//Dlaczego nie zaatakujemy pe�zaczy?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_01");	//Te� si� nad tym zastanawiam. Stra�nicy maj� najwyra�niej "wa�niejsze rzeczy do roboty".
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_02");	//A teraz Bloodwyn kaza� mi rozwi�za� ten problem.
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_03");	//Rozumiem, �e nie zamierzasz walczy� z pe�zaczami?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_04");	//A powinienem? Po to, �eby�my mogli po�o�y� �apska na z�ocie w tej jaskini?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_05");	//Bloodwyn i tak zabierze wi�kszo��. A ja nie zamierzam nadstawia� karku za t� odrobin�, kt�ra zostanie.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_06");	//A, je�li TY chcesz z nimi walczy� - prosz� bardzo. Tylko nie �ci�gnij ich tu, na g�r�.
};


instance DIA_ADDON_GARAZ_BLOODWYN(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 8;
	condition = dia_addon_garaz_bloodwyn_condition;
	information = dia_addon_garaz_bloodwyn_info;
	permanent = FALSE;
	description = "Jest co� jeszcze, co mo�esz mi powiedzie� o Bloodwynie?";
};


func int dia_addon_garaz_bloodwyn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garaz_hi) && (MINECRAWLER_KILLED < 9) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_bloodwyn_info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_00");	//Jest co� jeszcze, co mo�esz mi powiedzie� o Bloodwynie?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_01");	//Tak, to chciwy sukinsyn. Sprawdza ka�d� �y�k� z�ota i z�o�e.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_02");	//Dla niego wa�ne jest tylko z�oto. Nas ma w g��bokim poszanowaniu.
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_03");	//Co� jeszcze?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_04");	//Uwa�a si� za najlepszego. Bloodwyn nie mo�e znie�� nikogo, kto jest od niego lepszy. Oczywi�cie ja nie powa�y�bym si� rzuci� mu wyzwania.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_05");	//Najlepiej go unika� - chyba �e naprawd� chcesz go wkurzy�.
	b_logentry(TOPIC_ADDON_TEMPEL,"Bloodwyn na pewno opu�ci �wi�tyni�, je�li us�yszy plotki o nowym z�o�u z�ota znalezionym w kopalni.");
	b_logentry(TOPIC_ADDON_TEMPEL,"Kiedy Bloodwyn si� zdenerwuje, traci nad sob� panowanie. Ta wiedza na pewno mi si� przyda.");
};


instance DIA_ADDON_GARAZ_SIEG(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_sieg_condition;
	information = dia_addon_garaz_sieg_info;
	permanent = FALSE;
	description = "Za�atwione. Pe�zacze s� martwe.";
};


func int dia_addon_garaz_sieg_condition()
{
	if((MINECRAWLER_KILLED >= 9) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_sieg_info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Sieg_15_00");	//Za�atwione. Pe�zacze s� martwe.
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_01");	//Bloodwyn tu idzie. Tego chcia�e�, prawda?
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_02");	//Zabi�e� pe�zacza, �eby �ci�gn�� tu Bloodwyna? No to TERAZ zr�b to, co zamierza�e�.
	b_startotherroutine(bloodwyn,"GOLD");
};


instance DIA_ADDON_GARAZ_BLOOD(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_blood_condition;
	information = dia_addon_garaz_blood_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_garaz_blood_condition()
{
	if(Npc_IsDead(bloodwyn) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_blood_info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_00");	//Da�e� temu bydlakowi nauczk�. Dobra robota.
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_01");	//W takim razie rozejrz� si� po okolicy.
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GOLD");
	b_startotherroutine(thorus,"TALK");
};


instance DIA_ADDON_GARAZ_GOLD(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_gold_condition;
	information = dia_addon_garaz_gold_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_garaz_gold_condition()
{
	if((Npc_GetDistToWP(self,"ADW_MINE_MC_GARAZ") <= 500) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_gold_info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_00");	//O rany, sporo tu tego z�ota.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_01");	//B�dziemy potrzebowa� drabiny, �eby dotrze� do tego z�ota.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_02");	//Tylko �e nikt nie korzysta z drabin od czasu upadku bariery.. Szkoda.
};

