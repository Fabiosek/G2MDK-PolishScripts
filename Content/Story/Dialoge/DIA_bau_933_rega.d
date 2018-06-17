
instance DIA_REGA_EXIT(C_INFO)
{
	npc = bau_933_rega;
	nr = 999;
	condition = dia_rega_exit_condition;
	information = dia_rega_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rega_exit_condition()
{
	return TRUE;
};

func void dia_rega_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_REGA_HALLO(C_INFO)
{
	npc = bau_933_rega;
	nr = 3;
	condition = dia_rega_hallo_condition;
	information = dia_rega_hallo_info;
	description = "Co s�ycha�?";
};


func int dia_rega_hallo_condition()
{
	return TRUE;
};

func void dia_rega_hallo_info()
{
	AI_Output(other,self,"DIA_Rega_HALLO_15_00");	//Jak idzie praca?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_01");	//Jeste� z miasta, prawda?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_02");	//Nale�ysz do najemnik�w Onara, prawda?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_03");	//Jeste� magiem, prawda?
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_04");	//Nie jeste� jednym z nas, h�?
	};
	AI_Output(self,other,"DIA_Rega_HALLO_17_05");	//Lepiej zmykaj st�d...
	AI_Output(other,self,"DIA_Rega_HALLO_15_06");	//Dlaczego?
	AI_Output(self,other,"DIA_Rega_HALLO_17_07");	//To miejsce nigdy nie by�o rajem, ale przynajmniej mieli�my spok�j, pracuj�c dla Sekoba.
	AI_Output(self,other,"DIA_Rega_HALLO_17_08");	//Ostatnio sytuacja sta�a si� nie do zniesienia.
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_09");	//Wsz�dzie grasuj� bandyci, polne bestie niszcz� nasze zbiory, a w�a�ciciel ziemski staje si� coraz bardziej bezwzgl�dny.
	};
};


instance DIA_REGA_ONAR(C_INFO)
{
	npc = bau_933_rega;
	nr = 4;
	condition = dia_rega_onar_condition;
	information = dia_rega_onar_info;
	description = "Czy�by� ba�a si� w�a�ciciela ziemskiego?";
};


func int dia_rega_onar_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_rega_onar_info()
{
	AI_Output(other,self,"DIA_Rega_ONAR_15_00");	//Czy�by� ba�a si� w�a�ciciela?
	AI_Output(self,other,"DIA_Rega_ONAR_17_01");	//Jasne, wystarczy, �e nie spodoba mu si� twoja g�ba, a zaraz na�le na ciebie swoich najemnik�w. Tak ko�czy wielu, kt�rzy maj� jakie� ale.
	AI_Output(self,other,"DIA_Rega_ONAR_17_02");	//Wolimy wi�c trzyma� g�by na k��dk�.
};


instance DIA_REGA_SLD(C_INFO)
{
	npc = bau_933_rega;
	nr = 5;
	condition = dia_rega_sld_condition;
	information = dia_rega_sld_info;
	description = "Czy najemnicy nie powinni zaj�� si� polnymi bestiami?";
};


func int dia_rega_sld_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_rega_sld_info()
{
	AI_Output(other,self,"DIA_Rega_SLD_15_00");	//Czy najemnicy nie powinni zaj�� si� polnymi bestiami?
	AI_Output(self,other,"DIA_Rega_SLD_17_01");	//Nie wiem, za co im p�ac�, ale na pewno nie za pomaganie nam, prostym ludziom.
	AI_Output(self,other,"DIA_Rega_SLD_17_02");	//Sprawa polnych bestii to problem ch�op�w wynajmuj�cych ziemi� od Onara.
};


instance DIA_REGA_BANDITEN(C_INFO)
{
	npc = bau_933_rega;
	nr = 6;
	condition = dia_rega_banditen_condition;
	information = dia_rega_banditen_info;
	description = "Jak chronicie si� przed bandytami?";
};


func int dia_rega_banditen_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo))
	{
		return TRUE;
	};
};

func void dia_rega_banditen_info()
{
	AI_Output(other,self,"DIA_Rega_BANDITEN_15_00");	//Jak chronicie si� przed bandytami?
	AI_Output(self,other,"DIA_Rega_BANDITEN_17_01");	//Nie chronimy si�, uciekamy. C� innego nam pozostaje?
};


instance DIA_REGA_BRONKO(C_INFO)
{
	npc = bau_933_rega;
	nr = 7;
	condition = dia_rega_bronko_condition;
	information = dia_rega_bronko_info;
	description = "(Zapytaj o Bronka)";
};


func int dia_rega_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_bronko_hallo) && (MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_rega_bronko_info()
{
	AI_Output(other,self,"DIA_Rega_BRONKO_15_00");	//Kto najbardziej daje si� wam we znaki?
	AI_Output(self,other,"DIA_Rega_BRONKO_17_01");	//Nie zrozum mnie �le, ale mam do�� k�opot�w. Id� porozmawiaj z kim innym.
	AI_StopProcessInfos(self);
};


instance DIA_REGA_PERMKAP1(C_INFO)
{
	npc = bau_933_rega;
	nr = 7;
	condition = dia_rega_permkap1_condition;
	information = dia_rega_permkap1_info;
	permanent = TRUE;
	description = "G�owa do g�ry.";
};


func int dia_rega_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo))
	{
		return TRUE;
	};
};

func void dia_rega_permkap1_info()
{
	AI_Output(other,self,"DIA_Rega_PERMKAP1_15_00");	//Uszy do g�ry.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_01");	//�atwo powiedzie�. W ko�cu mieszkasz w mie�cie.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_02");	//Gdyby z wami, najemnikami, nie by�o tyle problem�w, reszta sama by si� jako� u�o�y�a.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_03");	//Z dnia na dzie� widujemy coraz mniej mag�w. Mam nadziej�, �e nie jeste� ostatni. Potrzebujemy was bardziej ni� kiedykolwiek.
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_04");	//To nie�atwe, kiedy pracuje si� dla kogo� tak bezwzgl�dnego jak Sekob, nadzorca niewolnik�w.
	};
	AI_StopProcessInfos(self);
};


instance DIA_REGA_PICKPOCKET(C_INFO)
{
	npc = bau_933_rega;
	nr = 900;
	condition = dia_rega_pickpocket_condition;
	information = dia_rega_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_rega_pickpocket_condition()
{
	return c_beklauen(25,40);
};

func void dia_rega_pickpocket_info()
{
	Info_ClearChoices(dia_rega_pickpocket);
	Info_AddChoice(dia_rega_pickpocket,DIALOG_BACK,dia_rega_pickpocket_back);
	Info_AddChoice(dia_rega_pickpocket,DIALOG_PICKPOCKET,dia_rega_pickpocket_doit);
};

func void dia_rega_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rega_pickpocket);
};

func void dia_rega_pickpocket_back()
{
	Info_ClearChoices(dia_rega_pickpocket);
};

