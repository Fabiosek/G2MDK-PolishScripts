
instance DIA_ADDON_SAWPIRATE_EXIT(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 999;
	condition = dia_addon_sawpirate_exit_condition;
	information = dia_addon_sawpirate_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_sawpirate_exit_condition()
{
	return TRUE;
};

func void dia_addon_sawpirate_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SAWPIRATE_HELLO(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 1;
	condition = dia_addon_sawpirate_hello_condition;
	information = dia_addon_sawpirate_hello_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_addon_sawpirate_hello_condition()
{
	return TRUE;
};

func void dia_addon_sawpirate_hello_info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_Hello_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Addon_SawPirate_Hello_09_01");	//Przesta� mi zawraca� g�ow�!
};


instance DIA_ADDON_SAWPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 11;
	condition = dia_addon_sawpirate_anheuern_condition;
	information = dia_addon_sawpirate_anheuern_info;
	permanent = FALSE;
	description = "Jeste� jednym z ch�opak�w Henry'ego?";
};


func int dia_addon_sawpirate_anheuern_condition()
{
	if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_00");	//Jeste� jednym z ch�opak�w Henry'ego?
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_01");	//Nie, tak sobie pi�uj� dla zabawy! Naprawd�!
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_02");	//Co si� dzieje? Henry nie powiedzia� ci, co masz robi�?
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_04");	//Tak, powiedzia�, �e mam zaj�� si� bandytami.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_03");	//Ooo nie! Nie patrz tak na mnie! Nie chc� mie� z tym nic wsp�lnego!
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_04");	//Lepiej b�dzie, jak wr�c� do roboty, dobra?
};


var int sawpirate_comeon_once;

instance DIA_ADDON_SAWPIRATE_COMEON(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 12;
	condition = dia_addon_sawpirate_comeon_condition;
	information = dia_addon_sawpirate_comeon_info;
	permanent = TRUE;
	description = "Chod� ze mn�.";
};


func int dia_addon_sawpirate_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_HENRY_FREEBDTTOWER == LOG_RUNNING) && (c_towerbanditsdead() == FALSE) && Npc_KnowsInfo(other,dia_addon_sawpirate_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_ComeOn_15_00");	//Chod� ze mn�.
	if(hammerpirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_01");	//Czemu? Masz ju� kogo� do pomocy...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_04");	//Najpierw p�jdziemy kawa�ek w kierunku obozu.
		AI_StopProcessInfos(self);
	}
	else if(!Npc_IsDead(hammerpirate) && (SAWPIRATE_COMEON_ONCE == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_02");	//Jakby innych nie by�o...
		SAWPIRATE_COMEON_ONCE = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_03");	//Dobrze, dobrze...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_SAWPIRATE_GOHOME(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 13;
	condition = dia_addon_sawpirate_gohome_condition;
	information = dia_addon_sawpirate_gohome_info;
	permanent = TRUE;
	description = "Nie potrzebuj� ju� twojej pomocy.";
};


func int dia_addon_sawpirate_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_GoHome_15_00");	//Nie potrzebuj� ju� twojej pomocy.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_01");	//To wr�c� do pi�owania.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_SAWPIRATE_TOOFAR(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 14;
	condition = dia_addon_sawpirate_toofar_condition;
	information = dia_addon_sawpirate_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_sawpirate_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_SawPirate_TooFar_09_01");	//Oddalili�my si� zbytnio od obozu.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_02");	//Nie podoba mi si� to. Lepiej wr�c�.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SAWPIRATE_SUCCESS(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 14;
	condition = dia_addon_sawpirate_success_condition;
	information = dia_addon_sawpirate_success_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_sawpirate_success_condition()
{
	if((c_towerbanditsdead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_success_info()
{
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_01");	//Kawa� drania z ciebie.
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_02");	//Wracam do obozu. Mam nadziej�, �e ju� si� nie spotkamy!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

