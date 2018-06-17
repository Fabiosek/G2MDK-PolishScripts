
instance DIA_GEPPERT_EXIT(C_INFO)
{
	npc = strf_1115_geppert;
	nr = 999;
	condition = dia_geppert_exit_condition;
	information = dia_geppert_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_geppert_exit_condition()
{
	return TRUE;
};

func void dia_geppert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEPPERT_HALLO(C_INFO)
{
	npc = strf_1115_geppert;
	nr = 4;
	condition = dia_geppert_hallo_condition;
	information = dia_geppert_hallo_info;
	important = TRUE;
};


func int dia_geppert_hallo_condition()
{
	return TRUE;
};


var int kervo_gotstuff;

func void dia_geppert_hallo_info()
{
	if((Npc_IsDead(kervo) == FALSE) && (KERVO_GOTSTUFF == FALSE))
	{
		if(hero.guild == GIL_KDF)
		{
			CreateInvItems(kervo,itmi_runeblank,1);
		}
		else
		{
			CreateInvItems(kervo,itmi_nugget,1);
		};
		KERVO_GOTSTUFF = TRUE;
	};
	AI_Output(self,other,"DIA_Geppert_HALLO_10_00");	//Sta�! Kto idzie?
	AI_Output(self,other,"DIA_Geppert_HALLO_10_01");	//Nie chcesz mnie chyba wys�a� z powrotem do kopalni rudy, prawda?
	AI_Output(self,other,"DIA_Geppert_HALLO_10_02");	//Musz� ci� rozczarowa�. Nie wr�c� tam za nic w �wiecie.
	Info_ClearChoices(dia_geppert_hallo);
	Info_AddChoice(dia_geppert_hallo,"Co tutaj robisz?",dia_geppert_hallo_wasmachtihr);
	Info_AddChoice(dia_geppert_hallo,"Jeste� zbieg�ym wi�niem, prawda?",dia_geppert_hallo_flucht);
};

func void dia_geppert_hallo_flucht()
{
	AI_Output(other,self,"DIA_Geppert_HALLO_Flucht_15_00");	//Jeste� zbieg�ym wi�niem, prawda?
	AI_Output(self,other,"DIA_Geppert_HALLO_Flucht_10_01");	//Prosz�, jaki jeste� domy�lny. Z jakiego innego powodu m�g�bym siedzie� w tej zat�ch�ej norze?
	Info_ClearChoices(dia_geppert_hallo);
};

func void dia_geppert_hallo_wasmachtihr()
{
	AI_Output(other,self,"DIA_Geppert_HALLO_Wasmachtihr_15_00");	//Co tutaj robisz?
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_01");	//Co to za krety�skie pytanie? Chowam si� przed wami, �o�nierzami.
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_02");	//Przesta� kombinowa�. Albo od razu mnie zabij, albo spadaj st�d.
	}
	else
	{
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_03");	//G�upie pytanie. Ukrywam si�. Te �winie ze stra�y wsz�dzie maj� swoich szpieg�w.
	};
	AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_04");	//Nie dam si� ponownie wys�a� do kopalni, i ju�.
	Info_ClearChoices(dia_geppert_hallo);
};


instance DIA_GEPPERT_BRATEN(C_INFO)
{
	npc = strf_1115_geppert;
	nr = 5;
	condition = dia_geppert_braten_condition;
	information = dia_geppert_braten_info;
	permanent = TRUE;
	description = "Ta piecze� pachnie wspaniale.";
};


func int dia_geppert_braten_condition()
{
	if(Npc_KnowsInfo(other,dia_geppert_hallo))
	{
		return TRUE;
	};
};

func void dia_geppert_braten_info()
{
	AI_Output(other,self,"DIA_Geppert_BRATEN_15_00");	//Ta piecze� pachnie wspaniale.
	AI_Output(self,other,"DIA_Geppert_BRATEN_10_01");	//Nie dotykaj!
	AI_StopProcessInfos(self);
};


instance DIA_GEPPERT_PICKPOCKET(C_INFO)
{
	npc = strf_1115_geppert;
	nr = 900;
	condition = dia_geppert_pickpocket_condition;
	information = dia_geppert_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_geppert_pickpocket_condition()
{
	return c_beklauen(56,5);
};

func void dia_geppert_pickpocket_info()
{
	Info_ClearChoices(dia_geppert_pickpocket);
	Info_AddChoice(dia_geppert_pickpocket,DIALOG_BACK,dia_geppert_pickpocket_back);
	Info_AddChoice(dia_geppert_pickpocket,DIALOG_PICKPOCKET,dia_geppert_pickpocket_doit);
};

func void dia_geppert_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_geppert_pickpocket);
};

func void dia_geppert_pickpocket_back()
{
	Info_ClearChoices(dia_geppert_pickpocket);
};

