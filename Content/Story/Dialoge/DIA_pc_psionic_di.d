
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
	description = "Jest coœ, o czym powinienem wiedzieæ?";
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
	AI_Output(other,self,"DIA_Lester_DI_Hello_15_00");	//Jest coœ, o czym powinienem wiedzieæ?
	if((Npc_IsDead(mario_di) == FALSE) && (ORKSTURMDI == TRUE) && (DIA_LESTER_DI_SCGOTWARNING1 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_01");	//Mario wymkn¹³ siê ze statku podczas ataku orków. Mia³em na niego oko mimo ca³ego tego zamieszania.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_02");	//Przemaszerowa³ sobie przez liniê orków i nikt go nie zatrzymywa³.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_03");	//Od samego pocz¹tku coœ mi siê w nim nie podoba³o. To szpieg!
		b_giveplayerxp(XP_AMBIENT);
		DIA_LESTER_DI_SCGOTWARNING1 = TRUE;
	}
	else if((Npc_IsDead(mario_di) == FALSE) && (DIA_LESTER_DI_SCGOTWARNING2 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_04");	//Coœ mi siê nie podoba w tym ca³ym Mario. Facet roztacza wokó³ siebie jak¹œ dziwn¹ aurê.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_05");	//Uwa¿aj na siebie, przyjacielu.
		DIA_LESTER_DI_SCGOTWARNING2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_06");	//Nie teraz. Mo¿e póŸniej.
	};
};


instance DIA_LESTER_DI_MARIOARSCH(C_INFO)
{
	npc = pc_psionic_di;
	nr = 2;
	condition = dia_lester_di_marioarsch_condition;
	information = dia_lester_di_marioarsch_info;
	description = "Mia³eœ racjê. Mario nas zdradzi³!";
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
	AI_Output(other,self,"DIA_Lester_DI_MarioArsch_15_00");	//Mia³eœ racjê. Mario nas zdradzi³!
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_01");	//A widzisz? Mo¿e i nie jestem zbyt bystry, ale co do tego nie mia³em ¿adnych w¹tpliwoœci.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_02");	//Na przysz³oœæ staraj siê lepiej dobieraæ towarzyszy podró¿y.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_PC_LESTER_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_psionic_di;
	nr = 5;
	condition = dia_pc_lester_di_undeaddragondead_condition;
	information = dia_pc_lester_di_undeaddragondead_info;
	permanent = TRUE;
	description = "D³ugo tu ju¿ nie zabawimy.";
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
	AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_00");	//D³ugo tu ju¿ nie zabawimy.
	if(DIA_PC_LESTER_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		if(Npc_GetDistToWP(self,"DI_DRACONIANAREA_19") < 4000)
		{
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01");	//Mój ból g³owy nagle ust¹pi³!
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02");	//Jak to zrobi³eœ?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_03");	//Pokona³em nieprzyjaciela.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04");	//To musia³o byæ coœ naprawdê potê¿nego. Co dok³adnie?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_05");	//Smok-o¿ywieniec.
		};
		if(SC_KNOWSMADPSI == TRUE)
		{
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_06");	//Twoi dawni kompani z obozu na bagnie dali mi nieŸle popaliæ.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07");	//Tak. Wiara czyni cuda. Zawsze tak by³o. Szkoda tylko, ¿e s³u¿yli z³emu.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08");	//Sporo czasu minie, nim siê z tego otrz¹snê.
		};
		DIA_PC_LESTER_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09");	//Mam nadziejê, ¿e coœ takiego ju¿ nigdy siê nie powtórzy. Na ca³ym œwiecie nie ma tyle ziela, ile mam teraz ochotê wypaliæ!
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

