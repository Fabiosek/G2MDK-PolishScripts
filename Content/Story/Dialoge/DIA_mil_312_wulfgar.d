
instance DIA_WULFGAR_EXIT(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 999;
	condition = dia_wulfgar_exit_condition;
	information = dia_wulfgar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wulfgar_exit_condition()
{
	return TRUE;
};

func void dia_wulfgar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WULFGAR_HALLO(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 1;
	condition = dia_wulfgar_hallo_condition;
	information = dia_wulfgar_hallo_info;
	permanent = FALSE;
	description = "Jak tam na s�u�bie?";
};


func int dia_wulfgar_hallo_condition()
{
	return TRUE;
};

func void dia_wulfgar_hallo_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Hallo_15_00");	//Jak tam na s�u�bie?
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_01");	//Ci ch�opcy machaj� mieczami jak cepem.
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_02");	//Ale kiedy z nimi sko�cz�, wszyscy, jak jeden m��, b�d� twardzi jak ska�a.
};


instance DIA_WULFGAR_WANNAJOIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 2;
	condition = dia_wulfgar_wannajoin_condition;
	information = dia_wulfgar_wannajoin_info;
	permanent = FALSE;
	description = "Chc� wst�pi� do stra�y.";
};


func int dia_wulfgar_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_wannajoin_info()
{
	AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_00");	//Chc� wst�pi� do stra�y.
	AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_01");	//Czy jeste� obywatelem miasta?
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_02");	//Nie.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_03");	//W takim razie Lord Andre ci� nie przyjmie.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_04");	//Oczywi�cie, mo�esz z nim porozmawia� - ale w�tpi�, by zrobi� dla ciebie wyj�tek.
	}
	else
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_05");	//Tak.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_06");	//Porozmawiaj wi�c z Lordem Andre. To on jest odpowiedzialny za rekrutacj�.
	};
};


instance DIA_WULFGAR_ABOUTMILIZ(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 3;
	condition = dia_wulfgar_aboutmiliz_condition;
	information = dia_wulfgar_aboutmiliz_info;
	permanent = FALSE;
	description = "Jak si� maj� sprawy w stra�y?";
};


func int dia_wulfgar_aboutmiliz_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_aboutmiliz_info()
{
	AI_Output(other,self,"DIA_Wulfgar_AboutMiliz_15_00");	//Jak si� maj� sprawy w stra�y?
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_01");	//Naszym kapitanem jest obecnie Lord Andre.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_02");	//Swego czasu stra� odpowiada�a przed gubernatorem. Ten cz�owiek nie mia� poj�cia, co si� tutaj naprawd� dzieje.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_03");	//Lord Andre, dla odmiany, wie, co robi. Potrafi odpowiednio zadba� o swoich ludzi.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_04");	//Wszyscy, kt�rzy zaczynaj� tu prac�, dostaj� przyzwoit� zbroj� i porz�dn� bro�.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_05");	//A je�li kto� dobrze pracuje, mo�e zawsze liczy� na premi�. Za ka�dego z�apanego przest�pc� czeka wysoka nagroda.
};


instance DIA_WULFGAR_CANYOUTRAIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 4;
	condition = dia_wulfgar_canyoutrain_condition;
	information = dia_wulfgar_canyoutrain_info;
	permanent = FALSE;
	description = "Czy mo�esz mnie trenowa� w walce mieczem?";
};


func int dia_wulfgar_canyoutrain_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_wulfgar_canyoutrain_info()
{
	AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_00");	//Mo�esz mnie trenowa� w walce mieczem?
	AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_01");	//Lord Andre nakaza�, by�my trenowali wszystkich, kt�rzy s�u�� sprawie miasta.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_02");	//Jest jednak pewien wyj�tek - najemnicy. Wynocha.
	}
	else
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_03");	//Dotyczy to jednak tylko treningu bojowego. Wszystkie pozosta�e formy szkolenia s� zarezerwowane dla stra�y.
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_04");	//Wiesz chocia�, jak trzyma� bro�, kt�r� walczysz?
		AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_05");	//Tak mi si� wydaje...
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_06");	//W porz�dku, zaczniemy, kiedy b�dziesz chcia�.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Wulfgar, stra�nik miejski, mo�e mnie nauczy� walki or�em jedno- i dwur�cznym.");
		WULFGAR_TEACH1H = TRUE;
	};
};


instance DIA_WULFGAR_ADVANTAGE(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 5;
	condition = dia_wulfgar_advantage_condition;
	information = dia_wulfgar_advantage_info;
	permanent = FALSE;
	description = "Opowiedz mi prosz� o r�nicach mi�dzy broni� jednor�czn� i dwur�czn�.";
};


