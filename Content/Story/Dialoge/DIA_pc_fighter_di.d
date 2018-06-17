
instance DIA_GORN_DI_KAP5_EXIT(C_INFO)
{
	npc = pc_fighter_di;
	nr = 999;
	condition = dia_gorn_di_kap5_exit_condition;
	information = dia_gorn_di_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorn_di_kap5_exit_condition()
{
	return TRUE;
};

func void dia_gorn_di_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORN_DI_HALLO(C_INFO)
{
	npc = pc_fighter_di;
	nr = 2;
	condition = dia_gorn_di_hallo_condition;
	information = dia_gorn_di_hallo_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_gorn_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_gorn_di_hallo_info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Hallo_15_00");	//Wszystko w porz¹dku?
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Gorn_DI_Hallo_12_01");	//Jak na razie. Wiesz, ¿e mam ochotê na dobr¹ rozróbê!
	}
	else
	{
		AI_Output(self,other,"DIA_Gorn_DI_Hallo_12_02");	//Gdybyœ spotka³ wiêcej tych orków, przyœlij ich koniecznie do mnie. Dopiero siê rozgrzewam.
	};
};


instance DIA_GORN_DI_TEACH(C_INFO)
{
	npc = pc_fighter_di;
	nr = 10;
	condition = dia_gorn_di_teach_condition;
	information = dia_gorn_di_teach_info;
	permanent = TRUE;
	description = "Chcê trochê potrenowaæ.";
};


func int dia_gorn_di_teach_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_gorn_di_teach_info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Teach_15_00");	//Chcê trochê potrenowaæ.
	AI_Output(self,other,"DIA_Gorn_DI_Teach_12_01");	//Fakt. Przyda ci siê.
	Info_ClearChoices(dia_gorn_di_teach);
	Info_AddChoice(dia_gorn_di_teach,DIALOG_BACK,dia_gorn_di_teach_back);
	Info_AddChoice(dia_gorn_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_gorn_di_teach_2h_5);
	Info_AddChoice(dia_gorn_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_gorn_di_teach_2h_1);
};

func void dia_gorn_di_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_1_12_00");	//W Kolonii by³eœ w du¿o lepszej formie.
	};
	Info_ClearChoices(dia_gorn_di_teach);
	Info_AddChoice(dia_gorn_di_teach,DIALOG_BACK,dia_gorn_di_teach_back);
	Info_AddChoice(dia_gorn_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_gorn_di_teach_2h_5);
	Info_AddChoice(dia_gorn_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_gorn_di_teach_2h_1);
};

func void dia_gorn_di_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_5_12_00");	//Spróbuj trzymaæ orê¿ trochê wy¿ej. Tak¹ gard¹ nie sparujesz nawet laski niewidomego.
	};
	Info_ClearChoices(dia_gorn_di_teach);
	Info_AddChoice(dia_gorn_di_teach,DIALOG_BACK,dia_gorn_di_teach_back);
	Info_AddChoice(dia_gorn_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_gorn_di_teach_2h_5);
	Info_AddChoice(dia_gorn_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_gorn_di_teach_2h_1);
};

func void dia_gorn_di_teach_back()
{
	Info_ClearChoices(dia_gorn_di_teach);
};


instance DIA_GORN_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_fighter_di;
	nr = 2;
	condition = dia_gorn_di_undeaddragondead_condition;
	information = dia_gorn_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Zosta³eœ na statku?";
};


func int dia_gorn_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_gorn_di_undeaddragondead_onetime;

func void dia_gorn_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_00");	//Zosta³eœ na statku?
	AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_01");	//Jasne. Pomyœl, co by by³o, gdybyœ go nie zasta³ po powrocie!
	if(DIA_GORN_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_02");	//Co bêdzie dalej?
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_03");	//Pewnie nic. Zamierzam wróciæ do domu.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_04");	//Do domu? Czyli dok¹d? Nie wiedzia³em, ¿e masz coœ takiego jak dom.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_05");	//Mam lepsz¹ propozycjê: poszukajmy jakieœ tawerny i ur¿nijmy siê do nieprzytomnoœci.
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_06");	//Hmmm. Mo¿e...
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_07");	//No, ch³opie, wyluzuj! Ju¿ po wszystkim!
		};
		DIA_GORN_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	if(Npc_KnowsInfo(other,dia_biff_di_plunder))
	{
		AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_08");	//Ktoœ musi daæ znaæ Biffowi albo zgnije na tej wyspie.
		if(Npc_IsDead(biff_di) == FALSE)
		{
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_09");	//Spokojnie. Bêdzie na czas.
		};
	};
	AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_10");	//Nie mamy tu ju¿ nic do roboty. Ka¿ kapitanowi podnosiæ kotwicê.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_FIGHTER_DI_PICKPOCKET(C_INFO)
{
	npc = pc_fighter_di;
	nr = 900;
	condition = dia_fighter_di_pickpocket_condition;
	information = dia_fighter_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_fighter_di_pickpocket_condition()
{
	return c_beklauen(10,45);
};

func void dia_fighter_di_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_di_pickpocket);
	Info_AddChoice(dia_fighter_di_pickpocket,DIALOG_BACK,dia_fighter_di_pickpocket_back);
	Info_AddChoice(dia_fighter_di_pickpocket,DIALOG_PICKPOCKET,dia_fighter_di_pickpocket_doit);
};

func void dia_fighter_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fighter_di_pickpocket);
};

func void dia_fighter_di_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_di_pickpocket);
};

