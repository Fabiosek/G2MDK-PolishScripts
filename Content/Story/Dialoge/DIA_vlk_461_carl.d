
instance DIA_CARL_EXIT(C_INFO)
{
	npc = vlk_461_carl;
	nr = 999;
	condition = dia_carl_exit_condition;
	information = dia_carl_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_carl_exit_condition()
{
	return TRUE;
};

func void dia_carl_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_carlsayhallo()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_00");	//Wygl¹da na to, ¿e mamy w mieœcie kilku z³odziei, którzy okradaj¹ bogaczy.
	AI_Output(self,other,"DIA_Carl_Hallo_05_01");	//Stra¿ miejska przetrz¹snê³a ostatnio dzielnicê portow¹, ale nie uda³o im siê niczego znaleŸæ.
};


instance DIA_CARL_PICKPOCKET(C_INFO)
{
	npc = vlk_461_carl;
	nr = 900;
	condition = dia_carl_pickpocket_condition;
	information = dia_carl_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_carl_pickpocket_condition()
{
	return c_beklauen(34,40);
};

func void dia_carl_pickpocket_info()
{
	Info_ClearChoices(dia_carl_pickpocket);
	Info_AddChoice(dia_carl_pickpocket,DIALOG_BACK,dia_carl_pickpocket_back);
	Info_AddChoice(dia_carl_pickpocket,DIALOG_PICKPOCKET,dia_carl_pickpocket_doit);
};

func void dia_carl_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_carl_pickpocket);
};

func void dia_carl_pickpocket_back()
{
	Info_ClearChoices(dia_carl_pickpocket);
};


instance DIA_CARL_HALLO(C_INFO)
{
	npc = vlk_461_carl;
	nr = 2;
	condition = dia_carl_hallo_condition;
	information = dia_carl_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_carl_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_carl_hallo_info()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_02");	//Co ciê sprowadza do tej biednej dzielnicy? Czego tu szukasz?
	Info_ClearChoices(dia_carl_hallo);
	Info_AddChoice(dia_carl_hallo,"Zab³¹dzi³em.",dia_carl_hallo_verlaufen);
	Info_AddChoice(dia_carl_hallo,"Tylko siê rozgl¹dam.",dia_carl_hallo_umsehen);
};

func void dia_carl_hallo_verlaufen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_verlaufen_15_00");	//Zab³¹dzi³em.
	AI_Output(self,other,"DIA_Carl_Hallo_verlaufen_05_01");	//Wiêc lepiej uwa¿aj, ¿eby ciê ktoœ nie obrabowa³.
	b_carlsayhallo();
	Info_ClearChoices(dia_carl_hallo);
};

func void dia_carl_hallo_umsehen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_umsehen_15_00");	//Tylko siê rozgl¹dam.
	AI_Output(self,other,"DIA_Carl_Hallo_umsehen_05_01");	//Ha. Wiêc lepiej, ¿eby nikt ciê nie z³apa³ na tym ca³ym rozgl¹daniu.
	b_carlsayhallo();
	Info_ClearChoices(dia_carl_hallo);
};


instance DIA_CARL_DIEBE(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_diebe_condition;
	information = dia_carl_diebe_info;
	permanent = FALSE;
	description = "Co chcesz wiedzieæ o tych z³odziejach?";
};


func int dia_carl_diebe_condition()
{
	return TRUE;
};

func void dia_carl_diebe_info()
{
	AI_Output(other,self,"DIA_Carl_Diebe_15_00");	//Co chcesz wiedzieæ o tych z³odziejach?
	AI_Output(self,other,"DIA_Carl_Diebe_05_01");	//Nic. Ale wszyscy obywatele s¹ wystraszeni i stali siê nieufni - szczególnie wzglêdem obcych.
	AI_Output(self,other,"DIA_Carl_Diebe_05_02");	//Nie daj siê z³apaæ w cudzym domu - nikt nie zareaguje na to uprzejmoœci¹.
	AI_Output(self,other,"DIA_Carl_Diebe_05_03");	//Tak, trzeba siê broniæ przed z³odziejami. Najlepiej nadaje siê do tego solidna pa³ka.
};