func int dia_wulfgar_advantage_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_advantage_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Advantage_15_00");	//Opowiedz mi prosz� o r�nicach mi�dzy broni� jednor�czn� i dwur�czn�.
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_01");	//To proste. U�ywaj�c broni jednor�cznej, jeste� szybszy, to za� mo�e stanowi� o twej przewadze w walce.
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_02");	//Bro� dwur�czna spowalnia twoje ruchy i dlatego nale�y u�ywa� jej bardzo rozwa�nie. Jednak przy trafieniu zadaje znacznie wi�ksze obra�enia.
};


instance DIA_WULFGAR_HOWTOBEGIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 6;
	condition = dia_wulfgar_howtobegin_condition;
	information = dia_wulfgar_howtobegin_info;
	permanent = FALSE;
	description = "Od czego powinienem zacz��? Od broni jedno- czy dwur�cznych?";
};


func int dia_wulfgar_howtobegin_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_howtobegin_info()
{
	AI_Output(other,self,"DIA_Wulfgar_HowToBegin_15_00");	//Od czego powinienem zacz��? Od broni jedno- czy dwur�cznych?
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_01");	//To ju� zale�y od ciebie.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_02");	//Je�li specjalizujesz si� w jednym rodzaju broni, drugiego uczysz si� automatycznie w tym samym czasie.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_03");	//Na przyk�ad, je�li �wietnie walczysz mieczem jednor�cznym, za� je�li chodzi o dwur�czny - dopiero zaczynasz nauk�...
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_04");	//...Wtedy twoja umiej�tno�� walki mieczem dwur�cznym b�dzie zwi�ksza�a si� za ka�dym razem, gdy u�yjesz miecza jednor�cznego.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_05");	//W takim przypadku, trening jest bardziej wyczerpuj�cy.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_06");	//Tylko zacznij, a wkr�tce przekonasz si�, co mia�em na my�li.
};


instance DIA_WULFGAR_TEACH(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 7;
	condition = dia_wulfgar_teach_condition;
	information = dia_wulfgar_teach_info;
	permanent = TRUE;
	description = "Zacznijmy trening.";
};


func int dia_wulfgar_teach_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_wulfgar_teach_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Teach_15_00");	//Zacznijmy trening.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_Add_04_00");	//Nie trenuj� najemnik�w!
	}
	else
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Wulfgar_Add_04_01");	//Oczywi�cie, wielebny.
		};
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_back()
{
	Info_ClearChoices(dia_wulfgar_teach);
};

func void dia_wulfgar_teach_1h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,75))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_1h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,75))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,75))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,75))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};


instance DIA_WULFGAR_ALSMIL(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 1;
	condition = dia_wulfgar_alsmil_condition;
	information = dia_wulfgar_alsmil_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wulfgar_alsmil_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_wulfgar_alsmil_info()
{
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_00");	//M�wisz wi�c, �e Lord Andre przyj�� ci� na s�u�b�!
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_01");	//Mam nadziej�, �e b�dziesz tu przychodzi� i trenowa� regularnie.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_02");	//Ruga b�dzie twoim nauczycielem kusznictwa, natomiast Mortis poka�e ci, jak zwi�kszy� si��.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_03");	//Jednak najwa�niejszym aspektem treningu jest porz�dne nauczenie si� machania mieczem.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_04");	//Jeszcze b�dzie z ciebie niez�y wojownik, masz moje s�owo!
};


instance DIA_WULFGAR_BONUS(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 2;
	condition = dia_wulfgar_bonus_condition;
	information = dia_wulfgar_bonus_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wulfgar_bonus_condition()
{
	if(Npc_IsInState(self,zs_talk) && Wld_IsTime(5,2,6,54))
	{
		return TRUE;
	};
};

func void dia_wulfgar_bonus_info()
{
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_00");	//Tak wcze�nie na nogach. Z regu�y o tej porze nikt mnie nie odwiedza. No, ale skoro ju� tu jeste�, to mo�e warto ci� czego� nauczy�.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_01");	//S�uchaj wi�c uwa�nie. Mo�esz wyprowadzi� swych przeciwnik�w w pole, unikaj�c ich cios�w i atakuj�c w odpowiednim momencie.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_02");	//Pami�taj o tym podczas kolejnej walki.
	b_raisefighttalent(other,NPC_TALENT_1H,2);
};


instance DIA_WULFGAR_PICKPOCKET(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 900;
	condition = dia_wulfgar_pickpocket_condition;
	information = dia_wulfgar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_wulfgar_pickpocket_condition()
{
	return c_beklauen(58,80);
};

func void dia_wulfgar_pickpocket_info()
{
	Info_ClearChoices(dia_wulfgar_pickpocket);
	Info_AddChoice(dia_wulfgar_pickpocket,DIALOG_BACK,dia_wulfgar_pickpocket_back);
	Info_AddChoice(dia_wulfgar_pickpocket,DIALOG_PICKPOCKET,dia_wulfgar_pickpocket_doit);
};

func void dia_wulfgar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wulfgar_pickpocket);
};

func void dia_wulfgar_pickpocket_back()
{
	Info_ClearChoices(dia_wulfgar_pickpocket);
};

