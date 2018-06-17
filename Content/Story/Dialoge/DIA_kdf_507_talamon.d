
instance DIA_TALAMON_KAP1_EXIT(C_INFO)
{
	npc = kdf_507_talamon;
	nr = 999;
	condition = dia_talamon_kap1_exit_condition;
	information = dia_talamon_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talamon_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_talamon_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


const string KDF_507_CHECKPOINT = "NW_MONASTERY_SEALROOM_01";

instance DIA_KDF_507_TALAMON_FIRSTWARN(C_INFO)
{
	npc = kdf_507_talamon;
	nr = 1;
	condition = dia_kdf_507_talamon_firstwarn_condition;
	information = dia_kdf_507_talamon_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_kdf_507_talamon_firstwarn_condition()
{
	if((PYROKAR_LETYOUPASSTALAMON == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void dia_kdf_507_talamon_firstwarn_info()
{
	AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_04_00");	//Nie wolno ci iœæ dalej. Zawróæ!
	AI_StopProcessInfos(self);
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,KDF_507_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_KDF_507_TALAMON_SECONDWARN(C_INFO)
{
	npc = kdf_507_talamon;
	nr = 2;
	condition = dia_kdf_507_talamon_secondwarn_condition;
	information = dia_kdf_507_talamon_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_kdf_507_talamon_secondwarn_condition()
{
	if((PYROKAR_LETYOUPASSTALAMON == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,KDF_507_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_kdf_507_talamon_secondwarn_info()
{
	AI_Output(self,other,"DIA_KDF_507_Talamon_SecondWarn_04_00");	//Innos ukarze ciê kl¹tw¹, jeœli nie zawrócisz!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,KDF_507_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_KDF_507_TALAMON_ATTACK(C_INFO)
{
	npc = kdf_507_talamon;
	nr = 3;
	condition = dia_kdf_507_talamon_attack_condition;
	information = dia_kdf_507_talamon_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_kdf_507_talamon_attack_condition()
{
	if((PYROKAR_LETYOUPASSTALAMON == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,KDF_507_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_kdf_507_talamon_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
};


instance DIA_TALAMON_KAP2_EXIT(C_INFO)
{
	npc = kdf_507_talamon;
	nr = 999;
	condition = dia_talamon_kap2_exit_condition;
	information = dia_talamon_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talamon_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_talamon_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALAMON_KAP3_EXIT(C_INFO)
{
	npc = kdf_507_talamon;
	nr = 999;
	condition = dia_talamon_kap3_exit_condition;
	information = dia_talamon_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talamon_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_talamon_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALAMON_KAP4_EXIT(C_INFO)
{
	npc = kdf_507_talamon;
	nr = 999;
	condition = dia_talamon_kap4_exit_condition;
	information = dia_talamon_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talamon_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_talamon_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALAMON_KAP5_STOP(C_INFO)
{
	npc = kdf_507_talamon;
	nr = 50;
	condition = dia_talamon_kap5_stop_condition;
	information = dia_talamon_kap5_stop_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_talamon_kap5_stop_condition()
{
	if(PYROKAR_LETYOUPASSTALAMON == TRUE)
	{
		return TRUE;
	};
};

func void dia_talamon_kap5_stop_info()
{
	AI_Output(self,other,"DIA_Talamon_KAP5_Stop_04_00");	//Nie wolno ci iœæ dalej. Zawróæ!
	AI_Output(other,self,"DIA_Talamon_KAP5_Stop_15_01");	//Pyrokar mówi, ¿e mogê przestudiowaæ ksiêgê Xardasa.
	AI_Output(self,other,"DIA_Talamon_KAP5_Stop_04_02");	//Tak mówi. W takim razie, mo¿esz wejœæ. Ksiêga, której szukasz, znajduje siê na ³awie alchemika.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Talamon trzyma³ ksiêgê Xardasa na stole alchemicznym w piwnicy.");
};


instance DIA_TALAMON_FOUNDSECRETDOOR(C_INFO)
{
	npc = kdf_507_talamon;
	nr = 51;
	condition = dia_talamon_foundsecretdoor_condition;
	information = dia_talamon_foundsecretdoor_info;
	permanent = FALSE;
	description = "Znalaz³em tajemne przejœcie.";
};


func int dia_talamon_foundsecretdoor_condition()
{
	if(SECRETLIBRARYISOPEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_talamon_foundsecretdoor_info()
{
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_00");	//Znalaz³em tajemne przejœcie.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_01");	//Jak? Gdzie?
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_02");	//Za rega³em z ksiêgami.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_03");	//Co siê za nim znajduje?
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_04");	//Wygl¹da to na star¹, podziemn¹ kryptê.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_05");	//To bardzo wa¿na informacja. Niezw³ocznie powiadomiê Pyrokara.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_06");	//W tym czasie musisz sprawdziæ, co kryj¹ piwnice.
	MIS_SCOUTLIBRARY = LOG_RUNNING;
};


instance DIA_TALAMON_SCOUTSECRETLIBRARY(C_INFO)
{
	npc = kdf_507_talamon;
	nr = 51;
	condition = dia_talamon_scoutsecretlibrary_condition;
	information = dia_talamon_scoutsecretlibrary_info;
	permanent = TRUE;
	description = "By³em w krypcie.";
};


func int dia_talamon_scoutsecretlibrary_condition()
{
	if((MIS_SCOUTLIBRARY == LOG_RUNNING) && (HEROWASINLIBRARY == TRUE))
	{
		return TRUE;
	};
};

func void dia_talamon_scoutsecretlibrary_info()
{
	AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_00");	//By³em w krypcie.
	AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_01");	//I co uda³o ci siê odnaleŸæ?
	if(Npc_IsDead(secretlibraryskeleton))
	{
		AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_02");	//By³ tam szkielet wojownika, pilnowa³ jakichœ drzwi. Zabi³em go.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_03");	//Dobra robota.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_04");	//Kiedy ju¿ zwyciê¿ymy z³o, zajmiemy siê krypt¹.
		MIS_SCOUTLIBRARY = LOG_SUCCESS;
		b_giveplayerxp(XP_SCOUTSECRETLIBRARY);
	}
	else
	{
		AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_05");	//Pe³no tam ró¿nych bestii.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_06");	//Coœ tam musi byæ, kontynuuj poszukiwania. A bestiom nie okazuj litoœci.
	};
};


instance DIA_TALAMON_KAP5_EXIT(C_INFO)
{
	npc = kdf_507_talamon;
	nr = 999;
	condition = dia_talamon_kap5_exit_condition;
	information = dia_talamon_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talamon_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_talamon_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALAMON_PICKPOCKET(C_INFO)
{
	npc = kdf_507_talamon;
	nr = 900;
	condition = dia_talamon_pickpocket_condition;
	information = dia_talamon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_talamon_pickpocket_condition()
{
	return c_beklauen(87,140);
};

func void dia_talamon_pickpocket_info()
{
	Info_ClearChoices(dia_talamon_pickpocket);
	Info_AddChoice(dia_talamon_pickpocket,DIALOG_BACK,dia_talamon_pickpocket_back);
	Info_AddChoice(dia_talamon_pickpocket,DIALOG_PICKPOCKET,dia_talamon_pickpocket_doit);
};

func void dia_talamon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_talamon_pickpocket);
};

func void dia_talamon_pickpocket_back()
{
	Info_ClearChoices(dia_talamon_pickpocket);
};

