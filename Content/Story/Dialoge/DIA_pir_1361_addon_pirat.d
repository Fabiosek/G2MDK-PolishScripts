
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
	description = "Co s³ychaæ?";
};


func int dia_addon_sawpirate_hello_condition()
{
	return TRUE;
};

func void dia_addon_sawpirate_hello_info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_Hello_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Addon_SawPirate_Hello_09_01");	//Przestañ mi zawracaæ g³owê!
};


instance DIA_ADDON_SAWPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 11;
	condition = dia_addon_sawpirate_anheuern_condition;
	information = dia_addon_sawpirate_anheuern_info;
	permanent = FALSE;
	description = "Jesteœ jednym z ch³opaków Henry'ego?";
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
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_00");	//Jesteœ jednym z ch³opaków Henry'ego?
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_01");	//Nie, tak sobie pi³ujê dla zabawy! Naprawdê!
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_02");	//Co siê dzieje? Henry nie powiedzia³ ci, co masz robiæ?
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_04");	//Tak, powiedzia³, ¿e mam zaj¹æ siê bandytami.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_03");	//Ooo nie! Nie patrz tak na mnie! Nie chcê mieæ z tym nic wspólnego!
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_04");	//Lepiej bêdzie, jak wrócê do roboty, dobra?
};


var int sawpirate_comeon_once;

instance DIA_ADDON_SAWPIRATE_COMEON(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 12;
	condition = dia_addon_sawpirate_comeon_condition;
	information = dia_addon_sawpirate_comeon_info;
	permanent = TRUE;
	description = "ChodŸ ze mn¹.";
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
	AI_Output(other,self,"DIA_Addon_SawPirate_ComeOn_15_00");	//ChodŸ ze mn¹.
	if(hammerpirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_01");	//Czemu? Masz ju¿ kogoœ do pomocy...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_04");	//Najpierw pójdziemy kawa³ek w kierunku obozu.
		AI_StopProcessInfos(self);
	}
	else if(!Npc_IsDead(hammerpirate) && (SAWPIRATE_COMEON_ONCE == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_02");	//Jakby innych nie by³o...
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
	description = "Nie potrzebujê ju¿ twojej pomocy.";
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
	AI_Output(other,self,"DIA_Addon_SawPirate_GoHome_15_00");	//Nie potrzebujê ju¿ twojej pomocy.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_01");	//To wrócê do pi³owania.
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
	AI_Output(self,other,"DIA_Addon_SawPirate_TooFar_09_01");	//Oddaliliœmy siê zbytnio od obozu.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_02");	//Nie podoba mi siê to. Lepiej wrócê.
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
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_01");	//Kawa³ drania z ciebie.
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_02");	//Wracam do obozu. Mam nadziejê, ¿e ju¿ siê nie spotkamy!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

