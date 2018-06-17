
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
	AI_Output(self,other,"DIA_Addon_Rhademes_EXIT_03_01");	//Jak sobie �yczysz...
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
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_00");	//M�j duch by� uwi�ziony przez ca�� wieczno��.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_01");	//W ko�cu jestem wolny. Miecz ma NOWEGO powiernika.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_02");	//Ostatnia komnata zosta�a otwarta.
		AI_Output(other,self,"DIA_Addon_Rhademes_First_15_03");	//Ale brama wygl�da na zamkni�t�!
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_04");	//To nie jest brama do ostatniej komnaty.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_05");	//TA brama prowadzi do poprzedniego pomieszczenia.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_06");	//Powiernik... zamkn�� j� za sob�.
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
	description = "Jak mog� otworzy� bram�?";
};


func int dia_addon_rhademes_pforte_condition()
{
	return TRUE;
};

func void dia_addon_rhademes_pforte_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_00");	//Jak mog� otworzy� bram�?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_01");	//Przesu�... jedn� z d�wigni.
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_02");	//Dowoln�?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_03");	//Wszystkie d�wignie otwieraj� bram�.
};


instance DIA_ADDON_RHADEMES_HEBEL(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 3;
	condition = dia_addon_rhademes_hebel_condition;
	information = dia_addon_rhademes_hebel_info;
	permanent = FALSE;
	description = "Nie wszystkie d�wignie uruchamiaj� pu�apk�, tak?";
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
	AI_Output(other,self,"DIA_Addon_Rhademes_Hebel_15_00");	//Nie wszystkie d�wignie uruchamiaj� pu�apk�, tak?
	AI_Output(self,other,"DIA_Addon_Rhademes_Hebel_03_01");	//Tak!
};


instance DIA_ADDON_RHADEMES_DONTBELIEVE(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 4;
	condition = dia_addon_rhademes_dontbelieve_condition;
	information = dia_addon_rhademes_dontbelieve_info;
	permanent = FALSE;
	description = "Nie wierz� ci!";
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
	AI_Output(other,self,"DIA_Addon_Rhademes_DontBelieve_15_00");	//Nie wierz� ci!
	AI_Output(self,other,"DIA_Addon_Rhademes_DontBelieve_03_01");	//Nie, ja... zawsze m�wi� prawd�.
};


instance DIA_ADDON_RHADEMES_DEINVATER(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 5;
	condition = dia_addon_rhademes_deinvater_condition;
	information = dia_addon_rhademes_deinvater_info;
	permanent = FALSE;
	description = "Tw�j ojciec zbudowa� t� pu�apk�. Sk�d mo�esz wiedzie� o jej dzia�aniu?";
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
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_00");	//Tw�j ojciec zbudowa� t� pu�apk�. Sk�d mo�esz wiedzie� o jej dzia�aniu?
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_01");	//QUARHODRON! Wci�� s�ysz� uderzenia m�ota... po drugiej stronie bramy... od tak dawna...
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_02");	//Miecz... pozwoli� mi zobaczy�... jego zemst�... za moj� pora�k�...
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_03");	//To znaczy, �e widzia�e�, kt�ra d�wignia jest w�a�ciwa?
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_04");	//Zapomnia�em to bardzo dawno temu.
	Info_ClearChoices(dia_addon_rhademes_deinvater);
	Info_AddChoice(dia_addon_rhademes_deinvater,"No to domy�l si�!",dia_addon_rhademes_deinvater_guess);
	Info_AddChoice(dia_addon_rhademes_deinvater,"Spr�buj sobie przypomnie�!",dia_addon_rhademes_deinvater_remember);
	Info_AddChoice(dia_addon_rhademes_deinvater,"My�l!",dia_addon_rhademes_deinvater_think);
};


var int rhademes_fertig;

func void b_addon_rhademes_lever(var int choice)
{
	AI_Output(self,other,"DIA_Addon_Rhademes_Lever_03_00");	//To by�o tak dawno temu...
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
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Think_15_00");	//My�l!
	b_addon_rhademes_lever(1);
};

func void dia_addon_rhademes_deinvater_remember()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Remember_15_00");	//Spr�buj sobie przypomnie�!
	b_addon_rhademes_lever(2);
};

func void dia_addon_rhademes_deinvater_guess()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Guess_15_00");	//No to domy�l si�!
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
	AI_Output(self,other,"DIA_Addon_Rhademes_PERM_03_00");	//Je�li masz do�� si�y... wrzu� go... w morskie odm�ty...
	SC_TOOKRHADEMESTRAP = TRUE;
	SC_TALKEDTORHADEMAFTER = TRUE;
	AI_StopProcessInfos(self);
};

