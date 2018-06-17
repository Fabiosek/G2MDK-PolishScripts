
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
		AI_Output(self,other,"DIA_Fellan_News_06_00");	//No dobrze, pokona�e� mnie. Brawo, bohaterze.
		if((MIS_ATTACKFELLAN == LOG_RUNNING) && (FELLANGESCHLAGEN == FALSE))
		{
			AI_Output(other,self,"DIA_Fellan_News_15_01");	//Przestaniesz wali� tym m�otkiem, czy mam ci jeszcze raz spu�ci� lanie?
			AI_Output(self,other,"DIA_Fellan_News_06_02");	//Nie, prosz�, nie bij mnie. Ale je�li cokolwiek si� zawali, to b�dzie to twoja wina!
			FELLANGESCHLAGEN = TRUE;
			Npc_ExchangeRoutine(self,"OHNEHAMMER");
			AI_StopProcessInfos(self);
		};
	};
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_03");	//Co z tob�! Chcesz znowu oberwa�?
	};
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_04");	//O co ci w�a�ciwie chodzi? Chcesz si� bi�? Chcesz rozmawia�? Mo�e chcesz si� wreszcie na co� zdecydowa�?
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
	AI_Output(self,other,"DIA_Fellan_HALLO_06_01");	//Od wielu dni pr�buj� naprawia� uszkodzenia dachu.
	AI_Output(self,other,"DIA_Fellan_HALLO_06_02");	//Krokwie dos�ownie rozpadaj� si� po ostatnich deszczach. Wkr�tce to wszystko zawali mi si� na g�ow�!
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_STOP(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 3;
	condition = dia_fellan_stop_condition;
	information = dia_fellan_stop_info;
	permanent = FALSE;
	description = "Mo�esz na moment przesta� przybija�?";
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
	AI_Output(other,self,"DIA_Fellan_Stop_15_00");	//Mo�esz na moment przesta� przybija�?
	AI_Output(self,other,"DIA_Fellan_Stop_06_01");	//Nie, musz�, MUSZ� to sko�czy�.
	Info_ClearChoices(dia_fellan_stop);
	Info_AddChoice(dia_fellan_stop,"Przesta� przybija� albo po�ami� ci wszystkie ko�ci.",dia_fellan_stop_bones);
	Info_AddChoice(dia_fellan_stop,"Dam ci 10 sztuk z�ota, je�li cho� na chwil� przestaniesz wali� tym m�otkiem.",dia_fellan_stop_gold);
	Info_AddChoice(dia_fellan_stop,"Po prostu przesta� t�uc tym m�otkiem, zrozumiano?",dia_fellan_stop_just);
};

func void dia_fellan_stop_bones()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Bones_15_00");	//Przesta� przybija� albo po�ami� ci wszystkie ko�ci.
	AI_Output(self,other,"DIA_Fellan_Stop_Bones_06_01");	//Zapomnij o tym. Chyba �e twoja g�owa r�wnie� potrzebuje niewielkiej naprawy moim m�otkiem.
	AI_StopProcessInfos(self);
};

func void dia_fellan_stop_gold()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Gold_15_00");	//Dam ci 10 sztuk z�ota, je�li cho� na chwil� przestaniesz wali� tym m�otkiem.
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_01");	//O, ho... To bardzo hojnie z twojej strony. Ale je�li chodzi o twoje z�oto, to mo�esz je sobie...
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_02");	//...no, wiesz, co mo�esz z nim zrobi�.
};

func void dia_fellan_stop_just()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Just_15_00");	//Po prostu przesta� t�uc tym m�otkiem, zrozumiano?
	AI_Output(self,other,"DIA_Fellan_Stop_Just_06_01");	//Po prostu przesta� mnie wkurza�, zrozumiano?
};


instance DIA_FELLAN_KLAR(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 5;
	condition = dia_fellan_klar_condition;
	information = dia_fellan_klar_info;
	permanent = TRUE;
	description = "Hej - wszystko w porz�dku?";
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
	AI_Output(other,self,"DIA_Fellan_klar_15_00");	//Hej - wszystko w porz�dku?
	if(FELLANGESCHLAGEN == FALSE)
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_01");	//Taaa, musz� to tylko zreperowa� na czas.
	}
	else
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_02");	//Stan dachu ci�gle si� pogarsza. Jak tak dalej p�jdzie, to nast�pnym razem b�d� brodzi� w wodzie po kolana. I to wszystko przez ciebie!
	};
	AI_StopProcessInfos(self);
};

