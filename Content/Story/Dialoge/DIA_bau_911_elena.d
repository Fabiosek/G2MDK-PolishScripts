
instance DIA_ELENA_EXIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 999;
	condition = dia_elena_exit_condition;
	information = dia_elena_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_elena_exit_condition()
{
	return TRUE;
};

func void dia_elena_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ELENA_HALLO(C_INFO)
{
	npc = bau_911_elena;
	nr = 1;
	condition = dia_elena_hallo_condition;
	information = dia_elena_hallo_info;
	permanent = FALSE;
	description = "Witaj, piêkna nieznajoma.";
};


func int dia_elena_hallo_condition()
{
	return TRUE;
};

func void dia_elena_hallo_info()
{
	AI_Output(other,self,"DIA_Elena_HALLO_15_00");	//Witaj, piêkna nieznajoma.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_01");	//Hmmm. Sk¹d uciek³eœ?
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_02");	//Czego chcesz?
	};
};


instance DIA_ELENA_AUFSTAND(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_aufstand_condition;
	information = dia_elena_aufstand_info;
	permanent = FALSE;
	description = "Podobno buntujecie siê przeciwko Królowi?";
};


func int dia_elena_aufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_aufstand_info()
{
	AI_Output(other,self,"DIA_Elena_Aufstand_15_00");	//Podobno buntujecie siê przeciwko Królowi?
	AI_Output(self,other,"DIA_Elena_Aufstand_16_01");	//Mój ojciec zadecydowa³, ¿e najwy¿szy czas zadbaæ o nasze bezpieczeñstwo.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Elena_Aufstand_16_02");	//Stra¿ i tak nigdy nam nie pomog³a. Interesowa³a ich tylko nasza spi¿arnia.
	};
};


instance DIA_ELENA_ARBEIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 3;
	condition = dia_elena_arbeit_condition;
	information = dia_elena_arbeit_info;
	permanent = FALSE;
	description = "Jakiego rodzaju prace prowadzone s¹ na farmie?";
};


func int dia_elena_arbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_elena_arbeit_info()
{
	AI_Output(other,self,"DIA_Elena_Arbeit_15_00");	//Jakiego rodzaju prace prowadzone s¹ na farmie?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_01");	//Mój ojciec p³aci wszystkim mê¿czyznom, którzy zgodz¹ siê broniæ farmy.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_02");	//Jesteœ zainteresowany? Nie wygl¹dasz na osobê, której marzeniem jest praca na roli.
	AI_Output(other,self,"DIA_Elena_Arbeit_15_03");	//Ile p³aci twój ojciec?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_04");	//Musisz to z nim uzgodniæ.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_05");	//Wiem tylko, ¿e ka¿dy najemnik codziennie dostaje pieni¹dze.
};


instance DIA_ELENA_REGELN(C_INFO)
{
	npc = bau_911_elena;
	nr = 4;
	condition = dia_elena_regeln_condition;
	information = dia_elena_regeln_info;
	permanent = FALSE;
	description = "Czy panuj¹ tutaj jakieœ zasady, o których powinienem pamiêtaæ?";
};


func int dia_elena_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_elena_regeln_info()
{
	AI_Output(other,self,"DIA_Elena_Regeln_15_00");	//Czy panuj¹ tutaj jakieœ zasady, o których powinienem pamiêtaæ?
	AI_Output(self,other,"DIA_Elena_Regeln_16_01");	//Nie dotykaj niczego, co nie nale¿y do ciebie.
	AI_Output(self,other,"DIA_Elena_Regeln_16_02");	//Trzymaj siê z daleka od nie swoich spraw.
	AI_Output(self,other,"DIA_Elena_Regeln_16_03");	//Jeœli wdasz siê w walkê, trzymaj siê najemników.
	AI_Output(self,other,"DIA_Elena_Regeln_16_04");	//Jeœli rozpoczniesz bójkê z miejscowymi ch³opami, wszyscy obróc¹ siê przeciwko tobie.
};


instance DIA_ELENA_AUFGABE(C_INFO)
{
	npc = bau_911_elena;
	nr = 5;
	condition = dia_elena_aufgabe_condition;
	information = dia_elena_aufgabe_info;
	permanent = FALSE;
	description = "Czym siê zajmujesz?";
};


