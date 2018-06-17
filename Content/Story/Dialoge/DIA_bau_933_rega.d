
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
	description = "Co s³ychaæ?";
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
		AI_Output(self,other,"DIA_Rega_HALLO_17_01");	//Jesteœ z miasta, prawda?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_02");	//Nale¿ysz do najemników Onara, prawda?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_03");	//Jesteœ magiem, prawda?
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_04");	//Nie jesteœ jednym z nas, hê?
	};
	AI_Output(self,other,"DIA_Rega_HALLO_17_05");	//Lepiej zmykaj st¹d...
	AI_Output(other,self,"DIA_Rega_HALLO_15_06");	//Dlaczego?
	AI_Output(self,other,"DIA_Rega_HALLO_17_07");	//To miejsce nigdy nie by³o rajem, ale przynajmniej mieliœmy spokój, pracuj¹c dla Sekoba.
	AI_Output(self,other,"DIA_Rega_HALLO_17_08");	//Ostatnio sytuacja sta³a siê nie do zniesienia.
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_09");	//Wszêdzie grasuj¹ bandyci, polne bestie niszcz¹ nasze zbiory, a w³aœciciel ziemski staje siê coraz bardziej bezwzglêdny.
	};
};


instance DIA_REGA_ONAR(C_INFO)
{
	npc = bau_933_rega;
	nr = 4;
	condition = dia_rega_onar_condition;
	information = dia_rega_onar_info;
	description = "Czy¿byœ ba³a siê w³aœciciela ziemskiego?";
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
	AI_Output(other,self,"DIA_Rega_ONAR_15_00");	//Czy¿byœ ba³a siê w³aœciciela?
	AI_Output(self,other,"DIA_Rega_ONAR_17_01");	//Jasne, wystarczy, ¿e nie spodoba mu siê twoja gêba, a zaraz naœle na ciebie swoich najemników. Tak koñczy wielu, którzy maj¹ jakieœ ale.
	AI_Output(self,other,"DIA_Rega_ONAR_17_02");	//Wolimy wiêc trzymaæ gêby na k³ódkê.
};


instance DIA_REGA_SLD(C_INFO)
{
	npc = bau_933_rega;
	nr = 5;
	condition = dia_rega_sld_condition;
	information = dia_rega_sld_info;
	description = "Czy najemnicy nie powinni zaj¹æ siê polnymi bestiami?";
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
	AI_Output(other,self,"DIA_Rega_SLD_15_00");	//Czy najemnicy nie powinni zaj¹æ siê polnymi bestiami?
	AI_Output(self,other,"DIA_Rega_SLD_17_01");	//Nie wiem, za co im p³ac¹, ale na pewno nie za pomaganie nam, prostym ludziom.
	AI_Output(self,other,"DIA_Rega_SLD_17_02");	//Sprawa polnych bestii to problem ch³opów wynajmuj¹cych ziemiê od Onara.
};


instance DIA_REGA_BANDITEN(C_INFO)
{
	npc = bau_933_rega;
	nr = 6;
	condition = dia_rega_banditen_condition;
	information = dia_rega_banditen_info;
	description = "Jak chronicie siê przed bandytami?";
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
	AI_Output(other,self,"DIA_Rega_BANDITEN_15_00");	//Jak chronicie siê przed bandytami?
	AI_Output(self,other,"DIA_Rega_BANDITEN_17_01");	//Nie chronimy siê, uciekamy. Có¿ innego nam pozostaje?
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
	AI_Output(other,self,"DIA_Rega_BRONKO_15_00");	//Kto najbardziej daje siê wam we znaki?
	AI_Output(self,other,"DIA_Rega_BRONKO_17_01");	//Nie zrozum mnie Ÿle, ale mam doœæ k³opotów. IdŸ porozmawiaj z kim innym.
	AI_StopProcessInfos(self);
};


instance DIA_REGA_PERMKAP1(C_INFO)
{
	npc = bau_933_rega;
	nr = 7;
	condition = dia_rega_permkap1_condition;
	information = dia_rega_permkap1_info;
	permanent = TRUE;
	description = "G³owa do góry.";
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
	AI_Output(other,self,"DIA_Rega_PERMKAP1_15_00");	//Uszy do góry.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_01");	//£atwo powiedzieæ. W koñcu mieszkasz w mieœcie.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_02");	//Gdyby z wami, najemnikami, nie by³o tyle problemów, reszta sama by siê jakoœ u³o¿y³a.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_03");	//Z dnia na dzieñ widujemy coraz mniej magów. Mam nadziejê, ¿e nie jesteœ ostatni. Potrzebujemy was bardziej ni¿ kiedykolwiek.
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_04");	//To nie³atwe, kiedy pracuje siê dla kogoœ tak bezwzglêdnego jak Sekob, nadzorca niewolników.
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