instance DIA_CARL_LERNEN(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_lernen_condition;
	information = dia_carl_lernen_info;
	permanent = FALSE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_carl_lernen_condition()
{
	return TRUE;
};

func void dia_carl_lernen_info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Carl_Lernen_05_01");	//Och, robiê okucia i gwoŸdzie. Naprawiam te¿ metalowe czêœci.
	AI_Output(self,other,"DIA_Carl_Lernen_05_02");	//Nie znam siê jednak na wyrobie broni dostatecznie dobrze, ¿eby ciê uczyæ.
	AI_Output(self,other,"DIA_Carl_Lernen_05_03");	//Je¿eli chcesz siê tego nauczyæ, to idŸ do Harada. On na pewno wie, jak siê wykuwa broñ!
	AI_Output(self,other,"DIA_Carl_Lernen_05_04");	//Jeœli jednak chcesz popracowaæ trochê nad swoimi miêœniami, to mogê ci w tym pomóc.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Carl, kowal z dzielnicy portowej, mo¿e mi pokazaæ, jak staæ siê silniejszym.");
};


instance DIA_CARL_WIEVIEL(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_wieviel_condition;
	information = dia_carl_wieviel_info;
	permanent = FALSE;
	description = "Ile sobie liczysz za trening?";
};


func int dia_carl_wieviel_condition()
{
	if(Npc_KnowsInfo(other,dia_carl_lernen))
	{
		return TRUE;
	};
};

func void dia_carl_wieviel_info()
{
	AI_Output(other,self,"DIA_Carl_Wieviel_15_00");	//Ile sobie liczysz za trening?
	if(Npc_KnowsInfo(other,dia_edda_statue))
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_01");	//S³ysza³em, co zrobi³eœ dla Eddy. Wyszkolê ciê za darmo.
		CARL_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_02");	//50 sztuk z³ota i pomogê ci nabraæ si³.
	};
};


instance DIA_CARL_BEZAHLEN(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_bezahlen_condition;
	information = dia_carl_bezahlen_info;
	permanent = TRUE;
	description = "Chcia³bym z tob¹ trenowaæ (zap³aæ 50 sztuk z³ota).";
};


func int dia_carl_bezahlen_condition()
{
	if(Npc_KnowsInfo(other,dia_carl_wieviel) && (CARL_TEACHSTR == FALSE))
	{
		return TRUE;
	};
};

func void dia_carl_bezahlen_info()
{
	AI_Output(other,self,"DIA_Carl_bezahlen_15_00");	//Chcê z tob¹ æwiczyæ.
	if(Npc_KnowsInfo(other,dia_edda_statue))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_01");	//S³ysza³em, co zrobi³eœ dla Eddy. Wyszkolê ciê za darmo.
		CARL_TEACHSTR = TRUE;
	}
	else if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_02");	//Dobrze, mo¿emy zacz¹æ, gdy tylko bêdziesz gotowy.
		CARL_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//Zdob¹dŸ z³oto, wtedy ciê wyszkolê.
	};
};


instance DIA_CARL_TEACH(C_INFO)
{
	npc = vlk_461_carl;
	nr = 7;
	condition = dia_carl_teach_condition;
	information = dia_carl_teach_info;
	permanent = TRUE;
	description = "Chcê byæ silniejszy.";
};


func int dia_carl_teach_condition()
{
	if(CARL_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_carl_teach_info()
{
	AI_Output(other,self,"DIA_Carl_Teach_15_00");	//Chcê byæ silniejszy.
	Info_ClearChoices(dia_carl_teach);
	Info_AddChoice(dia_carl_teach,DIALOG_BACK,dia_carl_teach_back);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_carl_teach_str_1);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_carl_teach_str_5);
};

func void dia_carl_teach_back()
{
	Info_ClearChoices(dia_carl_teach);
};

func void dia_carl_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(dia_carl_teach);
	Info_AddChoice(dia_carl_teach,DIALOG_BACK,dia_carl_teach_back);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_carl_teach_str_1);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_carl_teach_str_5);
};

func void dia_carl_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(dia_carl_teach);
	Info_AddChoice(dia_carl_teach,DIALOG_BACK,dia_carl_teach_back);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_carl_teach_str_1);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_carl_teach_str_5);
};

