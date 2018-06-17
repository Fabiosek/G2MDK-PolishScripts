
instance DIA_1061_WACHE_EXIT(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 999;
	condition = dia_1061_wache_exit_condition;
	information = dia_1061_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_1061_wache_exit_condition()
{
	return TRUE;
};

func void dia_1061_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1061_WACHE_HALLO(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 1;
	condition = dia_1061_wache_hallo_condition;
	information = dia_1061_wache_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_1061_wache_hallo_condition()
{
	return TRUE;
};

func void dia_1061_wache_hallo_info()
{
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_00");	//St�j! T�dy nie przejdziesz.
	AI_Output(other,self,"DIA_1061_Wache_Hallo_15_01");	//Chc� rozmawia� z twoim przyw�dc�.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_02");	//Ach, rozumiem, chcesz porozmawia� z moim szefem. W takim razie OCZYWI�CIE ci� przepuszcz�.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_03");	//Ale tylko pod warunkiem, �e wiesz, jak si� nazywa. Bo je�li nie, to b�d� musia� ci� zabi�. A wi�c?
	Info_ClearChoices(dia_1061_wache_hallo);
	Info_AddChoice(dia_1061_wache_hallo,"Lee.",dia_1061_wache_hallo_lee);
	if((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE))
	{
		Info_AddChoice(dia_1061_wache_hallo,"Dexter.",dia_1061_wache_hallo_dexter);
	};
	Info_AddChoice(dia_1061_wache_hallo,"Diego.",dia_1061_wache_hallo_diego);
	Info_AddChoice(dia_1061_wache_hallo,"Nie mam poj�cia.",dia_1061_wache_hallo_ahnung);
};

func void dia_1061_wache_hallo_lee()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Lee_15_00");	//Lee.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Lee_01_01");	//Hmmm, jakby to uj��... W�a�nie po�egna�e� si� z �yciem, facet!
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};

func void dia_1061_wache_hallo_dexter()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Dexter_15_00");	//Dexter.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_01");	//No dobrze... Wygl�da na to, �e rzeczywi�cie znasz szefa. Dobrze, przepuszcz� ci�. Ale uwa�aj!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_02");	//Je�li za bardzo si� do kogo� zbli�ysz, nie wyjdziesz st�d �ywy!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_03");	//We� wi�c g��boki oddech i nie wyci�gaj broni. Dextera znajdziesz w domu.
	KNOWS_DEXTER = TRUE;
	banditguard.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
};

func void dia_1061_wache_hallo_diego()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Diego_15_00");	//Diego.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_01");	//Prawda!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_02");	//Nie, tylko �artowa�em. Nie masz poj�cia, kto jest moim szefem.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_03");	//Nie ma wi�c �adnego powodu, dla kt�rego nie mia�bym ci� zabi�.
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};

func void dia_1061_wache_hallo_ahnung()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Ahnung_15_00");	//Nie mam poj�cia.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Ahnung_01_01");	//A wi�c zginiesz, g�upcze!
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};


instance DIA_1061_WACHE_PERM(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 2;
	condition = dia_1061_wache_perm_condition;
	information = dia_1061_wache_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_1061_wache_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_1061_wache_perm_info()
{
	AI_Output(self,other,"DIA_1061_Wache_Perm_01_00");	//Pami�taj, zachowuj si� spokojnie, a wyjdziesz st�d �ywy.
	AI_StopProcessInfos(self);
};

