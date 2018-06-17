
instance DIA_GUNNAR_EXIT(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 999;
	condition = dia_gunnar_exit_condition;
	information = dia_gunnar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gunnar_exit_condition()
{
	return TRUE;
};

func void dia_gunnar_exit_info()
{
	AI_StopProcessInfos(self);
};


var int gunnar_hallogesagt;

instance DIA_GUNNAR_HALLO(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 1;
	condition = dia_gunnar_hallo_condition;
	information = dia_gunnar_hallo_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_gunnar_hallo_condition()
{
	return TRUE;
};

func void dia_gunnar_hallo_info()
{
	AI_Output(other,self,"DIA_Gunnar_Hallo_15_00");	//Co tam?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_01");	//Odk�d Onar og�osi�, �e zatrudnia najemnik�w, wsz�dzie a� si� roi od opryszk�w.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_02");	//Zlaz�a si� tutaj ca�a ho�ota, kt�ra wcze�niej nie mia�a odwagi wyle�� z lasu.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_03");	//Teraz schodz� si� ze wszystkich stron.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_04");	//A wi�c ty r�wnie� jeste� teraz najemnikiem?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_05");	//Niech Innos b�dzie z tob�!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_06");	//Ludzie z miasta nie s� tu mile widziani.
	};
	GUNNAR_HALLOGESAGT = TRUE;
};


instance DIA_GUNNAR_EVERYWHERE(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 2;
	condition = dia_gunnar_everywhere_condition;
	information = dia_gunnar_everywhere_info;
	permanent = TRUE;
	description = "Najemnicy przybywaj� ze wszystkich stron?";
};


func int dia_gunnar_everywhere_condition()
{
	if(GUNNAR_HALLOGESAGT == TRUE)
	{
		return TRUE;
	};
};

func void dia_gunnar_everywhere_info()
{
	AI_Output(other,self,"DIA_Gunnar_Everywhere_15_00");	//Najemnicy przybywaj� ze wszystkich stron?
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_01");	//Wi�kszo�� z nich pochodzi z kolonii karnej.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_02");	//Inna grupa najemnik�w przyby�a z po�udnia, gdzie pewnie ugania�a si� za orkami.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_03");	//Za�o�� si�, �e paru bandyt�w opu�ci�o g�ry, �eby tutaj przyby�! Zwabi�o ich darmowe �arcie!
};


instance DIA_GUNNAR_SOUTH(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 3;
	condition = dia_gunnar_south_condition;
	information = dia_gunnar_south_info;
	permanent = TRUE;
	description = "Co wiesz na temat najemnik�w z po�udnia?";
};


func int dia_gunnar_south_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_south_info()
{
	AI_Output(other,self,"DIA_Gunnar_South_15_00");	//Co wiesz na temat najemnik�w z po�udnia?
	AI_Output(self,other,"DIA_Gunnar_South_10_01");	//Niewiele. Z tego co wiem, polowali tam na ork�w.
	AI_Output(self,other,"DIA_Gunnar_South_10_02");	//Ich szefem jest Sylvio. Bullko, Sentenza, Raoul i paru innych to jego ludzie.
};


instance DIA_GUNNAR_COLONY(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 4;
	condition = dia_gunnar_colony_condition;
	information = dia_gunnar_colony_info;
	permanent = TRUE;
	description = "Kto pochodzi z Kolonii?";
};


func int dia_gunnar_colony_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_colony_info()
{
	AI_Output(other,self,"DIA_Gunnar_Colony_15_00");	//Kto pochodzi z Kolonii?
	AI_Output(self,other,"DIA_Gunnar_Colony_10_01");	//Lee i jego ludzie. Torlof, Cord, Jarvis, Wilk i jeszcze paru innych.
};


instance DIA_GUNNAR_BANDITS(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 5;
	condition = dia_gunnar_bandits_condition;
	information = dia_gunnar_bandits_info;
	permanent = TRUE;
	description = "O jakich bandyt�w ci chodzi?";
};


func int dia_gunnar_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_bandits_info()
{
	AI_Output(other,self,"DIA_Gunnar_Bandits_15_00");	//O jakich bandyt�w ci chodzi?
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_01");	//Tak tylko gadam. Tak naprawd� nie jestem do ko�ca pewien.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_02");	//Na po�udniu znajduj� si� opuszczone kopalnie. W niekt�rych ukrywaj� si� bandyci.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_03");	//Oni r�wnie� s� skaza�cami z Kolonii, tak jak wi�kszo�� najemnik�w, kt�rych tutaj spotkasz.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_04");	//Jedyna r�nica polega na tym, �e to jeszcze gorsze �cierwo. Zabij� ka�dego, kto podejdzie zbyt blisko.
};


instance DIA_GUNNAR_PICKPOCKET(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 900;
	condition = dia_gunnar_pickpocket_condition;
	information = dia_gunnar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gunnar_pickpocket_condition()
{
	return c_beklauen(45,70);
};

func void dia_gunnar_pickpocket_info()
{
	Info_ClearChoices(dia_gunnar_pickpocket);
	Info_AddChoice(dia_gunnar_pickpocket,DIALOG_BACK,dia_gunnar_pickpocket_back);
	Info_AddChoice(dia_gunnar_pickpocket,DIALOG_PICKPOCKET,dia_gunnar_pickpocket_doit);
};

func void dia_gunnar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gunnar_pickpocket);
};

func void dia_gunnar_pickpocket_back()
{
	Info_ClearChoices(dia_gunnar_pickpocket);
};