func int dia_elena_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_aufgabe_info()
{
	AI_Output(other,self,"DIA_Elena_AUFGABE_15_00");	//Na czym polega twoja praca?
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_01");	//Sprzedajê towary produkowane na farmie. Gdybyœ chcia³ coœ kupiæ, daj mi znaæ.
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_02");	//Pozwól jednak, ¿e ciê ostrzegê. Nie znoszê z³odziei, jasne?
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Elena handluje na farmie Onara.");
};


var int elena_trade_mit_mir;

instance DIA_ELENA_TRADE(C_INFO)
{
	npc = bau_911_elena;
	nr = 7;
	condition = dia_elena_trade_condition;
	information = dia_elena_trade_info;
	permanent = TRUE;
	description = "Poka¿ mi, co masz na sprzeda¿!";
	trade = TRUE;
};


func int dia_elena_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_aufgabe) || (ELENA_TRADE_MIT_MIR == TRUE))
	{
		return TRUE;
	};
};

func void dia_elena_trade_info()
{
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//Poka¿ mi swoje towary!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Elena_TRADE_16_01");	//Co mogê ci zaoferowaæ?
};


instance DIA_ELENA_PERM(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_perm_condition;
	information = dia_elena_perm_info;
	permanent = TRUE;
	description = "Czy ostatnio zdarzy³o siê coœ wa¿nego?";
};


func int dia_elena_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_perm_info()
{
	AI_Output(other,self,"DIA_Elena_PERM_15_00");	//Czy ostatnio zdarzy³o siê coœ wa¿nego?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_01");	//Parê dni temu mój ojciec zadecydowa³, ¿e nie wolno nam sprzedawaæ niczego w mieœcie.
		AI_Output(self,other,"DIA_Elena_PERM_16_02");	//Wiêc teraz trzymam siê w pobli¿u farmy i sprzedajê swoje towary przejezdnym.
		ELENA_TRADE_MIT_MIR = TRUE;
	}
	else if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_03");	//Ataki stra¿y na okoliczne farmy staj¹ siê coraz czêstsze. Interwencja mojego ojca jest tylko kwesti¹ czasu.
	}
	else if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_04");	//Okoliczne ziemie sta³y siê bardzo niebezpieczne. Nikt nie zapuszcza siê poza w³asne tereny. Up³ynê³o ju¿ bardzo du¿o czasu, od kiedy którekolwiek z nas by³o w mieœcie.
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_05");	//Najemnicy staj¹ siê coraz bardziej niespokojni. Chocia¿ wydaje mi siê, ¿e od czasu jak opuœci³ nas Sylvio wraz ze swoj¹ dru¿yn¹, i tak s¹ w znacznie lepszej kondycji psychicznej.
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_06");	//Wszyscy mówi¹ o zbli¿aj¹cym siê ataku orków. Ale ja nie wierzê w te pog³oski. S¹dzê, ¿e tutaj, na farmie, jesteœmy bezpieczni.
	};
};


instance DIA_ELENA_MINENANTEIL(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_minenanteil_condition;
	information = dia_elena_minenanteil_info;
	description = "Sprzedajesz udzia³y w kopalni?";
};


func int dia_elena_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_minenanteil_info()
{
	AI_Output(other,self,"DIA_Elena_MINENANTEIL_15_00");	//Sprzedajesz udzia³y w kopalni?
	AI_Output(self,other,"DIA_Elena_MINENANTEIL_16_01");	//No i co z tego? Sama zap³aci³am za nie maj¹tek.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ELENA_PICKPOCKET(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_pickpocket_condition;
	information = dia_elena_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_elena_pickpocket_condition()
{
	return c_beklauen(30,35);
};

func void dia_elena_pickpocket_info()
{
	Info_ClearChoices(dia_elena_pickpocket);
	Info_AddChoice(dia_elena_pickpocket,DIALOG_BACK,dia_elena_pickpocket_back);
	Info_AddChoice(dia_elena_pickpocket,DIALOG_PICKPOCKET,dia_elena_pickpocket_doit);
};

func void dia_elena_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_elena_pickpocket);
};

func void dia_elena_pickpocket_back()
{
	Info_ClearChoices(dia_elena_pickpocket);
};

