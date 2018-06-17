
instance DIA_FELLAN_EXIT(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 999;
	condition = dia_fellan_exit_condition;
	information = dia_fellan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fellan_exit_condition()
{
	return TRUE;
};

func void dia_fellan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_PICKPOCKET(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 900;
	condition = dia_fellan_pickpocket_condition;
	information = dia_fellan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_fellan_pickpocket_condition()
{
	return c_beklauen(40,40);
};

func void dia_fellan_pickpocket_info()
{
	Info_ClearChoices(dia_fellan_pickpocket);
	Info_AddChoice(dia_fellan_pickpocket,DIALOG_BACK,dia_fellan_pickpocket_back);
	Info_AddChoice(dia_fellan_pickpocket,DIALOG_PICKPOCKET,dia_fellan_pickpocket_doit);
};

func void dia_fellan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fellan_pickpocket);
};

func void dia_fellan_pickpocket_back()
{
	Info_ClearChoices(dia_fellan_pickpocket);
};


instance DIA_FELLAN_NEWS(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 1;
	condition = dia_fellan_news_condition;
	information = dia_fellan_news_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_fellan_news_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_news_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_00");	//No dobrze, pokona³eœ mnie. Brawo, bohaterze.
		if((MIS_ATTACKFELLAN == LOG_RUNNING) && (FELLANGESCHLAGEN == FALSE))
		{
			AI_Output(other,self,"DIA_Fellan_News_15_01");	//Przestaniesz waliæ tym m³otkiem, czy mam ci jeszcze raz spuœciæ lanie?
			AI_Output(self,other,"DIA_Fellan_News_06_02");	//Nie, proszê, nie bij mnie. Ale jeœli cokolwiek siê zawali, to bêdzie to twoja wina!
			FELLANGESCHLAGEN = TRUE;
			Npc_ExchangeRoutine(self,"OHNEHAMMER");
			AI_StopProcessInfos(self);
		};
	};
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_03");	//Co z tob¹! Chcesz znowu oberwaæ?
	};
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_04");	//O co ci w³aœciwie chodzi? Chcesz siê biæ? Chcesz rozmawiaæ? Mo¿e chcesz siê wreszcie na coœ zdecydowaæ?
	};
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
};


instance DIA_FELLAN_HALLO(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 2;
	condition = dia_fellan_hallo_condition;
	information = dia_fellan_hallo_info;
	permanent = FALSE;
	description = "Co tam przybijasz?";
};


func int dia_fellan_hallo_condition()
{
	if(FELLANGESCHLAGEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_fellan_hallo_info()
{
	AI_Output(other,self,"DIA_Fellan_HALLO_15_00");	//Co tam przybijasz?
	AI_Output(self,other,"DIA_Fellan_HALLO_06_01");	//Od wielu dni próbujê naprawiaæ uszkodzenia dachu.
	AI_Output(self,other,"DIA_Fellan_HALLO_06_02");	//Krokwie dos³ownie rozpadaj¹ siê po ostatnich deszczach. Wkrótce to wszystko zawali mi siê na g³owê!
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_STOP(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 3;
	condition = dia_fellan_stop_condition;
	information = dia_fellan_stop_info;
	permanent = FALSE;
	description = "Mo¿esz na moment przestaæ przybijaæ?";
};


func int dia_fellan_stop_condition()
{
	if(MIS_ATTACKFELLAN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_fellan_stop_info()
{
	AI_Output(other,self,"DIA_Fellan_Stop_15_00");	//Mo¿esz na moment przestaæ przybijaæ?
	AI_Output(self,other,"DIA_Fellan_Stop_06_01");	//Nie, muszê, MUSZÊ to skoñczyæ.
	Info_ClearChoices(dia_fellan_stop);
	Info_AddChoice(dia_fellan_stop,"Przestañ przybijaæ albo po³amiê ci wszystkie koœci.",dia_fellan_stop_bones);
	Info_AddChoice(dia_fellan_stop,"Dam ci 10 sztuk z³ota, jeœli choæ na chwilê przestaniesz waliæ tym m³otkiem.",dia_fellan_stop_gold);
	Info_AddChoice(dia_fellan_stop,"Po prostu przestañ t³uc tym m³otkiem, zrozumiano?",dia_fellan_stop_just);
};

func void dia_fellan_stop_bones()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Bones_15_00");	//Przestañ przybijaæ albo po³amiê ci wszystkie koœci.
	AI_Output(self,other,"DIA_Fellan_Stop_Bones_06_01");	//Zapomnij o tym. Chyba ¿e twoja g³owa równie¿ potrzebuje niewielkiej naprawy moim m³otkiem.
	AI_StopProcessInfos(self);
};

func void dia_fellan_stop_gold()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Gold_15_00");	//Dam ci 10 sztuk z³ota, jeœli choæ na chwilê przestaniesz waliæ tym m³otkiem.
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_01");	//O, ho... To bardzo hojnie z twojej strony. Ale jeœli chodzi o twoje z³oto, to mo¿esz je sobie...
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_02");	//...no, wiesz, co mo¿esz z nim zrobiæ.
};

func void dia_fellan_stop_just()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Just_15_00");	//Po prostu przestañ t³uc tym m³otkiem, zrozumiano?
	AI_Output(self,other,"DIA_Fellan_Stop_Just_06_01");	//Po prostu przestañ mnie wkurzaæ, zrozumiano?
};


instance DIA_FELLAN_KLAR(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 5;
	condition = dia_fellan_klar_condition;
	information = dia_fellan_klar_info;
	permanent = TRUE;
	description = "Hej - wszystko w porz¹dku?";
};


func int dia_fellan_klar_condition()
{
	if(Npc_KnowsInfo(other,dia_fellan_hallo))
	{
		return TRUE;
	};
};

func void dia_fellan_klar_info()
{
	AI_Output(other,self,"DIA_Fellan_klar_15_00");	//Hej - wszystko w porz¹dku?
	if(FELLANGESCHLAGEN == FALSE)
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_01");	//Taaa, muszê to tylko zreperowaæ na czas.
	}
	else
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_02");	//Stan dachu ci¹gle siê pogarsza. Jak tak dalej pójdzie, to nastêpnym razem bêdê brodzi³ w wodzie po kolana. I to wszystko przez ciebie!
	};
	AI_StopProcessInfos(self);
};

