
instance DIA_NONE_101_MARIO_EXIT(C_INFO)
{
	npc = none_101_mario;
	nr = 999;
	condition = dia_none_101_mario_exit_condition;
	information = dia_none_101_mario_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_none_101_mario_exit_condition()
{
	return TRUE;
};

func void dia_none_101_mario_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_101_MARIO_JOB(C_INFO)
{
	npc = none_101_mario;
	nr = 4;
	condition = dia_none_101_mario_job_condition;
	information = dia_none_101_mario_job_info;
	permanent = TRUE;
	description = "Co tu porabiasz?";
};


func int dia_none_101_mario_job_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE) && (Npc_KnowsInfo(other,dia_none_101_mario_youneedme) == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_job_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//Co porabiasz?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//Czekam w nadziei, ¿e ju¿ nied³ugo zawinie do portu jakiœ statek, na który mo¿na bêdzie siê zaci¹gn¹æ.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//Od tej bezczynnoœci cz³owiek zaczyna wariowaæ.
};


instance DIA_NONE_101_MARIO_YOUNEEDME(C_INFO)
{
	npc = none_101_mario;
	nr = 4;
	condition = dia_none_101_mario_youneedme_condition;
	information = dia_none_101_mario_youneedme_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_none_101_mario_youneedme_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_youneedme_info()
{
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//S³ysza³em, ¿e szukasz za³ogi na statek, czy to prawda?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//I co z tego?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//Wpisz mnie na listê!
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"W portowej knajpie pozna³em Maria, by³ego marynarza. Chce dostaæ siê na statek.");
};


instance DIA_NONE_101_MARIO_WHYNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 5;
	condition = dia_none_101_mario_whyneedyou_condition;
	information = dia_none_101_mario_whyneedyou_info;
	permanent = FALSE;
	description = "Dlaczego mia³bym ciê ze sob¹ zabraæ?";
};


func int dia_none_101_mario_whyneedyou_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_whyneedyou_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//Dlaczego mia³bym ciê ze sob¹ zabraæ?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//Po prostu... Potrzebujesz mnie.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//Jestem... By³em porucznikiem marynarki królewskiej.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//S³u¿y³em jako marynarz na 'Królu Rhobarze' i Dumie Myrtany'.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//W bitwie o Wschodni Archipelag w³asnorêcznie wys³a³em z tuzin orków z powrotem do œwiata Beliara.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//Niestety, by³o nas zbyt ma³o, po zatoniêciu okrêtu flagowego zostaliœmy zmuszeniu do odwrotu.
};


instance DIA_NONE_101_MARIO_WHYHERE(C_INFO)
{
	npc = none_101_mario;
	nr = 7;
	condition = dia_none_101_mario_whyhere_condition;
	information = dia_none_101_mario_whyhere_info;
	permanent = FALSE;
	description = "Co tu w³aœciwie robisz?";
};


func int dia_none_101_mario_whyhere_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_whyneedyou) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_whyhere_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//Co tu w³aœciwie robisz?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//Flota zosta³a rozgromiona, kufry puste.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//Po odejœciu ze s³u¿by wyl¹dowa³em w tej dziurze. Staram siê gdzieœ zaczepiæ.
};


instance DIA_NONE_101_MARIO_ABILITIES(C_INFO)
{
	npc = none_101_mario;
	nr = 8;
	condition = dia_none_101_mario_abilities_condition;
	information = dia_none_101_mario_abilities_info;
	permanent = FALSE;
	description = "Co w³aœciwie potrafisz?";
};


func int dia_none_101_mario_abilities_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_whyneedyou) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_abilities_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//Co w³aœciwie potrafisz?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//Jestem mistrzem aborda¿u i walki w zwarciu. Jeœli trzeba, poradzê sobie tak¿e z obs³ug¹ dzia³a pok³adowego.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//Za³o¿ê siê, ¿e w czasie naszej podró¿y móg³bym ciê nauczyæ tego i owego.
	b_logentry(TOPIC_CREW,"Mario wydaje siê byæ prawdziwym weteranem marynarki wojennej. Mo¿e nauczy mnie paru rzeczy.");
};


instance DIA_NONE_101_MARIO_YOURPRICE(C_INFO)
{
	npc = none_101_mario;
	nr = 9;
	condition = dia_none_101_mario_yourprice_condition;
	information = dia_none_101_mario_yourprice_info;
	permanent = FALSE;
	description = "O co wiêc mnie prosisz?";
};


