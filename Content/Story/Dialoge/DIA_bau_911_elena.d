
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
	description = "Witaj, pi�kna nieznajoma.";
};


func int dia_elena_hallo_condition()
{
	return TRUE;
};

func void dia_elena_hallo_info()
{
	AI_Output(other,self,"DIA_Elena_HALLO_15_00");	//Witaj, pi�kna nieznajoma.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_01");	//Hmmm. Sk�d uciek�e�?
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
	description = "Podobno buntujecie si� przeciwko Kr�lowi?";
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
	AI_Output(other,self,"DIA_Elena_Aufstand_15_00");	//Podobno buntujecie si� przeciwko Kr�lowi?
	AI_Output(self,other,"DIA_Elena_Aufstand_16_01");	//M�j ojciec zadecydowa�, �e najwy�szy czas zadba� o nasze bezpiecze�stwo.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Elena_Aufstand_16_02");	//Stra� i tak nigdy nam nie pomog�a. Interesowa�a ich tylko nasza spi�arnia.
	};
};


instance DIA_ELENA_ARBEIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 3;
	condition = dia_elena_arbeit_condition;
	information = dia_elena_arbeit_info;
	permanent = FALSE;
	description = "Jakiego rodzaju prace prowadzone s� na farmie?";
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
	AI_Output(other,self,"DIA_Elena_Arbeit_15_00");	//Jakiego rodzaju prace prowadzone s� na farmie?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_01");	//M�j ojciec p�aci wszystkim m�czyznom, kt�rzy zgodz� si� broni� farmy.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_02");	//Jeste� zainteresowany? Nie wygl�dasz na osob�, kt�rej marzeniem jest praca na roli.
	AI_Output(other,self,"DIA_Elena_Arbeit_15_03");	//Ile p�aci tw�j ojciec?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_04");	//Musisz to z nim uzgodni�.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_05");	//Wiem tylko, �e ka�dy najemnik codziennie dostaje pieni�dze.
};


instance DIA_ELENA_REGELN(C_INFO)
{
	npc = bau_911_elena;
	nr = 4;
	condition = dia_elena_regeln_condition;
	information = dia_elena_regeln_info;
	permanent = FALSE;
	description = "Czy panuj� tutaj jakie� zasady, o kt�rych powinienem pami�ta�?";
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
	AI_Output(other,self,"DIA_Elena_Regeln_15_00");	//Czy panuj� tutaj jakie� zasady, o kt�rych powinienem pami�ta�?
	AI_Output(self,other,"DIA_Elena_Regeln_16_01");	//Nie dotykaj niczego, co nie nale�y do ciebie.
	AI_Output(self,other,"DIA_Elena_Regeln_16_02");	//Trzymaj si� z daleka od nie swoich spraw.
	AI_Output(self,other,"DIA_Elena_Regeln_16_03");	//Je�li wdasz si� w walk�, trzymaj si� najemnik�w.
	AI_Output(self,other,"DIA_Elena_Regeln_16_04");	//Je�li rozpoczniesz b�jk� z miejscowymi ch�opami, wszyscy obr�c� si� przeciwko tobie.
};


instance DIA_ELENA_AUFGABE(C_INFO)
{
	npc = bau_911_elena;
	nr = 5;
	condition = dia_elena_aufgabe_condition;
	information = dia_elena_aufgabe_info;
	permanent = FALSE;
	description = "Czym si� zajmujesz?";
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
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_01");	//Sprzedaj� towary produkowane na farmie. Gdyby� chcia� co� kupi�, daj mi zna�.
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_02");	//Pozw�l jednak, �e ci� ostrzeg�. Nie znosz� z�odziei, jasne?
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
	description = "Poka� mi, co masz na sprzeda�!";
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
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//Poka� mi swoje towary!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Elena_TRADE_16_01");	//Co mog� ci zaoferowa�?
};


instance DIA_ELENA_PERM(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_perm_condition;
	information = dia_elena_perm_info;
	permanent = TRUE;
	description = "Czy ostatnio zdarzy�o si� co� wa�nego?";
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
	AI_Output(other,self,"DIA_Elena_PERM_15_00");	//Czy ostatnio zdarzy�o si� co� wa�nego?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_01");	//Par� dni temu m�j ojciec zadecydowa�, �e nie wolno nam sprzedawa� niczego w mie�cie.
		AI_Output(self,other,"DIA_Elena_PERM_16_02");	//Wi�c teraz trzymam si� w pobli�u farmy i sprzedaj� swoje towary przejezdnym.
		ELENA_TRADE_MIT_MIR = TRUE;
	}
	else if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_03");	//Ataki stra�y na okoliczne farmy staj� si� coraz cz�stsze. Interwencja mojego ojca jest tylko kwesti� czasu.
	}
	else if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_04");	//Okoliczne ziemie sta�y si� bardzo niebezpieczne. Nikt nie zapuszcza si� poza w�asne tereny. Up�yn�o ju� bardzo du�o czasu, od kiedy kt�rekolwiek z nas by�o w mie�cie.
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_05");	//Najemnicy staj� si� coraz bardziej niespokojni. Chocia� wydaje mi si�, �e od czasu jak opu�ci� nas Sylvio wraz ze swoj� dru�yn�, i tak s� w znacznie lepszej kondycji psychicznej.
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_06");	//Wszyscy m�wi� o zbli�aj�cym si� ataku ork�w. Ale ja nie wierz� w te pog�oski. S�dz�, �e tutaj, na farmie, jeste�my bezpieczni.
	};
};


instance DIA_ELENA_MINENANTEIL(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_minenanteil_condition;
	information = dia_elena_minenanteil_info;
	description = "Sprzedajesz udzia�y w kopalni?";
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
	AI_Output(other,self,"DIA_Elena_MINENANTEIL_15_00");	//Sprzedajesz udzia�y w kopalni?
	AI_Output(self,other,"DIA_Elena_MINENANTEIL_16_01");	//No i co z tego? Sama zap�aci�am za nie maj�tek.
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

