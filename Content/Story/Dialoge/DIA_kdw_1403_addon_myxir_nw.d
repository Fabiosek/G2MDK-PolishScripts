
instance DIA_ADDON_MYXIR_EXIT(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 999;
	condition = dia_addon_myxir_exit_condition;
	information = dia_addon_myxir_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_myxir_exit_condition()
{
	return TRUE;
};

func void dia_addon_myxir_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MYXIR_HALLO(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 5;
	condition = dia_addon_myxir_hallo_condition;
	information = dia_addon_myxir_hallo_info;
	description = "Wszystko w porz�dku?";
};


func int dia_addon_myxir_hallo_condition()
{
	return TRUE;
};

func void dia_addon_myxir_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Hallo_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Addon_Myxir_Hallo_12_01");	//Masz du�o odwagi, pokazuj�c si� tu.
};


instance DIA_ADDON_MYXIR_WASMACHSTDU(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 5;
	condition = dia_addon_myxir_wasmachstdu_condition;
	information = dia_addon_myxir_wasmachstdu_info;
	description = "Co tu robisz?";
};


func int dia_addon_myxir_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_myxir_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WasMachstDu_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_01");	//Ucz� si� j�zyka budowniczych.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_02");	//J�zyk jest kluczem do wiedzy tego staro�ytnego ludu.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_03");	//Ka�dy z nas musi si� go nauczy�, inaczej ta ekspedycja dobiegnie ko�ca, zanim si� zacznie.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_04");	//Budowniczowie u�ywali kamiennych tabliczek do przekazywania swojej wiedzy. Niestety, wiele z nich zniszczono lub skradziono dawno temu.
};


instance DIA_ADDON_MYXIR_STEINTAFELN(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 5;
	condition = dia_addon_myxir_steintafeln_condition;
	information = dia_addon_myxir_steintafeln_info;
	description = "Co zapisano na tych kamiennych tablicach?";
};


func int dia_addon_myxir_steintafeln_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_myxir_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_steintafeln_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Steintafeln_15_00");	//Co zapisano na tych kamiennych tablicach?
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_01");	//Zawieraj� w sobie ca�� wiedz� staro�ytnych.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_02");	//Niekt�rzy z nich za pomoc� zakl�� zwi�kszali sw� znajomo�� magii i walki.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_03");	//Dla kogo�, kto potrafi odczyta� tablice, to prawdziwy skarb.
	Log_CreateTopic(TOPIC_ADDON_STONEPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATES,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATES,"Na kamiennych tablicach spisano wiedz� staro�ytnego ludu budowniczych. Dzi�ki niekt�rym z tych tablic mo�na zwi�kszy� swoje umiej�tno�ci bojowe i znajomo�� magii, ale trzeba je umie� odczyta�.");
};


instance DIA_ADDON_MYXIR_WILLYOUTEACHME(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 10;
	condition = dia_addon_myxir_willyouteachme_condition;
	information = dia_addon_myxir_willyouteachme_info;
	description = "Mo�esz mnie nauczy� czytania w tym dawnym j�zyku?";
};


func int dia_addon_myxir_willyouteachme_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_myxir_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_willyouteachme_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WillYouTeachMe_15_00");	//Mo�esz mnie nauczy� czytania w tym dawnym j�zyku?
	AI_Output(self,other,"DIA_Addon_Myxir_WillYouTeachMe_12_01");	//Czemu nie? Przeka�� ci moj� wiedz�.
	MYXIR_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_ADDON_STONEPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATES,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATES,LOGTEXT_ADDON_MYXIRTEACH);
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_MYXIRTEACH);
};


instance DIA_ADDON_MYXIR_TEACH(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 90;
	condition = dia_addon_myxir_teach_condition;
	information = dia_addon_myxir_teach_info;
	permanent = TRUE;
	description = "Naucz mnie tego dziwnego j�zyka.";
};


var int dia_addon_myxir_teach_noperm;

func int dia_addon_myxir_teach_condition()
{
	if((MYXIR_ADDON_TEACHPLAYER == TRUE) && (DIA_ADDON_MYXIR_TEACH_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_teach_info()
{
	b_dia_addon_myxir_teachrequest();
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(dia_addon_myxir_teach);
		Info_AddChoice(dia_addon_myxir_teach,DIALOG_BACK,dia_addon_myxir_teach_back);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		b_dia_addon_myxir_teachl1();
		Info_AddChoice(dia_addon_myxir_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_1,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),dia_addon_myxir_teach_language_1);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		b_dia_addon_myxir_teachl2();
		Info_AddChoice(dia_addon_myxir_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_2,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),dia_addon_myxir_teach_language_2);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		b_dia_addon_myxir_teachl3();
		Info_AddChoice(dia_addon_myxir_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_3,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),dia_addon_myxir_teach_language_3);
	}
	else
	{
		b_dia_addon_myxir_teachnomore();
		DIA_ADDON_MYXIR_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_myxir_teach_language_x()
{
	b_dia_addon_myxir_teach_language_x();
};

func void dia_addon_myxir_teach_back()
{
	Info_ClearChoices(dia_addon_myxir_teach);
};

func void dia_addon_myxir_teach_language_1()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_1))
	{
		dia_addon_myxir_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_teach);
};

func void dia_addon_myxir_teach_language_2()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_2))
	{
		dia_addon_myxir_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_teach);
};

func void dia_addon_myxir_teach_language_3()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_3))
	{
		dia_addon_myxir_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_teach);
};

