
instance DIA_ADDON_HAMMERPIRATE_EXIT(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 999;
	condition = dia_addon_hammerpirate_exit_condition;
	information = dia_addon_hammerpirate_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_hammerpirate_exit_condition()
{
	return TRUE;
};

func void dia_addon_hammerpirate_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HAMMERPIRATE_HELLO(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 1;
	condition = dia_addon_hammerpirate_hello_condition;
	information = dia_addon_hammerpirate_hello_info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
};


func int dia_addon_hammerpirate_hello_condition()
{
	return TRUE;
};

func void dia_addon_hammerpirate_hello_info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_Hello_15_00");	//Wszystko w porz�dku?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(c_towerbanditsdead() == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_01");	//Pobili�my ich! Skurczybyki nie mia�y �adnych szans!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_02");	//No, wykrztu� to z siebie!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_03");	//Nie mam zamiaru si� miesza�.
	};
};


instance DIA_ADDON_HAMMERPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 11;
	condition = dia_addon_hammerpirate_anheuern_condition;
	information = dia_addon_hammerpirate_anheuern_info;
	permanent = FALSE;
	description = "Powiniene� mi pom�c.";
};


func int dia_addon_hammerpirate_anheuern_condition()
{
	if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_anheuern_info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_00");	//Nie musisz nic m�wi�. Chcesz, �ebym pom�g� ci walczy� z bandytami?
	AI_Output(other,self,"DIA_Addon_PIR_6_JoinHenry_15_08");	//Nie ma sprawy. M�wisz i masz.
	if(!Npc_IsDead(sawpirate))
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_01");	//Czemu nie poprosisz o pomoc kolesi pi�uj�cych drewno?
	};
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_02");	//W sumie... Nie mam ochoty na t� ca�� zabaw�.
};


instance DIA_ADDON_HAMMERPIRATE_COMEON(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 12;
	condition = dia_addon_hammerpirate_comeon_condition;
	information = dia_addon_hammerpirate_comeon_info;
	permanent = TRUE;
	description = "Chod� ze mn�.";
};


func int dia_addon_hammerpirate_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_HENRY_FREEBDTTOWER == LOG_RUNNING) && (c_towerbanditsdead() == FALSE) && Npc_KnowsInfo(other,dia_addon_hammerpirate_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_ComeOn_15_00");	//Chod� ze mn�.
	if(sawpirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_01");	//Henry chce, �eby jeden z nas zosta� tutaj. Rozumiesz?
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_02");	//P�jd�my kawa�ek w kierunku obozu.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_03");	//Tak, tak...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_HAMMERPIRATE_GOHOME(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 13;
	condition = dia_addon_hammerpirate_gohome_condition;
	information = dia_addon_hammerpirate_gohome_info;
	permanent = TRUE;
	description = "Nie potrzebuj� ju� twojej pomocy.";
};


func int dia_addon_hammerpirate_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_GoHome_15_00");	//Nie potrzebuj� ju� twojej pomocy.
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_01");	//Jak sobie �yczysz.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_HAMMERPIRATE_TOOFAR(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 14;
	condition = dia_addon_hammerpirate_toofar_condition;
	information = dia_addon_hammerpirate_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_hammerpirate_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_TooFar_07_01");	//Je�eli chcesz tam i��, to nie b�d� ci� zatrzymywa�.
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_02");	//Chyba wr�c�.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HAMMERPIRATE_SUCCESS(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 14;
	condition = dia_addon_hammerpirate_success_condition;
	information = dia_addon_hammerpirate_success_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_hammerpirate_success_condition()
{
	if((c_towerbanditsdead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_success_info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_01");	//Wiesz co? Troch� nad tym my�la�em i chyba masz racj�!
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_02");	//Wracam do obozu. Zobaczymy si� wkr�tce.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

