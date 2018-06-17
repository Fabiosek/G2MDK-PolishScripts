
instance DIA_ADDON_RHADEMES_EXIT(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 999;
	condition = dia_addon_rhademes_exit_condition;
	information = dia_addon_rhademes_exit_info;
	permanent = TRUE;
	description = "Sam poszukam drogi! (KONIEC)";
};


func int dia_addon_rhademes_exit_condition()
{
	return TRUE;
};

func void dia_addon_rhademes_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_EXIT_15_00");	//Sam poszukam drogi!
	AI_Output(self,other,"DIA_Addon_Rhademes_EXIT_03_01");	//Jak sobie ¿yczysz...
	AI_StopProcessInfos(self);
};


var int rhademes_understood;

instance DIA_ADDON_RHADEMES_FIRST(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 1;
	condition = dia_addon_rhademes_first_condition;
	information = dia_addon_rhademes_first_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_rhademes_first_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RHADEMES_UNDERSTOOD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_first_info()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_00");	//Mój duch by³ uwiêziony przez ca³¹ wiecznoœæ.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_01");	//W koñcu jestem wolny. Miecz ma NOWEGO powiernika.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_02");	//Ostatnia komnata zosta³a otwarta.
		AI_Output(other,self,"DIA_Addon_Rhademes_First_15_03");	//Ale brama wygl¹da na zamkniêt¹!
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_04");	//To nie jest brama do ostatniej komnaty.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_05");	//TA brama prowadzi do poprzedniego pomieszczenia.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_06");	//Powiernik... zamkn¹³ j¹ za sob¹.
		RHADEMES_UNDERSTOOD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_07");	//Ghanima en Kandra Adanos?
		b_say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_08");	//Bengla anthani!
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_RHADEMES_PFORTE(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 2;
	condition = dia_addon_rhademes_pforte_condition;
	information = dia_addon_rhademes_pforte_info;
	permanent = FALSE;
	description = "Jak mogê otworzyæ bramê?";
};


func int dia_addon_rhademes_pforte_condition()
{
	return TRUE;
};

func void dia_addon_rhademes_pforte_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_00");	//Jak mogê otworzyæ bramê?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_01");	//Przesuñ... jedn¹ z dŸwigni.
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_02");	//Dowoln¹?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_03");	//Wszystkie dŸwignie otwieraj¹ bramê.
};


instance DIA_ADDON_RHADEMES_HEBEL(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 3;
	condition = dia_addon_rhademes_hebel_condition;
	information = dia_addon_rhademes_hebel_info;
	permanent = FALSE;
	description = "Nie wszystkie dŸwignie uruchamiaj¹ pu³apkê, tak?";
};


func int dia_addon_rhademes_hebel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_rhademes_pforte) && !Npc_KnowsInfo(other,dia_addon_rhademes_deinvater))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_hebel_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Hebel_15_00");	//Nie wszystkie dŸwignie uruchamiaj¹ pu³apkê, tak?
	AI_Output(self,other,"DIA_Addon_Rhademes_Hebel_03_01");	//Tak!
};


instance DIA_ADDON_RHADEMES_DONTBELIEVE(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 4;
	condition = dia_addon_rhademes_dontbelieve_condition;
	information = dia_addon_rhademes_dontbelieve_info;
	permanent = FALSE;
	description = "Nie wierzê ci!";
};


func int dia_addon_rhademes_dontbelieve_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_rhademes_pforte) && !Npc_KnowsInfo(other,dia_addon_rhademes_deinvater))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_dontbelieve_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DontBelieve_15_00");	//Nie wierzê ci!
	AI_Output(self,other,"DIA_Addon_Rhademes_DontBelieve_03_01");	//Nie, ja... zawsze mówiê prawdê.
};


instance DIA_ADDON_RHADEMES_DEINVATER(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 5;
	condition = dia_addon_rhademes_deinvater_condition;
	information = dia_addon_rhademes_deinvater_info;
	permanent = FALSE;
	description = "Twój ojciec zbudowa³ tê pu³apkê. Sk¹d mo¿esz wiedzieæ o jej dzia³aniu?";
};


func int dia_addon_rhademes_deinvater_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_rhademes_pforte) && (Npc_HasItems(other,itmi_addon_stone_04) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_deinvater_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_00");	//Twój ojciec zbudowa³ tê pu³apkê. Sk¹d mo¿esz wiedzieæ o jej dzia³aniu?
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_01");	//QUARHODRON! Wci¹¿ s³yszê uderzenia m³ota... po drugiej stronie bramy... od tak dawna...
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_02");	//Miecz... pozwoli³ mi zobaczyæ... jego zemstê... za moj¹ pora¿kê...
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_03");	//To znaczy, ¿e widzia³eœ, która dŸwignia jest w³aœciwa?
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_04");	//Zapomnia³em to bardzo dawno temu.
	Info_ClearChoices(dia_addon_rhademes_deinvater);
	Info_AddChoice(dia_addon_rhademes_deinvater,"No to domyœl siê!",dia_addon_rhademes_deinvater_guess);
	Info_AddChoice(dia_addon_rhademes_deinvater,"Spróbuj sobie przypomnieæ!",dia_addon_rhademes_deinvater_remember);
	Info_AddChoice(dia_addon_rhademes_deinvater,"Myœl!",dia_addon_rhademes_deinvater_think);
};


var int rhademes_fertig;

func void b_addon_rhademes_lever(var int choice)
{
	AI_Output(self,other,"DIA_Addon_Rhademes_Lever_03_00");	//To by³o tak dawno temu...
	AI_StopProcessInfos(self);
	if(choice <= 1)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else if(choice == 2)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	};
	AI_UseMob(self,"LEVER",1);
	RHADEMES_FERTIG = TRUE;
};

func void dia_addon_rhademes_deinvater_think()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Think_15_00");	//Myœl!
	b_addon_rhademes_lever(1);
};

func void dia_addon_rhademes_deinvater_remember()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Remember_15_00");	//Spróbuj sobie przypomnieæ!
	b_addon_rhademes_lever(2);
};

func void dia_addon_rhademes_deinvater_guess()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Guess_15_00");	//No to domyœl siê!
	b_addon_rhademes_lever(3);
};


instance DIA_ADDON_RHADEMES_PERM(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 2;
	condition = dia_addon_rhademes_perm_condition;
	information = dia_addon_rhademes_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_rhademes_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RHADEMES_FERTIG == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_perm_info()
{
	AI_Output(self,other,"DIA_Addon_Rhademes_PERM_03_00");	//Jeœli masz doœæ si³y... wrzuæ go... w morskie odmêty...
	SC_TOOKRHADEMESTRAP = TRUE;
	SC_TALKEDTORHADEMAFTER = TRUE;
	AI_StopProcessInfos(self);
};

