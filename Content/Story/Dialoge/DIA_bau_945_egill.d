
instance DIA_EGILL_EXIT(C_INFO)
{
	npc = bau_945_egill;
	nr = 999;
	condition = dia_egill_exit_condition;
	information = dia_egill_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_egill_exit_condition()
{
	return TRUE;
};

func void dia_egill_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EGILL_HALLO(C_INFO)
{
	npc = bau_945_egill;
	nr = 3;
	condition = dia_egill_hallo_condition;
	information = dia_egill_hallo_info;
	description = "Co s³ychaæ?";
};


func int dia_egill_hallo_condition()
{
	return TRUE;
};

func void dia_egill_hallo_info()
{
	AI_Output(other,self,"DIA_Egill_HALLO_15_00");	//Co tam?
	AI_Output(self,other,"DIA_Egill_HALLO_08_01");	//Jeœli odwiedzaj¹ nas jacyœ przybysze, to przewa¿nie nie w pokojowych zamiarach.
	AI_Output(self,other,"DIA_Egill_HALLO_08_02");	//Mam nadziejê, ¿e siê nie mylê co do ciebie.
	AI_Output(self,other,"DIA_Egill_HALLO_08_03");	//Jestem Egill.
	if(Hlp_IsValidNpc(ehnim) && !c_npcisdown(ehnim))
	{
		AI_Output(self,other,"DIA_Egill_HALLO_08_04");	//A ten dziwak, którego tam widzisz, to mój brat Ehnim.
	};
};


instance DIA_EGILL_FELDARBEIT(C_INFO)
{
	npc = bau_945_egill;
	nr = 4;
	condition = dia_egill_feldarbeit_condition;
	information = dia_egill_feldarbeit_info;
	description = "Jak id¹ prace w polu?";
};


func int dia_egill_feldarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_hallo))
	{
		return TRUE;
	};
};

func void dia_egill_feldarbeit_info()
{
	AI_Output(other,self,"DIA_Egill_FELDARBEIT_15_00");	//Jak id¹ prace w polu?
	AI_Output(self,other,"DIA_Egill_FELDARBEIT_08_01");	//Wspaniale. Gdyby tylko polne bestie nie niszczy³y naszych plonów...
};


instance DIA_EGILL_FELDRAEUBER(C_INFO)
{
	npc = bau_945_egill;
	nr = 5;
	condition = dia_egill_feldraeuber_condition;
	information = dia_egill_feldraeuber_info;
	description = "Czemu nic z nimi nie zrobicie?";
};


func int dia_egill_feldraeuber_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_feldarbeit))
	{
		return TRUE;
	};
};

func void dia_egill_feldraeuber_info()
{
	AI_Output(other,self,"DIA_Egill_FELDRAEUBER_15_00");	//Czemu nic z nimi nie zrobicie?
	AI_Output(self,other,"DIA_Egill_FELDRAEUBER_08_01");	//¯artujesz chyba. Od kiedy tutaj mieszkam, zabi³em ju¿ ich tyle, ¿e ca³kiem straci³em rachubê.
	AI_Output(self,other,"DIA_Egill_FELDRAEUBER_08_02");	//Niestety, wci¹¿ ich przybywa.
};


instance DIA_EGILL_STREIT2(C_INFO)
{
	npc = bau_945_egill;
	nr = 6;
	condition = dia_egill_streit2_condition;
	information = dia_egill_streit2_info;
	description = "Twój brat opowiedzia³ podobn¹ historiê.";
};


func int dia_egill_streit2_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_feldraeuber) && Npc_KnowsInfo(other,dia_ehnim_feldraeuber) && (Hlp_IsValidNpc(ehnim) && !c_npcisdown(ehnim)))
	{
		return TRUE;
	};
};

func void dia_egill_streit2_info()
{
	AI_Output(other,self,"DIA_Egill_STREIT2_15_00");	//Twój brat opowiedzia³ podobn¹ historiê.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_01");	//Taaak? A co dok³adnie powiedzia³?
	AI_Output(other,self,"DIA_Egill_STREIT2_15_02");	//Twierdzi, ¿e on równie¿ zabi³ mnóstwo polnych bestii.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_03");	//Co? Ten dureñ nie trafi³by sam do domu!
	AI_Output(self,other,"DIA_Egill_STREIT2_08_04");	//Powiedz mu, ¿e nie powinien siê tak przechwalaæ.
	AI_StopProcessInfos(self);
};


instance DIA_EGILL_STREIT4(C_INFO)
{
	npc = bau_945_egill;
	nr = 7;
	condition = dia_egill_streit4_condition;
	information = dia_egill_streit4_info;
	description = "Ehnim jest odrobinê poirytowany z powodu ca³ej tej sprawy.";
};


func int dia_egill_streit4_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_streit3) && (Hlp_IsValidNpc(ehnim) && !c_npcisdown(ehnim)))
	{
		return TRUE;
	};
};

func void dia_egill_streit4_info()
{
	AI_Output(other,self,"DIA_Egill_STREIT4_15_00");	//Ehnim jest odrobinê poirytowany z powodu ca³ej tej sprawy.
	AI_Output(self,other,"DIA_Egill_STREIT4_08_01");	//Niech siê za bardzo nie nadyma, bo spuszczê mu lanie. Mo¿esz mu to ode mnie przekazaæ.
	AI_StopProcessInfos(self);
};


instance DIA_EGILL_PERMKAP1(C_INFO)
{
	npc = bau_945_egill;
	condition = dia_egill_permkap1_condition;
	information = dia_egill_permkap1_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_egill_permkap1_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_egill_permkap1_info()
{
	AI_Output(self,other,"DIA_Egill_PERMKAP1_08_00");	//Czy nie narobi³eœ ju¿ dosyæ szkód? Lepiej idŸ sobie.
	AI_StopProcessInfos(self);
};


instance DIA_EGILL_PICKPOCKET(C_INFO)
{
	npc = bau_945_egill;
	nr = 900;
	condition = dia_egill_pickpocket_condition;
	information = dia_egill_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_egill_pickpocket_condition()
{
	return c_beklauen(45,24);
};

func void dia_egill_pickpocket_info()
{
	Info_ClearChoices(dia_egill_pickpocket);
	Info_AddChoice(dia_egill_pickpocket,DIALOG_BACK,dia_egill_pickpocket_back);
	Info_AddChoice(dia_egill_pickpocket,DIALOG_PICKPOCKET,dia_egill_pickpocket_doit);
};

func void dia_egill_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_egill_pickpocket);
};

func void dia_egill_pickpocket_back()
{
	Info_ClearChoices(dia_egill_pickpocket);
};

