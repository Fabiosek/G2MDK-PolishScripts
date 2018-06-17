
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
	AI_Output(self,other,"DIA_Gaertner_Job_09_01");	//A jak s¹dzisz, hê? Jestem ogrodnikiem, zajmujê siê ogrodem.
	AI_Output(other,self,"DIA_Gaertner_Job_15_02");	//Nie masz tu zbyt wiele towarzystwa, co?
	AI_Output(self,other,"DIA_Gaertner_Job_09_03");	//Nie, i dobrze mi z tym. Przynajmniej mam spokój.
	AI_Output(self,other,"DIA_Gaertner_Job_09_04");	//Raz chcieli mnie wpakowaæ do Kolonii za zabójstwo jednego goœcia.
	AI_Output(self,other,"DIA_Gaertner_Job_09_05");	//Ale poniewa¿ gubernator Larius potrzebowa³ ogrodnika, pozwolili mi tu zostaæ.
	AI_Output(self,other,"DIA_Gaertner_Job_09_06");	//Z czasem ten ogród sta³ siê moim domem. Bardzo siê cieszê, ¿e tak siê sta³o.
};


instance DIA_GAERTNER_PLANTS(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_plants_condition;
	information = dia_gaertner_plants_info;
	permanent = FALSE;
	description = "Czy hodujesz równie¿ jakieœ zio³a?";
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
	AI_Output(other,self,"DIA_Gaertner_Plants_15_00");	//Czy hodujesz równie¿ jakieœ zio³a?
	AI_Output(self,other,"DIA_Gaertner_Plants_09_01");	//Nawet kilka. Mam tutaj ogniste ziele i ogniste pokrzywy. Próbowa³em te¿ hodowaæ bagienne ziele, ale nie za bardzo chce rosn¹æ w tych warunkach.
	AI_Output(self,other,"DIA_Gaertner_Plants_09_02");	//Mam trochê œwie¿o œciêtych roœlin, wiêc gdybyœ chcia³ coœ kupiæ...
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Ogrodnik gubernatora mo¿e mi sprzedaæ roœliny.");
};


instance DIA_GAERTNER_TRADE(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_trade_condition;
	information = dia_gaertner_trade_info;
	permanent = TRUE;
	description = "Poka¿ mi swoje towary.";
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
	AI_Output(other,self,"DIA_Gaertner_Trade_15_00");	//Poka¿ mi swoje towary.
};


instance DIA_GAERTNER_KRAUTABAK(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_krautabak_condition;
	information = dia_gaertner_krautabak_info;
	permanent = FALSE;
	description = "Mam tu trochê ziela.";
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
	AI_Output(other,self,"DIA_Gaertner_Krautabak_15_00");	//Mam tu trochê ziela. Chcesz sobie zapaliæ?
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_01");	//Sam nie wiem... A zreszt¹, dawaj je tutaj. Skrêcê sobie jednego.
	b_giveinvitems(other,self,itmi_sumpftabak,1);
	Npc_RemoveInvItems(self,itmi_sumpftabak,1);
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_02");	//Kh... kh.... Kh....
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_03");	//Mocny towar. Chyba ju¿ mi wystarczy.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GAERTNER_SIGN(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 6;
	condition = dia_gaertner_sign_condition;
	information = dia_gaertner_sign_info;
	permanent = FALSE;
	description = "(Poka¿ z³odziejski gest)";
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
	AI_Output(self,other,"DIA_Gaertner_Sign_09_00");	//A wiêc jesteœ jednym z nas. Mam dla ciebie po¿yteczn¹ wskazówkê.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_01");	//W okolicznych domach bardzo czêsto znajdziesz skrytki, otwierane przez naciœniêcie ukrytego przycisku.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_02");	//Ludzie zwykle trzymaj¹ w nich kosztownoœci.
};

