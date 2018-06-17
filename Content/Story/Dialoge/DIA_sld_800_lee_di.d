
instance DIA_LEE_DI_EXIT(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 999;
	condition = dia_lee_di_exit_condition;
	information = dia_lee_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_di_exit_condition()
{
	return TRUE;
};

func void dia_lee_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_DI_HALLO(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 2;
	condition = dia_lee_di_hallo_condition;
	information = dia_lee_di_hallo_info;
	description = "Czym chcesz si� zaj��?";
};


func int dia_lee_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_di_hallo_info()
{
	AI_Output(other,self,"DIA_Lee_DI_Hallo_15_00");	//Czym chcesz si� zaj��?
	AI_Output(self,other,"DIA_Lee_DI_Hallo_04_01");	//Kto� musi pilnowa� statku. Zostan� tutaj i dopilnuj�, �eby� mia� do czego wraca�.
};


instance DIA_LEE_DI_PERM6(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 2;
	condition = dia_lee_di_perm6_condition;
	information = dia_lee_di_perm6_info;
	permanent = TRUE;
	description = "Co s�ycha� na statku?";
};


func int dia_lee_di_perm6_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_di_hallo) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_di_perm6_info()
{
	AI_Output(other,self,"DIA_Lee_DI_PERM6_15_00");	//Co s�ycha� na statku?
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_DI_PERM6_04_01");	//Bez obaw. Wszystko jest pod kontrol�.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_DI_PERM6_04_02");	//Wszystko w porz�dku. Nie mog� si� ju� doczeka� powrotu tych t�pych ork�w. Ch�tnie spuszcz� im kolejne lanie.
	};
	AI_StopProcessInfos(self);
};


instance DIA_LEE_DI_TEACH(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 10;
	condition = dia_lee_di_teach_condition;
	information = dia_lee_di_teach_info;
	permanent = TRUE;
	description = "Szukam dobrego nauczyciela.";
};


func int dia_lee_di_teach_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_di_teach_info()
{
	AI_Output(other,self,"DIA_Lee_DI_Teach_15_00");	//Szukam dobrego nauczyciela.
	AI_Output(self,other,"DIA_Lee_DI_Teach_04_01");	//A czego dok�adnie chcia�by� si� nauczy�?
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_1h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_1_04_00");	//Twoja umiej�tno�� parowania cios�w jest jeszcze �a�osna, ale jako� sobie poradzisz.
	};
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_1h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_5_04_00");	//Jeste� za sztywny w nadgarstkach. Nie �ciskaj broni tak kurczowo.
	};
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00");	//Pami�taj: si�a ciosu bierze si� z bioder, a nie z ramion.
	};
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00");	//Najsilniejszy cios nic nie znaczy, je�li nie trafi w cel. U�ywaj swojej si�y z wi�kszym wyczuciem.
	};
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_back()
{
	Info_ClearChoices(dia_lee_di_teach);
};


instance DIA_LEE_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 2;
	condition = dia_lee_di_undeaddragondead_condition;
	information = dia_lee_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Mo�emy rusza� w drog�.";
};


func int dia_lee_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_lee_di_undeaddragondead_onetime;

func void dia_lee_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_00");	//Mo�emy rusza�. Nieprzyjaciel zosta� pokonany.
	AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_01");	//�wietnie! W takim razie ka� kapitanowi podnosi� kotwic�.
	if((DIA_LEE_DI_UNDEADDRAGONDEAD_ONETIME == FALSE) && (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_02");	//Ale zabierzesz mnie na kontynent, prawda?
		AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_03");	//Oczywi�cie. Khorinis jako� sobie poradzi bez ciebie.
		AI_Output(self,other,"DIA_Lee_Add_04_26");	//A potem mog� z�o�y� niezapowiedzian� wizyt� naszemu Kr�lowi.
		AI_Output(self,other,"DIA_Lee_Add_04_27");	//D�ugo czeka�em na tak� okazj�...
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_05");	//Jak my�lisz? Cierpliwo�� chyba zas�uguje na nagrod�.
		AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_06");	//Cierpliwo�� i odpowiednio mocne... argumenty.
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_07");	//No w�a�nie! Tym razem nie obejdzie si� bez rozr�by. Walka u twojego boku to prawdziwy zaszczyt.
		DIA_LEE_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_08");	//Mam nadziej�, �e nasze drogi jeszcze si� kiedy� skrzy�uj�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_LEE_DI_PICKPOCKET(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 900;
	condition = dia_lee_di_pickpocket_condition;
	information = dia_lee_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_lee_di_pickpocket_condition()
{
	return c_beklauen(110,570);
};

func void dia_lee_di_pickpocket_info()
{
	Info_ClearChoices(dia_lee_di_pickpocket);
	Info_AddChoice(dia_lee_di_pickpocket,DIALOG_BACK,dia_lee_di_pickpocket_back);
	Info_AddChoice(dia_lee_di_pickpocket,DIALOG_PICKPOCKET,dia_lee_di_pickpocket_doit);
};

func void dia_lee_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lee_di_pickpocket);
};

func void dia_lee_di_pickpocket_back()
{
	Info_ClearChoices(dia_lee_di_pickpocket);
};

