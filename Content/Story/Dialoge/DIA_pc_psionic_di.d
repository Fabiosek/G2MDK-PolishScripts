
instance DIA_LESTER_DI_EXIT(C_INFO)
{
	npc = pc_psionic_di;
	nr = 999;
	condition = dia_lester_di_exit_condition;
	information = dia_lester_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_di_exit_condition()
{
	return TRUE;
};

func void dia_lester_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_DI_HELLO(C_INFO)
{
	npc = pc_psionic_di;
	nr = 1;
	condition = dia_lester_di_hello_condition;
	information = dia_lester_di_hello_info;
	permanent = TRUE;
	description = "Jest co�, o czym powinienem wiedzie�?";
};


func int dia_lester_di_hello_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};


var int dia_lester_di_scgotwarning1;
var int dia_lester_di_scgotwarning2;

func void dia_lester_di_hello_info()
{
	AI_Output(other,self,"DIA_Lester_DI_Hello_15_00");	//Jest co�, o czym powinienem wiedzie�?
	if((Npc_IsDead(mario_di) == FALSE) && (ORKSTURMDI == TRUE) && (DIA_LESTER_DI_SCGOTWARNING1 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_01");	//Mario wymkn�� si� ze statku podczas ataku ork�w. Mia�em na niego oko mimo ca�ego tego zamieszania.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_02");	//Przemaszerowa� sobie przez lini� ork�w i nikt go nie zatrzymywa�.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_03");	//Od samego pocz�tku co� mi si� w nim nie podoba�o. To szpieg!
		b_giveplayerxp(XP_AMBIENT);
		DIA_LESTER_DI_SCGOTWARNING1 = TRUE;
	}
	else if((Npc_IsDead(mario_di) == FALSE) && (DIA_LESTER_DI_SCGOTWARNING2 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_04");	//Co� mi si� nie podoba w tym ca�ym Mario. Facet roztacza wok� siebie jak�� dziwn� aur�.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_05");	//Uwa�aj na siebie, przyjacielu.
		DIA_LESTER_DI_SCGOTWARNING2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_06");	//Nie teraz. Mo�e p�niej.
	};
};


instance DIA_LESTER_DI_MARIOARSCH(C_INFO)
{
	npc = pc_psionic_di;
	nr = 2;
	condition = dia_lester_di_marioarsch_condition;
	information = dia_lester_di_marioarsch_info;
	description = "Mia�e� racj�. Mario nas zdradzi�!";
};


func int dia_lester_di_marioarsch_condition()
{
	if(((DIA_LESTER_DI_SCGOTWARNING2 == TRUE) || (DIA_LESTER_DI_SCGOTWARNING2 == TRUE)) && (MIS_MARIO_AMBUSH == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lester_di_marioarsch_info()
{
	AI_Output(other,self,"DIA_Lester_DI_MarioArsch_15_00");	//Mia�e� racj�. Mario nas zdradzi�!
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_01");	//A widzisz? Mo�e i nie jestem zbyt bystry, ale co do tego nie mia�em �adnych w�tpliwo�ci.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_02");	//Na przysz�o�� staraj si� lepiej dobiera� towarzyszy podr�y.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_PC_LESTER_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_psionic_di;
	nr = 5;
	condition = dia_pc_lester_di_undeaddragondead_condition;
	information = dia_pc_lester_di_undeaddragondead_info;
	permanent = TRUE;
	description = "D�ugo tu ju� nie zabawimy.";
};


func int dia_pc_lester_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_pc_lester_di_undeaddragondead_onetime;

func void dia_pc_lester_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_00");	//D�ugo tu ju� nie zabawimy.
	if(DIA_PC_LESTER_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		if(Npc_GetDistToWP(self,"DI_DRACONIANAREA_19") < 4000)
		{
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01");	//M�j b�l g�owy nagle ust�pi�!
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02");	//Jak to zrobi�e�?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_03");	//Pokona�em nieprzyjaciela.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04");	//To musia�o by� co� naprawd� pot�nego. Co dok�adnie?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_05");	//Smok-o�ywieniec.
		};
		if(SC_KNOWSMADPSI == TRUE)
		{
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_06");	//Twoi dawni kompani z obozu na bagnie dali mi nie�le popali�.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07");	//Tak. Wiara czyni cuda. Zawsze tak by�o. Szkoda tylko, �e s�u�yli z�emu.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08");	//Sporo czasu minie, nim si� z tego otrz�sn�.
		};
		DIA_PC_LESTER_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09");	//Mam nadziej�, �e co� takiego ju� nigdy si� nie powt�rzy. Na ca�ym �wiecie nie ma tyle ziela, ile mam teraz ochot� wypali�!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_PSIONIC_DI_PICKPOCKET(C_INFO)
{
	npc = pc_psionic_di;
	nr = 900;
	condition = dia_psionic_di_pickpocket_condition;
	information = dia_psionic_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_psionic_di_pickpocket_condition()
{
	return c_beklauen(56,25);
};

func void dia_psionic_di_pickpocket_info()
{
	Info_ClearChoices(dia_psionic_di_pickpocket);
	Info_AddChoice(dia_psionic_di_pickpocket,DIALOG_BACK,dia_psionic_di_pickpocket_back);
	Info_AddChoice(dia_psionic_di_pickpocket,DIALOG_PICKPOCKET,dia_psionic_di_pickpocket_doit);
};

func void dia_psionic_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_psionic_di_pickpocket);
};

func void dia_psionic_di_pickpocket_back()
{
	Info_ClearChoices(dia_psionic_di_pickpocket);
};

