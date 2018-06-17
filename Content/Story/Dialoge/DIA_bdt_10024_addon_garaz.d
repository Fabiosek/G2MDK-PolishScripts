
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
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_00");	//Poczekaj chwilê.
	AI_Output(other,self,"DIA_Addon_Garaz_Probleme_15_01");	//Jakiœ problem?
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_02");	//Pe³zacz. A w zasadzie kilka. Wygl¹da na to, ¿e trafiliœmy na gniazdo.
};


instance DIA_ADDON_GARAZ_HI(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_hi_condition;
	information = dia_addon_garaz_hi_info;
	permanent = FALSE;
	description = "Dlaczego nie zaatakujemy pe³zaczy?";
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
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_00");	//Dlaczego nie zaatakujemy pe³zaczy?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_01");	//Te¿ siê nad tym zastanawiam. Stra¿nicy maj¹ najwyraŸniej "wa¿niejsze rzeczy do roboty".
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_02");	//A teraz Bloodwyn kaza³ mi rozwi¹zaæ ten problem.
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_03");	//Rozumiem, ¿e nie zamierzasz walczyæ z pe³zaczami?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_04");	//A powinienem? Po to, ¿ebyœmy mogli po³o¿yæ ³apska na z³ocie w tej jaskini?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_05");	//Bloodwyn i tak zabierze wiêkszoœæ. A ja nie zamierzam nadstawiaæ karku za tê odrobinê, która zostanie.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_06");	//A, jeœli TY chcesz z nimi walczyæ - proszê bardzo. Tylko nie œci¹gnij ich tu, na górê.
};


instance DIA_ADDON_GARAZ_BLOODWYN(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 8;
	condition = dia_addon_garaz_bloodwyn_condition;
	information = dia_addon_garaz_bloodwyn_info;
	permanent = FALSE;
	description = "Jest coœ jeszcze, co mo¿esz mi powiedzieæ o Bloodwynie?";
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
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_00");	//Jest coœ jeszcze, co mo¿esz mi powiedzieæ o Bloodwynie?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_01");	//Tak, to chciwy sukinsyn. Sprawdza ka¿d¹ ¿y³kê z³ota i z³o¿e.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_02");	//Dla niego wa¿ne jest tylko z³oto. Nas ma w g³êbokim poszanowaniu.
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_03");	//Coœ jeszcze?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_04");	//Uwa¿a siê za najlepszego. Bloodwyn nie mo¿e znieœæ nikogo, kto jest od niego lepszy. Oczywiœcie ja nie powa¿y³bym siê rzuciæ mu wyzwania.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_05");	//Najlepiej go unikaæ - chyba ¿e naprawdê chcesz go wkurzyæ.
	b_logentry(TOPIC_ADDON_TEMPEL,"Bloodwyn na pewno opuœci œwi¹tyniê, jeœli us³yszy plotki o nowym z³o¿u z³ota znalezionym w kopalni.");
	b_logentry(TOPIC_ADDON_TEMPEL,"Kiedy Bloodwyn siê zdenerwuje, traci nad sob¹ panowanie. Ta wiedza na pewno mi siê przyda.");
};


instance DIA_ADDON_GARAZ_SIEG(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_sieg_condition;
	information = dia_addon_garaz_sieg_info;
	permanent = FALSE;
	description = "Za³atwione. Pe³zacze s¹ martwe.";
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
	AI_Output(other,self,"DIA_Addon_Garaz_Sieg_15_00");	//Za³atwione. Pe³zacze s¹ martwe.
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_01");	//Bloodwyn tu idzie. Tego chcia³eœ, prawda?
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_02");	//Zabi³eœ pe³zacza, ¿eby œci¹gn¹æ tu Bloodwyna? No to TERAZ zrób to, co zamierza³eœ.
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
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_00");	//Da³eœ temu bydlakowi nauczkê. Dobra robota.
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_01");	//W takim razie rozejrzê siê po okolicy.
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
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_00");	//O rany, sporo tu tego z³ota.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_01");	//Bêdziemy potrzebowaæ drabiny, ¿eby dotrzeæ do tego z³ota.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_02");	//Tylko ¿e nikt nie korzysta z drabin od czasu upadku bariery.. Szkoda.
};

