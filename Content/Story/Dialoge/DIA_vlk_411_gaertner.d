
instance DIA_GAERTNER_EXIT(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 999;
	condition = dia_gaertner_exit_condition;
	information = dia_gaertner_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gaertner_exit_condition()
{
	return TRUE;
};

func void dia_gaertner_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAERTNER_PICKPOCKET(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 900;
	condition = dia_gaertner_pickpocket_condition;
	information = dia_gaertner_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gaertner_pickpocket_condition()
{
	return c_beklauen(40,50);
};

func void dia_gaertner_pickpocket_info()
{
	Info_ClearChoices(dia_gaertner_pickpocket);
	Info_AddChoice(dia_gaertner_pickpocket,DIALOG_BACK,dia_gaertner_pickpocket_back);
	Info_AddChoice(dia_gaertner_pickpocket,DIALOG_PICKPOCKET,dia_gaertner_pickpocket_doit);
};

func void dia_gaertner_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gaertner_pickpocket);
};

func void dia_gaertner_pickpocket_back()
{
	Info_ClearChoices(dia_gaertner_pickpocket);
};


instance DIA_GAERTNER_JOB(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_job_condition;
	information = dia_gaertner_job_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_gaertner_job_condition()
{
	return TRUE;
};

func void dia_gaertner_job_info()
{
	AI_Output(other,self,"DIA_Gaertner_Job_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Gaertner_Job_09_01");	//A jak s�dzisz, h�? Jestem ogrodnikiem, zajmuj� si� ogrodem.
	AI_Output(other,self,"DIA_Gaertner_Job_15_02");	//Nie masz tu zbyt wiele towarzystwa, co?
	AI_Output(self,other,"DIA_Gaertner_Job_09_03");	//Nie, i dobrze mi z tym. Przynajmniej mam spok�j.
	AI_Output(self,other,"DIA_Gaertner_Job_09_04");	//Raz chcieli mnie wpakowa� do Kolonii za zab�jstwo jednego go�cia.
	AI_Output(self,other,"DIA_Gaertner_Job_09_05");	//Ale poniewa� gubernator Larius potrzebowa� ogrodnika, pozwolili mi tu zosta�.
	AI_Output(self,other,"DIA_Gaertner_Job_09_06");	//Z czasem ten ogr�d sta� si� moim domem. Bardzo si� ciesz�, �e tak si� sta�o.
};


instance DIA_GAERTNER_PLANTS(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_plants_condition;
	information = dia_gaertner_plants_info;
	permanent = FALSE;
	description = "Czy hodujesz r�wnie� jakie� zio�a?";
};


func int dia_gaertner_plants_condition()
{
	if(Npc_KnowsInfo(other,dia_gaertner_job))
	{
		return TRUE;
	};
};

func void dia_gaertner_plants_info()
{
	AI_Output(other,self,"DIA_Gaertner_Plants_15_00");	//Czy hodujesz r�wnie� jakie� zio�a?
	AI_Output(self,other,"DIA_Gaertner_Plants_09_01");	//Nawet kilka. Mam tutaj ogniste ziele i ogniste pokrzywy. Pr�bowa�em te� hodowa� bagienne ziele, ale nie za bardzo chce rosn�� w tych warunkach.
	AI_Output(self,other,"DIA_Gaertner_Plants_09_02");	//Mam troch� �wie�o �ci�tych ro�lin, wi�c gdyby� chcia� co� kupi�...
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Ogrodnik gubernatora mo�e mi sprzeda� ro�liny.");
};


instance DIA_GAERTNER_TRADE(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_trade_condition;
	information = dia_gaertner_trade_info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
	trade = TRUE;
};


func int dia_gaertner_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_gaertner_plants))
	{
		return TRUE;
	};
};

func void dia_gaertner_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Gaertner_Trade_15_00");	//Poka� mi swoje towary.
};


instance DIA_GAERTNER_KRAUTABAK(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_krautabak_condition;
	information = dia_gaertner_krautabak_info;
	permanent = FALSE;
	description = "Mam tu troch� ziela.";
};


func int dia_gaertner_krautabak_condition()
{
	if((Npc_HasItems(other,itmi_sumpftabak) >= 1) && Wld_IsTime(6,45,21,45))
	{
		return TRUE;
	};
};

func void dia_gaertner_krautabak_info()
{
	AI_Output(other,self,"DIA_Gaertner_Krautabak_15_00");	//Mam tu troch� ziela. Chcesz sobie zapali�?
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_01");	//Sam nie wiem... A zreszt�, dawaj je tutaj. Skr�c� sobie jednego.
	b_giveinvitems(other,self,itmi_sumpftabak,1);
	Npc_RemoveInvItems(self,itmi_sumpftabak,1);
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_02");	//Kh... kh.... Kh....
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_03");	//Mocny towar. Chyba ju� mi wystarczy.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GAERTNER_SIGN(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 6;
	condition = dia_gaertner_sign_condition;
	information = dia_gaertner_sign_info;
	permanent = FALSE;
	description = "(Poka� z�odziejski gest)";
};


func int dia_gaertner_sign_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_gaertner_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Gaertner_Sign_09_00");	//A wi�c jeste� jednym z nas. Mam dla ciebie po�yteczn� wskaz�wk�.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_01");	//W okolicznych domach bardzo cz�sto znajdziesz skrytki, otwierane przez naci�ni�cie ukrytego przycisku.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_02");	//Ludzie zwykle trzymaj� w nich kosztowno�ci.
};