func int dia_none_101_mario_yourprice_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_yourprice_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//O co wiêc mnie prosisz?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//A o có¿ mogê prosiæ? Chcê siê st¹d po prostu wydostaæ.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//Pomó¿ mi st¹d uciec, jeœli weŸmiesz mnie ze sob¹, nie po¿a³ujesz.
};


instance DIA_NONE_101_MARIO_COULDBEDANGEROUS(C_INFO)
{
	npc = none_101_mario;
	nr = 10;
	condition = dia_none_101_mario_couldbedangerous_condition;
	information = dia_none_101_mario_couldbedangerous_info;
	permanent = FALSE;
	description = "Podró¿ mo¿e byæ niebezpieczna.";
};


func int dia_none_101_mario_couldbedangerous_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_yourprice) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_couldbedangerous_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//Podró¿ mo¿e byæ niebezpieczna.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//Przywyk³em do niebezpieczeñstw. Na morzu ka¿dy dzieñ to walka o przetrwanie.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//Ka¿da burza, ka¿dy sztorm mo¿e przynieœæ kres twemu ¿yciu. Nie mówi¹c ju¿ o morskich potworach, zdolnych po³kn¹æ statek w ca³oœci.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//O orkowych galerach nawet nie wspominam. Zaufaj mi, trudno mnie przestraszyæ. Tchórzliwy marynarz to martwy marynarz.
};


instance DIA_NONE_101_MARIO_DONTNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 13;
	condition = dia_none_101_mario_dontneedyou_condition;
	information = dia_none_101_mario_dontneedyou_info;
	permanent = FALSE;
	description = "Do niczego mi siê nie przydasz.";
};


func int dia_none_101_mario_dontneedyou_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_dontneedyou_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//Do niczego mi siê nie przydasz.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//Nie znajdziesz tu lepszego marynarza ode mnie.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//Na pierwszy rzut oka wygl¹da na to, ¿e nie masz zielonego pojêcia o nawigacji.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//Zastanów siê wiêc powa¿nie, nim komuœ zaufasz.
};


instance DIA_NONE_101_MARIO_NEEDGOODMEN(C_INFO)
{
	npc = none_101_mario;
	nr = 2;
	condition = dia_none_101_mario_needgoodmen_condition;
	information = dia_none_101_mario_needgoodmen_info;
	permanent = FALSE;
	description = "Przyda³byœ mi siê.";
};


func int dia_none_101_mario_needgoodmen_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_needgoodmen_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//Przyda³byœ mi siê.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//Œwietnie, do zobaczenia na statku.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	MARIO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_MARIO_LEAVEMYSHIP(C_INFO)
{
	npc = none_101_mario;
	nr = 11;
	condition = dia_mario_leavemyship_condition;
	information = dia_mario_leavemyship_info;
	permanent = TRUE;
	description = "Chyba jednak mi siê nie przydasz!";
};


func int dia_mario_leavemyship_condition()
{
	if((MARIO_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_mario_leavemyship_info()
{
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//Jednak nie mogê skorzystaæ z twojej pomocy!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//Jak sobie ¿yczysz. Wiesz, gdzie mnie znaleŸæ.
	MARIO_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MARIO_STILLNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 11;
	condition = dia_mario_stillneedyou_condition;
	information = dia_mario_stillneedyou_info;
	permanent = TRUE;
	description = "Chyba jednak bêdê ciê potrzebowa³!";
};


func int dia_mario_stillneedyou_condition()
{
	if(((MARIO_ISONBOARD == LOG_OBSOLETE) || (MARIO_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_mario_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//No dobrze, mo¿e mi siê przydasz.
	if(MARIO_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//Œwietnie! Do zobaczenia na statku!
		MARIO_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		AI_StopProcessInfos(self);
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//Nie mo¿esz mnie tak traktowaæ!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_MARIO_PICKPOCKET(C_INFO)
{
	npc = none_101_mario;
	nr = 900;
	condition = dia_mario_pickpocket_condition;
	information = dia_mario_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_mario_pickpocket_condition()
{
	return c_beklauen(71,220);
};

func void dia_mario_pickpocket_info()
{
	Info_ClearChoices(dia_mario_pickpocket);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_BACK,dia_mario_pickpocket_back);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_PICKPOCKET,dia_mario_pickpocket_doit);
};

func void dia_mario_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mario_pickpocket);
};

func void dia_mario_pickpocket_back()
{
	Info_ClearChoices(dia_mario_pickpocket);
};

