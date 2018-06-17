
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
	description = "Co s³ychaæ?";
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
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_01");	//Odk¹d Onar og³osi³, ¿e zatrudnia najemników, wszêdzie a¿ siê roi od opryszków.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_02");	//Zlaz³a siê tutaj ca³a ho³ota, która wczeœniej nie mia³a odwagi wyleŸæ z lasu.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_03");	//Teraz schodz¹ siê ze wszystkich stron.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_04");	//A wiêc ty równie¿ jesteœ teraz najemnikiem?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_05");	//Niech Innos bêdzie z tob¹!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_06");	//Ludzie z miasta nie s¹ tu mile widziani.
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
	description = "Najemnicy przybywaj¹ ze wszystkich stron?";
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
	AI_Output(other,self,"DIA_Gunnar_Everywhere_15_00");	//Najemnicy przybywaj¹ ze wszystkich stron?
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_01");	//Wiêkszoœæ z nich pochodzi z kolonii karnej.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_02");	//Inna grupa najemników przyby³a z po³udnia, gdzie pewnie ugania³a siê za orkami.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_03");	//Za³o¿ê siê, ¿e paru bandytów opuœci³o góry, ¿eby tutaj przybyæ! Zwabi³o ich darmowe ¿arcie!
};


instance DIA_GUNNAR_SOUTH(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 3;
	condition = dia_gunnar_south_condition;
	information = dia_gunnar_south_info;
	permanent = TRUE;
	description = "Co wiesz na temat najemników z po³udnia?";
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
	AI_Output(other,self,"DIA_Gunnar_South_15_00");	//Co wiesz na temat najemników z po³udnia?
	AI_Output(self,other,"DIA_Gunnar_South_10_01");	//Niewiele. Z tego co wiem, polowali tam na orków.
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
	description = "O jakich bandytów ci chodzi?";
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
	AI_Output(other,self,"DIA_Gunnar_Bandits_15_00");	//O jakich bandytów ci chodzi?
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_01");	//Tak tylko gadam. Tak naprawdê nie jestem do koñca pewien.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_02");	//Na po³udniu znajduj¹ siê opuszczone kopalnie. W niektórych ukrywaj¹ siê bandyci.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_03");	//Oni równie¿ s¹ skazañcami z Kolonii, tak jak wiêkszoœæ najemników, których tutaj spotkasz.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_04");	//Jedyna ró¿nica polega na tym, ¿e to jeszcze gorsze œcierwo. Zabij¹ ka¿dego, kto podejdzie zbyt blisko.
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

