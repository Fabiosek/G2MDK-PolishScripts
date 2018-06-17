
instance DIA_PARLAF_EXIT(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 999;
	condition = dia_parlaf_exit_condition;
	information = dia_parlaf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlaf_exit_condition()
{
	return TRUE;
};

func void dia_parlaf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARLAF_HALLO(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 1;
	condition = dia_parlaf_hallo_condition;
	information = dia_parlaf_hallo_info;
	description = "Hej! Co u ciebie?";
};


func int dia_parlaf_hallo_condition()
{
	return TRUE;
};

func void dia_parlaf_hallo_info()
{
	AI_Output(other,self,"DIA_Parlaf_HALLO_15_00");	//Hej! Co u ciebie?
	AI_Output(self,other,"DIA_Parlaf_HALLO_03_01");	//A jak ci siê wydaje? Ca³e dnie spêdzam przy toczydle, ostrz¹c broñ.
	if(Npc_IsDead(engor) == FALSE)
	{
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_02");	//Wczoraj Engor znów zmniejszy³ nam racje ¿ywnoœciowe. Jak tak dalej pójdzie - pozdychamy z g³odu.
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_03");	//Chyba ¿e wczeœniej powybijaj¹ nas orkowie. Tak czy siak - niemi³a perspektywa.
	};
};


instance DIA_PARLAF_ENGOR(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 2;
	condition = dia_parlaf_engor_condition;
	information = dia_parlaf_engor_info;
	description = "Kim jest Engor?";
};


func int dia_parlaf_engor_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlaf_hallo) && (Npc_IsDead(engor) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlaf_engor_info()
{
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_00");	//Kim jest Engor?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_01");	//Engor zarz¹dza zapasami i przydziela racje ¿ywnoœciowe. Co tydzieñ mniejsze.
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_02");	//Jasne, mo¿na siê z nim potargowaæ, ale do tego trzeba mieæ gotówkê.
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_03");	//A ciebie na to nie staæ?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_04");	//Z tego, co tu zarabiam, starcza najwy¿ej na kilka rzep.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	Log_AddEntry(TOPIC_TRADER_OC,"Engor zarz¹dza zapasami na zamku. Od czasu do czasu zdarza mu siê robiæ ma³e interesy na boku.");
};


instance DIA_PARLAF_WO(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 3;
	condition = dia_parlaf_wo_condition;
	information = dia_parlaf_wo_info;
	permanent = FALSE;
	description = "Gdzie znajdê tego Engora?";
};


func int dia_parlaf_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_parlaf_engor) && (Npc_IsDead(engor) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlaf_wo_info()
{
	AI_Output(other,self,"DIA_Parlaf_Wo_15_00");	//Gdzie znajdê tego Engora?
	AI_Output(self,other,"DIA_Parlaf_Wo_03_01");	//Jest w komnatach rycerzy. Dostaniesz siê tam przez najbli¿sze otwarte przejœcie obok kuŸni.
};


instance DIA_PARLAF_HUNGRIG(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 2;
	condition = dia_parlaf_hungrig_condition;
	information = dia_parlaf_hungrig_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_parlaf_hungrig_condition()
{
	if((MIS_ENGOR_BRINGMEAT != LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_parlaf_hallo) && (Npc_IsDead(engor) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlaf_hungrig_info()
{
	AI_Output(other,self,"DIA_Parlaf_HUNGRIG_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Parlaf_HUNGRIG_03_01");	//Ten cholerny Engor chce nas chyba zag³odziæ.
};


instance DIA_PARLAF_SATT(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 3;
	condition = dia_parlaf_satt_condition;
	information = dia_parlaf_satt_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_parlaf_satt_condition()
{
	if(((MIS_ENGOR_BRINGMEAT == LOG_SUCCESS) || Npc_IsDead(engor)) && Npc_KnowsInfo(hero,dia_parlaf_hallo))
	{
		return TRUE;
	};
};


var int dia_parlaf_satt_onetime;

func void dia_parlaf_satt_info()
{
	AI_Output(other,self,"DIA_Parlaf_SATT_15_00");	//Co s³ychaæ?
	if((DIA_PARLAF_SATT_ONETIME == FALSE) && (Npc_IsDead(engor) == FALSE))
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_01");	//Engor rozdzieli³ nowy zapas miêsa. Najwy¿szy czas.
		DIA_PARLAF_SATT_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_02");	//Oprócz twego przybycia, nie zdarzy³o siê nic ciekawego.
	};
};


instance DIA_PARLAF_PICKPOCKET(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 900;
	condition = dia_parlaf_pickpocket_condition;
	information = dia_parlaf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_parlaf_pickpocket_condition()
{
	return c_beklauen(34,12);
};

func void dia_parlaf_pickpocket_info()
{
	Info_ClearChoices(dia_parlaf_pickpocket);
	Info_AddChoice(dia_parlaf_pickpocket,DIALOG_BACK,dia_parlaf_pickpocket_back);
	Info_AddChoice(dia_parlaf_pickpocket,DIALOG_PICKPOCKET,dia_parlaf_pickpocket_doit);
};

func void dia_parlaf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_parlaf_pickpocket);
};

func void dia_parlaf_pickpocket_back()
{
	Info_ClearChoices(dia_parlaf_pickpocket);
};

