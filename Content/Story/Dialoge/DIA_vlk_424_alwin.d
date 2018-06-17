
instance DIA_ALWIN_EXIT(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 999;
	condition = dia_alwin_exit_condition;
	information = dia_alwin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alwin_exit_condition()
{
	return TRUE;
};

func void dia_alwin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALWIN_PICKPOCKET(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 900;
	condition = dia_alwin_pickpocket_condition;
	information = dia_alwin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_alwin_pickpocket_condition()
{
	return c_beklauen(20,10);
};

func void dia_alwin_pickpocket_info()
{
	Info_ClearChoices(dia_alwin_pickpocket);
	Info_AddChoice(dia_alwin_pickpocket,DIALOG_BACK,dia_alwin_pickpocket_back);
	Info_AddChoice(dia_alwin_pickpocket,DIALOG_PICKPOCKET,dia_alwin_pickpocket_doit);
};

func void dia_alwin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alwin_pickpocket);
};

func void dia_alwin_pickpocket_back()
{
	Info_ClearChoices(dia_alwin_pickpocket);
};


instance DIA_ALWIN_SHEEP(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 3;
	condition = dia_alwin_sheep_condition;
	information = dia_alwin_sheep_info;
	permanent = FALSE;
	description = "Czy to twoje owce?";
};


func int dia_alwin_sheep_condition()
{
	return TRUE;
};

func void dia_alwin_sheep_info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//Czy to twoje owce?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//Jedyna, kt�ra do mnie nale�y, reaguje na imi� Lucy. To moja �ona...
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//Owce s� w�asno�ci� stra�y. Przyprowadzaj� do mnie wszystkie biedulki, kt�re zabior� farmerom.
};


instance DIA_ALWIN_FELLAN(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 2;
	condition = dia_alwin_fellan_condition;
	information = dia_alwin_fellan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alwin_fellan_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(fellan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_alwin_fellan_info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//Ch�opie, ten �wir z m�otkiem mnie dobija.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//O kim ty m�wisz?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//Nie s�yszysz tego walenia? A jak my�lisz, kto w porcie przez ca�y dzie� t�ucze m�otkiem?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//O tym wariacie, Fellanie. Codziennie zabiera ze sob� m�otek do szopy.
};


instance DIA_ALWIN_FELLANRUNNING(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 2;
	condition = dia_alwin_fellanrunning_condition;
	information = dia_alwin_fellanrunning_info;
	permanent = FALSE;
	description = "Mog� si� zaj�� Fellanem...";
};


func int dia_alwin_fellanrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(fellan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_alwin_fellanrunning_info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//Mog� si� zaj�� Fellanem...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//Chcesz mi pom�c? A jaki masz w tym interes?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//Ty mi to powiedz.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//Ach, o to chodzi! Dobra - je�li przestanie wali� tym m�otkiem, to zap�ac� ci 25 sztuk z�ota.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//Ale musz� ci co� powiedzie� - nie zdo�asz go przekona�. To �wir. Dotrze do niego tylko wtedy, jak mu zdrowo przy�o�ysz!
	MIS_ATTACKFELLAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ALWIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ALWIN,LOG_RUNNING);
	b_logentry(TOPIC_ALWIN,"Alwin chce, abym zmusi� Fellana do przerwania prac na dachu. Zab�jstwo nie jest dobr� metod�.");
	Info_ClearChoices(dia_alwin_fellanrunning);
	Info_AddChoice(dia_alwin_fellanrunning,"Zobacz�, co da si� zrobi�...",dia_alwin_fellanrunning_ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		Info_AddChoice(dia_alwin_fellanrunning,"Je�li go pobij�, b�d� mia� k�opoty ze stra��...",dia_alwin_fellanrunning_problems);
	};
};

func void dia_alwin_fellanrunning_ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//Zobacz�, co da si� zrobi�...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//Zastan�w si�. Pami�taj, p�ac� 25 z�otych monet.
	Info_ClearChoices(dia_alwin_fellanrunning);
};

func void dia_alwin_fellanrunning_problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//Je�li go pobij�, b�d� mia� k�opoty ze stra��...
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//Tutaj w porcie nikt nie zwraca specjalnej uwagi na walki...
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//Ale je�li kogo� tu okradniesz, albo zaczniesz co� kombinowa� z owcami, to wpadniesz w k�opoty.
};


instance DIA_ALWIN_FELLANSUCCESS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 4;
	condition = dia_alwin_fellansuccess_condition;
	information = dia_alwin_fellansuccess_info;
	permanent = FALSE;
	description = "Fellan ju� nie b�dzie wali� m�otkiem.";
};


func int dia_alwin_fellansuccess_condition()
{
	if((MIS_ATTACKFELLAN == LOG_RUNNING) && ((FELLANGESCHLAGEN == TRUE) || Npc_IsDead(fellan)))
	{
		return TRUE;
	};
};

func void dia_alwin_fellansuccess_info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//Fellan ju� nie b�dzie wali� m�otkiem.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//S�yszysz? Koniec z tym ha�asem! W ko�cu. My�la�em, �e ten kole� nigdy nie zrezygnuje.
	if(Npc_IsDead(fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//Zrobi�e� mi wielk� przys�ug�. Wiesz co, dam ci 30 sztuk z�ota.
		b_giveinvitems(self,other,itmi_gold,30);
		MIS_ATTACKFELLAN = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		MIS_ATTACKFELLAN = LOG_FAILED;
	};
};


instance DIA_ALWIN_ENDLOS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 8;
	condition = dia_alwin_endlos_condition;
	information = dia_alwin_endlos_info;
	permanent = TRUE;
	description = "A co z owcami?";
};


func int dia_alwin_endlos_condition()
{
	if(Npc_KnowsInfo(other,dia_alwin_sheep))
	{
		return TRUE;
	};
};

func void dia_alwin_endlos_info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//A co z owcami?
	if((MIS_ATTACKFELLAN != LOG_SUCCESS) && (Npc_IsDead(fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//Fellan ci�gle ha�asuje i to je doprowadza do szale�stwa. Kt�rego� dnia ca�kiem ze�wiruj�.
	}
	else if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//Owce jedz� i robi� si� coraz grubsze. Ca�kiem jak moja �ona. HA HA HA.
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//Chyba b�d� musia� jedn� z nich zaszlachtowa�. Na ostatni� wieczerz�!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//Po co?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//Dla najemnika, kt�ry zamordowa� paladyna. Oczywi�cie strac� go za to.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//Musz� tylko zdecydowa�, kt�re stworzonko pow�druje do rze�ni.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//Lucy ma wielkie szcz�cie, �e jeszcze �yje.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//My�la�em, �e Lucy jest twoj� �on�.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//Racja, ale jedn� owc� te� nazwa�em Lucy. T�, kt�ra mia�a by� ostatnim posi�kiem Benneta.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//Ale wszystko si� jako� u�o�y�o. Lucy b�dzie zadowolona.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//Po pewnym czasie obserwowanie, jak owce jedz�, staje si� do�� nudne.
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//Musz� si� z nimi po�egna�. Lord Hagen postanowi�, �e wszystkie owce p�jd� na po�ywienie dla armii.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//C�, przynajmniej b�d� mia� wi�cej czasu dla �ony.
	};
};

